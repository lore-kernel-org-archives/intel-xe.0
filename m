Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21401F43854
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 17:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F2E10E255;
	Wed, 15 Apr 2026 17:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+72z2Gx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A7A10E255
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 17:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776272602; x=1807808602;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N+CysWoDmoD4Ab0boTxWQGTztD+Ti+lXKo7tJ6fEGs4=;
 b=B+72z2GxSCoZ5xYkYvdChf1Anqy07530ONEJNH+PaMOCO91S0EMaHuRg
 47gcoDSGND0uYNpcZ7/dOj7XXZRxEJt1PD8XjeIBKonvC733nBwDpAfFr
 V2ZpjVmyXWPS8QC8h32EFB5wOpDJCHsxORUmo97hnWuVHP4d+tocn5XTn
 ncjYbVboqiP2ltN2PW9qVXypR0FRGyeFaLY02QR2fd028ePdfZ8/E7Gkj
 4ku8fGOVe2Vk+YDN97NUgBAJ4Tmo7Dc0Hib42WShchMCgRonTR49pQLUX
 SgQpFG3y0Cd4ILWvTIQZeDC3VOJDGyMOfik1H/9/4mdRH6zA2zeU/1bOl Q==;
X-CSE-ConnectionGUID: Me7Iffb0RB6hceWljeTsHA==
X-CSE-MsgGUID: KjUR5t6tT1yUCWG78uEmCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="99902422"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="99902422"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 10:03:13 -0700
X-CSE-ConnectionGUID: 6RsoCF9tTHe0oQpVE/W1Lw==
X-CSE-MsgGUID: VJrYhwINR/6COaqbKeydMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="268474857"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 10:03:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 10:03:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 10:03:14 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 10:03:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAV14lFPJWWU2AACqNUpag2X0sbUq4AbYcPaOMiw9nJ1vI45pvlkWRpBjzfHNX7szwfnDCna+u4cOMVAYI6JX3IqRECXYahnDToMe11A9bFoczkywq0tWieqsOdUpieNS8aSQmy1zBjfZgURJhTte7JaK1Pi74OVCULUe9CKPTrmhn3l2iGZwPwitNL1QXuxhA9kix2SaI/MVPeYvivee/LXVt03qMVfc/w6Ngrvf/8H+WgciLpzDiBkajwWLOiUYtxvV09G0Pd/EXlLRAjPktOcPgqL53wGIA9L2kXqYSD+dFex/CaNuehOM6zZMDNE1uVRsr2lh75igheqxy9IUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PD45BvcwQhga7JG+b/LekVTb6l8NfXxoj0PFcb2nrQI=;
 b=kFvuRCdBXPxQDgzMLERBlC58BOrob7NitkKSdXDxkHsC3oI0vwtUyZBaaoJk2PmB2XiwBJtNKWq5nqvCfasHupPXb8H5LuwjwwosXDXnclyKBNGvy8/fJg2pqcMY+oK7Zf1UDoZzn4v8/A+5ZiePjOlW6UsNIBW5E7MFKb1K/DLW1nnMQ62nBnOHUpDvNkwi10VmOVlTWKOrTFAh5nI9rBJyXFYLeM2IlDncIrV5YpAC6ljE1BIXPky2CzLS2MfKrSyPDuYvmQVzre2GRsMfbBQkcShRcAgPYxP18iVQHFPxZ+x6BLDOkzL8PDJV8MBZh5aU4TGUBOTklFAw0dHxDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.20; Wed, 15 Apr 2026 17:03:09 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 17:03:08 +0000
Message-ID: <a02d2d11-e3db-4752-8a2a-26e36c403e97@intel.com>
Date: Wed, 15 Apr 2026 10:02:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <20260406140722.154445-8-raag.jadav@intel.com>
 <b30043f7-9143-4cd9-bfbd-38b6c5077153@intel.com>
 <1f83cf41-b901-430e-8583-49f2a94b64e4@intel.com>
Content-Language: en-US
In-Reply-To: <1f83cf41-b901-430e-8583-49f2a94b64e4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0034.eurprd03.prod.outlook.com
 (2603:10a6:803:118::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM3PR11MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d11e54-b593-4332-c6b3-08de9b10de3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: bJAkmMdmYP+3J9HKYgjXw2CsxzKyJX8lb/XmSkVWX1rsG4VwfaXQn1ZS6/g4udLXXSSrQK22MFcCOajQZPaYesuafyxk3g+uXDx0iB3lBZgZKFz/+7stTTpmFHQKfQKE833E5BfTcq5WC+5aafu3HZoUTay38XEMlTPeZ6/pBrlm4Bxb596HIHwlwMBz96frqadM3MyhS33aNZwNQqRgPSSuYztPzSd/asHcCDWJDNiTkCgHf6buDDfEhdmIySAiTWnG0gv3E8vgw4sel3L6DpcPdu7WLxsYxiMVn+1Lqgu50NtmZuiFaEMYXOj7qLUbb7+jaikByByRiCORbV9p9AMRlBjtDV8xoeld+RgJmK/90XY1+uaSNV0c6ATkW3HkJCb3QVNijhrwMIYrmvPQQ+HyXWSKosaEw8T+Kiqa+I4cPlKV44YAtLcrBOvp5fQ+YZCOg/hAV8qVEh/Y7ABSvB8XMEouPKaU/343/l35FEbqKde7gYaCTXVX/NVb0Y3mANIDsVmFfadwzg+7hNDMXlG7TJfXBlMt+52EwqtFUbWojTx3577lh0GyqmK0I/p3Jht0NKT1w9FvdpiayVlMn92iOkLaAAQfY+/nFNkcbI+UdwrzOwku9giCwZRRSdNmK3LbKXtsrb0+jz77Q524PVySkxR+cCypDCITez4HMdtSymoWCWY3vfL8jHZdF0NOrVrcUAUhvqEhyXn9UwuecY3NLv+1hdkfodnCTecWHc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEpiWEVJeHN3THNPOXBJVjBHN0N4TlozN21YUVZRVjFMVzZLeHRUaWN4eTlz?=
 =?utf-8?B?ZGVhdS9ObHhuZUhydzA3am9EVWVRdWViaGlVZjJpZGE5dlNTN2ZzR2RDbGda?=
 =?utf-8?B?K2VsdGw4eC9Mc3BQZW9ORnBkZHlBMzQxWnVZYWVlQVZuall0KzRyanJzTTYr?=
 =?utf-8?B?eC9PaTlReFBsVmtYckc5TVdOKzN3Z2hLd0hFVWtmcEZ0K0MxWTJlUGQybkhh?=
 =?utf-8?B?M2htSXJoZ05RVHQ5Zk91UzhYYnplZVh1VUNGaE5xbEZob1pMOGg3c0FWY3lC?=
 =?utf-8?B?NFhZSlJ3TjZTeG5Cb3prNmRDdWdTWHBoYlNJMnRwRnErR29SL1ZXUkpsZlc3?=
 =?utf-8?B?TjcrOHdOM050WEpCT3lRME02QXZPNVlCdnpldlpkVTJrcWNUS25qek5BU09v?=
 =?utf-8?B?c0VaaVQyRzZ4MDBVdVI0c1dYUU1YQ1kyTWtHeGVrU1p0NzF2YW80YTJRT1VK?=
 =?utf-8?B?bmdYd3F5ZHFaTmxaaGt2UzdEMTF6enA2akQ3MkxqTTdld0RNa05MNGoxMVh0?=
 =?utf-8?B?ZjlENXdlTFR6WjFCbVBmTkRFMEptY3NKNktjZURMSUhqKzJtaDZnMUxncHdY?=
 =?utf-8?B?REl0cC9LL0s3Zis0dzU4ejhidlJ6K1l5YnQxR3czUjZPVEQ5WTBYdlRndzAw?=
 =?utf-8?B?SU13TmNJWjM4MVE2WFZBZTYyUGo0a3N3bXZ0WUV2SWFVSDUwcmFZbVFlc3RH?=
 =?utf-8?B?aFpDNWtnMU13NGNmWUpXNnpGY3FydFBra0o1a0JkaXBadTZNWTl4eUZuUHYz?=
 =?utf-8?B?OGwwRzBMWVNRK1pwcGFXc2ZTdUV5d0NiajZYR1JlOVoxcEMydi8rd0toeG9T?=
 =?utf-8?B?andNQVBuenFXU1ljWXIyUlluNlBlK0c3SkcwVHJadDVkY1lpZVB1eTdyTHda?=
 =?utf-8?B?QTIzTWk4R1B5Z0w0N1cwSlVIK0Q4dnpvSjJPRnNITHhlVXZHamRWSUs1K3hk?=
 =?utf-8?B?UUtPQXlQSk9HOWVvUlk2bGlaNzQyYmZibVRuUWJxczhVdHJDNTVrTnljaHp3?=
 =?utf-8?B?Tkw0akV4UU5rMHZGeGR0dzJkalduKy8wT09UTnV5eEJubFJPVDBJS2hKdEIv?=
 =?utf-8?B?VHpzL0txUysxYVJpUkFNa3lMYTh1bmc3RzNXMkdzSDJlSFl6QndTZTJDRGFH?=
 =?utf-8?B?Und5RVNIV0R4dFdtSWVqRC9vRGZHUlZCUTl2RDBSbVc0eUozNUl0T0FlUnBV?=
 =?utf-8?B?L05BYnlxYlJPNk5tbWtVSDYrRjhPS3pwbFZKNkxhd2IvU3B1MEJzT1NmK2xm?=
 =?utf-8?B?T29nQ1JDNzRQdytpd2xuRVVTdnJnK1gzUHU2aE8weVg5QUMzNURYY3R2d2ZH?=
 =?utf-8?B?a21RNDhKSjhOTjZFWVpEM1JxTnp0WnduaU9YNDRsMExkd0YvVlRyd291WFdk?=
 =?utf-8?B?V0ZrUWtXZ1VyNGdxb3pnNjBieEE0UFg5NXJGMWNrMzVKVnJzSWZCM24yL3Va?=
 =?utf-8?B?aTVieG1DbU8rOFdzWVZMTVJ0T2R0Tis3MVZ4Y1pVOXA4V1NOREx3blB2bDNV?=
 =?utf-8?B?SzNlN2FjSFBxNTBGbEMveXpOT2Jyd09YSHNvY0FIUEc0b2k1eWhQVjNVUEcx?=
 =?utf-8?B?MlpESXBmYjhqRm1YTWhYSHhSUFBUaklIODRKa0dvWTdNNm9vQVp0ZlFjN3ZM?=
 =?utf-8?B?ZXFhd3VwTVVaR2psUVVvbmsvQ3VXeU9rSitQQ0V2bkdOclh5dG9QOGxRbEV3?=
 =?utf-8?B?KzBjWUZ6Vkw0VXd1RTk4YXF3OG4zL0wyUEU5N3ZSUkFweEE4OVR4Y252ZWNh?=
 =?utf-8?B?ZUt3RGRCeDhObm1KeGJNeGozd0NsdEcwUEE1cnp6MjduZm5KTFpmTm1GdXJD?=
 =?utf-8?B?dVI1T2pEaUp5elpwTUdtMkhqeXRtUC9tNUNpTGpaQVVkWHVIZUxVNEhJdnAy?=
 =?utf-8?B?Y0RDdUQyaEQ4TVVRNVZZcW5QNFVzenFwY0x5aVZxRHM0a2hkbFNXTGFOVlpi?=
 =?utf-8?B?UkdaL3B2eWpCVzBaeVRUaDBxZ1c1Vmt4NTdSUEFpai9IbnYwVUpFMWFwdlRt?=
 =?utf-8?B?RHNJTUxnTzZpZDBXeHRlL1FKMjFCY1dvQ3FUdFZHSzZJU29BWmFCYm9qdWp3?=
 =?utf-8?B?UmZnUERHOEtEYlllQy9sZ1NmQWFubXRqOWlNMGxaR3dPUW1hVE5RSHo1QmIw?=
 =?utf-8?B?SmY2eFU5WXo5NUpIQ2lvK3kxS0FUWElqYzlWTmo2V01NVkEwbFhFdE9QWEdE?=
 =?utf-8?B?a3Q4VkxQOEZ1NzJPNExrbkthYUovUTNCZEovM3lDYlVMVCtsOU1YQTdBeG55?=
 =?utf-8?B?YldURkF1MVFRN2dLRDhVSFlOeXl1T3AxQ0NtUHg3TGMxcC85OGtoek9nQk9o?=
 =?utf-8?B?dW50Rk9oRjI2am4vcyt1ZGdmeGZnaFpJTElYeXFGTkpoS1UrWjRWM0RmN21Z?=
 =?utf-8?Q?wNrfMdR19WKTStdM=3D?=
X-Exchange-RoutingPolicyChecked: sLEAdGP+rLcejqSw/bjkRjjHzAo+N6Il5aloL3UniZJSBSmQlwV+Yms4Rksi0BWvSxPfNCQ9HRgveefZkuDe5/puFinOhMOoD6aN2TVY67ScuDaF4b+GFDWGJNX6aQnxQBRWKW6NRh6h+S0W8y/+3UojpRxK7Y0HLBjSmFhyh7uH9mmsBt2bJoXzDcm0qXEsJzlWBn0ztdxX7ufMePEoZvyND8YLO77khLAXrcL5QvQC2bWhbHTf8E3ZgJJSWpwZBbHZgXcTCxcSdXomcfksUHPgxS3qZjbmq99PsI+wZq1QKWI++hwPDkH+Rsidn7PxZv1TzYNqFw4ipPRXHl2s6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d11e54-b593-4332-c6b3-08de9b10de3b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 17:03:08.5613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXTT+peweGKRWVeOqXclqTX9L+AvII/CHPWofagEA8sBSckzn0+wQgMBWWxiHKNCzUin5k1Ebx1gjCOcghqfEmB+mdduFHuwkIDMneUqxfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
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



On 4/15/2026 9:48 AM, Daniele Ceraolo Spurio wrote:
>
>
> On 4/15/2026 9:10 AM, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 4/6/2026 7:07 AM, Raag Jadav wrote:
>>> In preparation of usecases which require re-initializing an exec queue
>>> after PCIe FLR, introduce xe_exec_queue_reinit() helper. All the exec
>>> queue LCRs already exist but the context is lost on PCIe FLR and needs
>>> re-initialization.
>>
>> Isn't this potentially problematic for userspace? If they have state 
>> saved in their LRCs, that state would be lost without any way for the 
>> user to know. New submission on those contexts might end up giving 
>> incorrect output without explanation.
>> IMO it'd be better to just kill all the contexts and be done with it. 
>> FLR is a full reset and I don't think apps are supposed to survive it 
>> without noticing.
>
> Just realized looking at the follow up patches that this is only 
> called for the migration queue, which is kernel-owned. If we're only 
> expecting to re-init kernel queues that needs to be documented and we 
> need an assert in code.

Sorry about the triple email, I'm kind of finding new questions while 
looking at the other patches.
What about the other kernel-owned queues apart from the migration ones? 
e.g., we have a couple for GSC and PXP. Those features are not supported 
on discrete, but we should at least add asserts to make sure that we 
can't enable FLR on integrated without handling those queues.

>
>>
>> Daniele
>>
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>> v2: Re-initialize migrate context (Matthew Brost)
>>> ---
>>>   drivers/gpu/drm/xe/xe_exec_queue.c | 37 
>>> ++++++++++++++++++++++++++----
>>>   drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
>>>   drivers/gpu/drm/xe/xe_lrc.c        | 17 ++++++++++++++
>>>   drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>>>   4 files changed, 53 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c 
>>> b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index b287d0e0e60a..dd99bf766926 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -331,9 +331,8 @@ static void __xe_exec_queue_fini(struct 
>>> xe_exec_queue *q)
>>>           xe_lrc_put(q->lrc[i]);
>>>   }
>>>   -static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 
>>> exec_queue_flags)
>>> +static u32 xe_lrc_init_flags(struct xe_exec_queue *q, u32 
>>> exec_queue_flags)
>>>   {
>>> -    int i, err;
>>>       u32 flags = 0;
>>>         /*
>>> @@ -356,6 +355,13 @@ static int __xe_exec_queue_init(struct 
>>> xe_exec_queue *q, u32 exec_queue_flags)
>>>       if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
>>>           flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
>>>   +    return flags;
>>> +}
>>> +
>>> +static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 
>>> exec_queue_flags)
>>> +{
>>> +    int i, err;
>>> +
>>>       err = q->ops->init(q);
>>>       if (err)
>>>           return err;
>>> @@ -379,8 +385,8 @@ static int __xe_exec_queue_init(struct 
>>> xe_exec_queue *q, u32 exec_queue_flags)
>>>                 marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
>>>   -            lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
>>> -                        xe_lrc_ring_size(), q->msix_vec, flags);
>>> +            lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, 
>>> xe_lrc_ring_size(),
>>> +                        q->msix_vec, xe_lrc_init_flags(q, 
>>> exec_queue_flags));
>>>               if (IS_ERR(lrc)) {
>>>                   err = PTR_ERR(lrc);
>>>                   goto err_lrc;
>>> @@ -402,6 +408,29 @@ static int __xe_exec_queue_init(struct 
>>> xe_exec_queue *q, u32 exec_queue_flags)
>>>       return err;
>>>   }
>>>   +/**
>>> + * xe_exec_queue_reinit() - Re-initialize exec queue
>>> + * @q: exec queue to re-initialize
>>> + *
>>> + * Returns: 0 on success, negative error code otherwise.
>>> + */
>>> +int xe_exec_queue_reinit(struct xe_exec_queue *q)
>>> +{
>>> +    int i, err;
>>> +
>>> +    /* Re-initialize submission backend */
>>> +    q->ops->reinit(q);
>>> +
>>> +    for (i = 0; i < q->width; i++) {
>>> +        err = xe_lrc_reinit(q->lrc[i], q->hwe, q->vm, q->replay_state,
>>> +                    q->msix_vec, xe_lrc_init_flags(q, q->flags));
>>> +        if (err)
>>> +            return err;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /**
>>>    * xe_exec_queue_create() - Create an exec queue
>>>    * @xe: Xe device
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h 
>>> b/drivers/gpu/drm/xe/xe_exec_queue.h
>>> index a82d99bd77bc..445867d4da26 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>>> @@ -34,6 +34,7 @@ struct xe_exec_queue 
>>> *xe_exec_queue_create_bind(struct xe_device *xe,
>>>   void xe_exec_queue_fini(struct xe_exec_queue *q);
>>>   void xe_exec_queue_destroy(struct kref *ref);
>>>   void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 
>>> instance);
>>> +int xe_exec_queue_reinit(struct xe_exec_queue *q);
>>>     static inline struct xe_exec_queue *
>>>   xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>> index 9d12a0d2f0b5..a6421ac3765b 100644
>>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>>> @@ -1593,6 +1593,23 @@ static int xe_lrc_ctx_init(struct xe_lrc 
>>> *lrc, struct xe_hw_engine *hwe, struct
>>>       return err;
>>>   }
>>>   +/**
>>> + * xe_lrc_reinit() - Re-initialize LRC
>>> + * @lrc: Pointer to the LRC
>>> + * @hwe: Hardware Engine
>>> + * @vm: The VM (address space)
>>> + * @replay_state: GPU hang replay state
>>> + * @msix_vec: MSI-X interrupt vector (for platforms that support it)
>>> + * @init_flags: LRC initialization flags
>>> + *
>>> + * Returns: 0 on success, negative error code otherwise.
>>> + */
>>> +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, 
>>> struct xe_vm *vm,
>>> +          void *replay_state, u16 msix_vec, u32 init_flags)
>>> +{
>>> +    return xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, 
>>> init_flags);
>>> +}
>>> +
>>>   static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine 
>>> *hwe, struct xe_vm *vm,
>>>                  void *replay_state, u32 ring_size, u16 msix_vec, 
>>> u32 init_flags)
>>>   {
>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>> index e7c975f9e2d9..514355ce3d6a 100644
>>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>>> @@ -53,6 +53,8 @@ struct xe_lrc_snapshot {
>>>     struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct 
>>> xe_vm *vm,
>>>                    void *replay_state, u32 ring_size, u16 msix_vec, 
>>> u32 flags);
>>> +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, 
>>> struct xe_vm *vm,
>>> +          void *replay_state, u16 msix_vec, u32 init_flags);
>>>   void xe_lrc_destroy(struct kref *ref);
>>>     /**
>>
>

