Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B781DC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 20:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6C810E364;
	Thu, 27 Jun 2024 20:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+ZXYaaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55A210E364
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 20:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719520319; x=1751056319;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9OOWB63ZGRY0+OjRL1CfbLhLjbX7nqdppReH8TJ5/Ec=;
 b=S+ZXYaaaC3ZEJ/oMsL0xgI4sMMGB7qJRemRrPIWExvnv6MUQni4MiYfF
 FXnDcWLLtqhCSMEaxc0GgE2+yoOUCpE9I6+SM/6vNs4jENVzTsRStWZzO
 t5mXWTNOLVko4Tyi9RkPFYNDucusPDrEz0RbgA5hSUeZcjLZC691zsOsJ
 ws5axKlMY1DrkFEsUVzmf6CSjiIzDZJzGddi+afV6pxrODKZJ+CpLE6ba
 0XvgFZ6Se++wEh09OtqcmIHk4/fThs7N9mN+m0p+xhooggdNw7UFrZt5D
 GhtH1lHxHTC0NkwEVJy30hBpXRhdQrYLJTvTo/EjGZhEkeynluZ3JDO3x g==;
X-CSE-ConnectionGUID: ILJOdshDQKiL/4FJpXFLDA==
X-CSE-MsgGUID: WCzFdNZoR9GDS6+Nm0DQfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="39197671"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="39197671"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 13:31:58 -0700
X-CSE-ConnectionGUID: hVmqaoH9SbOg2H3/suHhtg==
X-CSE-MsgGUID: VCMhyJieS3KXAy27GmvRlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="48838117"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 13:31:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 13:31:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 13:31:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 13:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRj2OQ0WtNdOKp3mypN59ipyyn5eqCqX6taU/bRaWcAWWIO4JbHKaW0fq20ASPw1uzyHTv3z45m1zbsvaVQS9+njfBVtHLMzBzqnFsqixeL33M/LJD4ELr4wSayOvKxn3PXSYXVUiNtdXr2cH/jKvFHCizSnwMQPkAhJBnagMJFqnCcozfBgSP4TdcdZhxGrXR+9BNebgBTr/FaiZ/UeFxe3qstFTf/7dKMVvjn6qnFKVv3Gy8ZDWrosognVra228LrDXGFQGxP3Nq/MoWkh++oAVeOa5pDRw5dx3VyGL4LMOt0VD+qGFEuezXlny2cSB+Til7NBOW0EI7uVNhiuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPGRbZjVZHJJQS1BT/HFzMbnAq/oyAYNEDrClxKLVGQ=;
 b=WjbPURpvhkWHywsPSoaZiRlYrjoyqCEiOPDUmwwf4GpNEn37oubLE1Bv+8Jpp2Ay2HpwynbhoJw9wkGfD/yf5bs/AUosHvswKRrHC/h4SzI5UlMeHnnWeJvg9vPxaB/t4GEzA0+wmPgJuveeLHFfht0GeIvfEvhI5W1Rmay0pj2PWCeBy6U3jlJPU0ZvNd4L2o0OqbcUUtugSlQ8nDSu7/rrW9U2wVVm+A9BT6qx75I16H3CKhM0cRMFHmcaY8EJU2x10xZWdCQAuRrRCQL80CX5wR5oRfwVZ5Mw0kXDThVGYAqbe7onXgpPOZQVlDYFA8XZIwV5M2QBWqPDBbqS+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 20:31:44 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 20:31:43 +0000
Date: Thu, 27 Jun 2024 13:31:42 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 1/2] drm/xe: Use a helper to get delta run ticks from the
 exec queue
Message-ID: <Zn3MLsmFw1fnaJK+@orsosgc001>
References: <20240627172348.84991-1-umesh.nerlige.ramappa@intel.com>
 <20240627172348.84991-2-umesh.nerlige.ramappa@intel.com>
 <kv6aazz5pvucxo64xenzu6zyss3vk32ibja7a6clvf4khnsg7y@22fr4yhyg5ug>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <kv6aazz5pvucxo64xenzu6zyss3vk32ibja7a6clvf4khnsg7y@22fr4yhyg5ug>
X-ClientProxiedBy: SJ0PR05CA0196.namprd05.prod.outlook.com
 (2603:10b6:a03:330::21) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 96eeeb0e-5d4c-40a3-9947-08dc96e82898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkYxNitCNkViZDZ4TUk4LzZMMmIzbFNjeVpvZmNoaVpTL2lmQ2NnNzZUTTZV?=
 =?utf-8?B?ZjVlZnNySitsNHpkZVVPMExlaTBzK1BLSkRHVkJFcHdQVzJna0RobjY2QnRr?=
 =?utf-8?B?VUZ1alhXd2I3b0N3VzJvL0p0Z3ZyZm9iTUlOSE4wN1B5dTZQUGNSWFZudEl1?=
 =?utf-8?B?cGM2RmpIejBjRWZSL2ZRTUcwTTFMY0g5UlczOU1SQzFxZFdnQ3pIYlFGeHhE?=
 =?utf-8?B?aThLY3RnK093WXU3Y21SSXF1M2pjd2d4cEFIejFtM1dldmwvZGxIa3Jka1Ju?=
 =?utf-8?B?Q1A3RG1MR05ZVVN6V2plRTgybDRMNGhwbWRrcnNuelVuWVB5Mk1uM3Y3U2NO?=
 =?utf-8?B?dnZYRGR3V0NMYkxxYzNSbE9DKzNGL2Y4VmZ2MXE1Q1JnZlExSzY0RW1KZ214?=
 =?utf-8?B?NFRyNE5UTEVmd3Rva1ZkZUNNUTRUOTZBQUV2SDBxRG9wTHJ4bjVKNlQzQW90?=
 =?utf-8?B?RitXMDU1MVI5bTlVRlByV3FLU1pSOUR0Unc4RXR2bWozNVN5Y1E3U2t6YzRO?=
 =?utf-8?B?eXVZek42WExBSXRtai9IdG0wMzRwLzRPV0twZXdwVXk5dy95MU5MZG9VM3Zp?=
 =?utf-8?B?U3Zob0xhdTh3MWdYYWtKZUU3NFA5YWFOVXd4Mjl6aXlpWlIvT2NQNlVoci9t?=
 =?utf-8?B?YUhsMmE4VllZQm83R3Z5cFZpcUNrNEpGbitHQjhRN2lqT20weUIrT25LUVNp?=
 =?utf-8?B?bnRXUGdKNWZGeVpuUk5ualMxTHFiNDZjaVB2WWdUaThScForRU5ZUkQrQ3BW?=
 =?utf-8?B?RXE2alF0T3c4MTA5Qm80azkvdThPRkJaVXFxeHFRZHhMREhrMEZtdVZnQWR6?=
 =?utf-8?B?QmR6a0YvY3RDcWRQOUR6UFdoSGxOK3VZU2MzbDVXQXE3NE1FcjVBbTdHUEJv?=
 =?utf-8?B?TU5naFpMYW1PYm1xbXlHQzlSU2dnL3ViakUwVzI0SENoaUpHV05aSENoSkdF?=
 =?utf-8?B?K0dWdWdOSWtER3c3VXBLOUZNbVN5NmJVYkxTNW0rbFVNblUzeW1SZGg3cVV5?=
 =?utf-8?B?NDU1N2F0dTNLVFRBc2MxL3RrYk0rTXBqRFNZdHRZMGJNOUtvdWgxbVVSVnhH?=
 =?utf-8?B?c1oyOXQ5YlM5ZEZRMGpHZDBEcTFGcUJuRnNhYmp5YnVzbkRxWlkvRnZxbDht?=
 =?utf-8?B?cUM2MktqN2ZYdWpJUSszb29WdzF4bytaanhCNDE3SDE5dE1Pb2xpNDEzdlhC?=
 =?utf-8?B?d3RWQUY1ZkZseW1lV2c0WWdGMktpemhBRVZYN1pBZVJSZUx1RERLWVdtUnJU?=
 =?utf-8?B?MHFDaTVoRHE0dm5Td1ZMbHQ4RSt2ckpyYVM2emkzb2dLYUszSmFvbGVUVFM2?=
 =?utf-8?B?eEF4TW9MNzl6dFRLY1lsY1pHcE42ZFoyczc0eW1oR0dBZUQzaThSRUZaUlVE?=
 =?utf-8?B?Z1llalJrSFV2aDJZM3AvZVB3b284Y09NbjY0Z25OOFBzQ2gvMy95QlYxU1NO?=
 =?utf-8?B?dThJOGVlSmNRSlJydlRKRFJPb2xCenJPNGxqMnB1aUsvWDQ4RVcyWmJnaGZK?=
 =?utf-8?B?RWlnTlc0c1FvTGVDak5zbS9RZGtkdFB0cm1nYW92M3pJRWQ0cXBlQ1dnK2V0?=
 =?utf-8?B?Z1hFVXRXNlJnd2RXbW00QjhaT3pVV0c2aWlacWVRbE4vQTJPckQ5azFBaWli?=
 =?utf-8?B?eHpSZXMzdWoxMEpkekhvSnFoV0FBQldLeURyYUhJVVR4RHhUSmN5VGdlVjRX?=
 =?utf-8?B?ZzZJOEZIbkdscG9vamQ0anAyN2NVQmlQcTRsOXc1S3lseEs0OThXVW80dXo4?=
 =?utf-8?B?WGEwNEdDSkF6dUdZRUdiaFEwOGxORk5EN1dJNjdjNjJMQkNWdmFmZ0g2WUo2?=
 =?utf-8?B?RlJnbDF3TWc1QUxtNmZCdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnBNRENRbUU0WXJ3RHRLOU9ZVmZ6ZUJwdXBkd3lSempHZWdJOEpOSTZwNHZn?=
 =?utf-8?B?QnAwZXVQS3BPUjVYU2FRdG5ZTUlvU2pISnJnMGt1b3pXaUd2RCtzdVg3RFpF?=
 =?utf-8?B?QS9CTWgrZUJSQkpGVXFJRklIM3V5N1EyRWFWbjBwc2FGZjd5UGp1Z2VxNFQr?=
 =?utf-8?B?NzRpcmVva3FVMUh1MFhyQXh4NmQ0aTZlL3BzTGpSRThEMyt0Z29GUFhoUUFB?=
 =?utf-8?B?d09uM2hFdmduaGxPMTBPQ0NVV1FnY2M0OWE0UEpVWHNDMzZmN2xpS1U5ZzJI?=
 =?utf-8?B?T2tEZVBXTmlLcFU4ZlRKcEcrWlhjamlKZVJybHB4VlY4VVlLRVh5RDRhcUpN?=
 =?utf-8?B?Yll1Qjh1UVgySXNzLzdROVlsTlk5UkJ1Y3I0LzVudEVCbUR4ZHNqWTZUaFZF?=
 =?utf-8?B?TFY4YnlGWngxZ2k4Q0dxbHF1emRoMUMwekFabmR4cGs4d1kzd2pxVXJINzd4?=
 =?utf-8?B?NnBtSC9iOFNuSlhDblo4RDk3QWYzMGZTK3NxaVdwNWdQL1FvTjVqWFo1NVN5?=
 =?utf-8?B?eHpoSDlGQ0lzdHhhS0ZFQzR2cC95N0ZxdVorZjZ4T2NLQVpzQkZBMHFlbU5J?=
 =?utf-8?B?Rkw1TTFEbi9HT3JZSWk0VXVJTzhFQ0VqakNuMzNCRVBldGdZSFJrNHRNYTc3?=
 =?utf-8?B?T05lYjFUN2JRZEp2cmpnZlRrQ2lRbm43RmljZlE3VmV3eXE4emZFNUZSSzJy?=
 =?utf-8?B?ekFhWlVJMVhtWnNtb25PaWxvRkRFZ1FFNzNYTUxCcXhSR245ZjM3alJBWG1a?=
 =?utf-8?B?YkViL2d0SGxJRnowdmJNaG5hdTVyN1hVaGdWRFg1UTdobGt5UkpYa3VGS3lY?=
 =?utf-8?B?am9xOXEzakNOWUg2SXpoNkZhRy9ydERPenQ4S3BwL1JPcmZMUHY1anptK1JG?=
 =?utf-8?B?bXhYOU5FWWtTa3JMUWhnQlVuNnNvTFV2ZFdGUk9aNHordG1vVEluaUsvQjdR?=
 =?utf-8?B?aFFhYyt6T3E0NHhDOWt3VkVmME1OVXFDME9JU2JqNUhid1Q1WjRpVjFWVDBK?=
 =?utf-8?B?R2NDRFdSWVFuQmxpTlhnZGNMY3FLRXdSQ2thNVllVG1TRFR0Q0hSd0NualVI?=
 =?utf-8?B?ekdvWXgrMmlDaC85cWdOOXRNcTlRRVpNN1BHMDBaQXVUZENXNy9UY0FIRDRV?=
 =?utf-8?B?UThtaUxCTlkzZDlabGs0OEdDUnpzV1BleFFtU1ZHSHduMWwwL0xqb0kyRXRP?=
 =?utf-8?B?QUVNalJPUHVOazBWT0ptWWhSZUI3RzR2TzdhS1dxL25PdEJsbDNZMld1L0ht?=
 =?utf-8?B?d0pnNHJLalJLdXlHNlV0K09uZDJ3QWc0eVFGc0VpUXBCZUFvMWZGb1lJSitU?=
 =?utf-8?B?bWUwRktmSFM3Tm9jZUZmYTJrRW1DT2ltNXc3cTlXdndYT1F3WTRwZWRXcm5r?=
 =?utf-8?B?dm9MdDRXakJEYnVvOGdka051OE5hbUw2M05vVEJOY0JKTWtiQ2tlR0lMWUhv?=
 =?utf-8?B?UFhHR21KdEg3dGdRbHdLSGxVbEdGK3NrSzFYUjcrMUNQMXUwbWU4L284VGhE?=
 =?utf-8?B?Q01JczZwekZlVUNMUnJ3d1g1VnNtdUhTZGtrNGNVNE03U2sxZHNKcy8vR005?=
 =?utf-8?B?Vnh2TDVxUzlNVEIzVENYN1FNbzhkNWN3ZVJ6empsRjVXQ1c2VWNNVHBRMU5r?=
 =?utf-8?B?Lzd3RHRWNnR2ZG4zVnZPNE9mSDRtSmYzOXhueFN4ZGdWdytKMUV0N2JJSFNo?=
 =?utf-8?B?cUt1dDlHU3pCa3ZKS3pEaUxIZWVvd2lrdEdJZWJ0eXNFb2ZoZ1Z3NGh4OUc4?=
 =?utf-8?B?L2Nuci9jalNscG44eG44NmhWamNMd05XaEIvdkZIaTJKT0Uyem10d1FOUEx5?=
 =?utf-8?B?TFBEOTBIOUprbDZzZ29vZGNoK0FidkIxSi8zN2VXS0l5bDJhKzNJWHNGckc3?=
 =?utf-8?B?OXRmNHAvUGZQeWc0US9IOXBlQWZsUzJPUFBYaEpHOUQ3L1dpTGlQbnRDZ09F?=
 =?utf-8?B?bmlpelMvOEFaNVBKZkFqbEpMU1dnNE40S0h1ZExIYS9XTS9kd20wWlRKNmVz?=
 =?utf-8?B?b0NQQ0RPTGV3aTZsTVY5TXRRNEJ6Q3RjSGR3SHo4STZJQU41YWI3RFBJc2JZ?=
 =?utf-8?B?U0dyejFYdmZkTnJhdkl4TmdGcTN4c2ViaXQ3WEFZOGN1WDBaTS9MYjNxY2lZ?=
 =?utf-8?B?YWxiekJCalZNUm9PVnA3ZXFrcXN0bjErSkVJNlNZV0RNb2prdnpHQm5wcXJq?=
 =?utf-8?Q?w00F0WdkL3mMqhAX2AK09Vo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96eeeb0e-5d4c-40a3-9947-08dc96e82898
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 20:31:43.8883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WItILHaYs79dK/dskTGurB50+OMMAXOF2lPk9u5t3xGPM+EA2IntIrXtJvHq+tUFaBMfs5e6DnPpftEPuspRs1tmyFwbcq3LqNNZLFzlrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 27, 2024 at 03:24:23PM -0500, Lucas De Marchi wrote:
>On Fri, Jun 28, 2024 at 01:23:47AM GMT, Umesh Nerlige Ramappa wrote:
>>As per earlier review feedback - code manipulating exec queue fields
>>should not be present in xe_device.c. Use a helper to get the delta run
>>ticks from exec queue.
>>
>>v2: Drop the Fixes tag
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>I think the names are not very good for what this is doing now.  It's
>not clear *_delta_xxxx  will flush the previous accumulated values.
>
>Maybe it'd be better to have:
>
>	xe_exec_queue_accumulate_run_ticks();
>	xef->run_ticks[q->class] += xe_exec_queue_flush_run_ticks(q);
>
>So names are clearer and you don't have a function that does 2 things.

Sure, I will rename them.

Regards,
Umesh
>
>Lucas De Marchi
>
>>---
>>drivers/gpu/drm/xe/xe_drm_client.c |  7 ++-----
>>drivers/gpu/drm/xe/xe_exec_queue.c | 18 ++++++++++++++++++
>>drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
>>3 files changed, 21 insertions(+), 5 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>index 4a19b771e3a0..e0c4a50d372c 100644
>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>@@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>
>>	/* Accumulate all the exec queues from this client */
>>	mutex_lock(&xef->exec_queue.lock);
>>-	xa_for_each(&xef->exec_queue.xa, i, q) {
>>-		xe_exec_queue_update_run_ticks(q);
>>-		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
>>-		q->old_run_ticks = q->run_ticks;
>>-	}
>>+	xa_for_each(&xef->exec_queue.xa, i, q)
>>+		xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
>>	mutex_unlock(&xef->exec_queue.lock);
>>
>>	/* Get the total GPU cycles */
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>index 0ba37835849b..4d90a16745d2 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>@@ -786,6 +786,24 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>>	q->run_ticks += (new_ts - old_ts) * q->width;
>>}
>>
>>+/**
>>+ * xe_exec_queue_delta_run_ticks() - Get delta of queue run_ticks
>>+ * @q: The exec queue
>>+ *
>>+ * Update run ticks for the specific queue and then return the delta when
>>+ * compared to the previous value of run ticks.
>>+ */
>>+u64 xe_exec_queue_delta_run_ticks(struct xe_exec_queue *q)
>>+{
>>+	u64 delta_ticks;
>>+
>>+	xe_exec_queue_update_run_ticks(q);
>>+	delta_ticks = q->run_ticks - q->old_run_ticks;
>>+	q->old_run_ticks = q->run_ticks;
>>+
>>+	return delta_ticks;
>>+}
>>+
>>void xe_exec_queue_kill(struct xe_exec_queue *q)
>>{
>>	struct xe_exec_queue *eq = q, *next;
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>>index 289a3a51d2a2..42f683e5d88a 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.h
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>>@@ -76,5 +76,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>>void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>>				  struct dma_fence *fence);
>>void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>>+u64 xe_exec_queue_delta_run_ticks(struct xe_exec_queue *q);
>>
>>#endif
>>-- 
>>2.34.1
>>
