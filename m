Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A16C30653
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 16:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E19010E2FD;
	Wed,  3 Jul 2024 16:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbpXuCmc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2069310E319
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720024739; x=1751560739;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vLVHRrRw0IXTJXAMNhyCSzcZJZGMOxHsqORSsjkrynE=;
 b=bbpXuCmccvYU8/l08r1F0CKpDdjRo6OQjPu8nHndfgTCl5SXYyqV7NwQ
 wxXeZET5+ACmBUbkLLNSOHMDwPmSilX7/aVJhOSWM+Jx72hMLCXZcQFAj
 EgEwInwbk0ieiEinDGMAucSndQyVLZ3nzy0rcWm5FA1XjyPe8xzxmYl0S
 IO31qAj5S3uJRApNIFKjFfVxDPn5a982HEGoomtA9Wx565ez2RfbEPVTy
 4Ve1tc/DlIOGvsMJyRJu8dc3IcadlMsl7Cd9R/vZfC72R4m3nNqzhQHP7
 A7X3ZbJKrpWjKFW14nXFMrI+NcH9zmORCdyq7h98gFZ6iOZJP4XtZtMgl A==;
X-CSE-ConnectionGUID: ofMK85E5Sb2ILyO2lSbIYA==
X-CSE-MsgGUID: 8wXlUBG6S6yI8YXqzO7/dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17103247"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17103247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 09:38:59 -0700
X-CSE-ConnectionGUID: nzUCOGIKSViqRyM2lyQA6g==
X-CSE-MsgGUID: sffozq6eRrKFQY4icfBsZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46737520"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 09:38:59 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 09:38:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 09:38:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 09:38:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMQ4f41Gjd912ZZEjLTW0frxxYhWEagZEjm+dCjdFMR6Cf8nWy8OzJEN424qx6fU0tWGW77jJyA+q+lyBccIr4nAFHFPi7+7rkGAhkxOIOs6BCfqAF5N8RIwbs2EYWi+FEGgjad8sKPc8K17XUd8ZHjbsHsbhqmHwckrv6lwQf8gwAkIWrFJh2fnyM9U6hUJ4kP0vok/GKsWO4Z4gOq/zsG2M2FBtd/yySoIBYJwqqskjOhnVb4xeDe0fmb4OeZoRTntMxQqgTeZN7ytyKow4oLSA4tyLv1QukN5KLQ/yuuU57ugy6jXU2vnDhYfpVm+dgB4xLF5zTBD0j/szNcYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rftpc/avg6KbexQbQiFPKyzszOk4NMlUE0qvHCvolmE=;
 b=NFascIxRfnnq5sKTvg0CQ/WRs7qTQi2qL9hEpXQTSkJ6Gt8EsMIZ0dvJRSvSl/59T4eY/BjRfvFCz0LvtLLLto4Pfz6MWEZS5XmNeTLMjh037MMkHZDqQdF8mhbQVtM/ex72ujUvR2Oh16qdwrAyrwrIZr7Rk/0l5eonsilVVdx2TNqlYFM7PPkV/EJp21rBpEtUw0IZksCcRJqkweET3vr/jIHACASmcVTjrt3SNqDis5F1wfFucHmWgxELITqAB/1xtQlFHqyjRNIho9zu0Pnrm4j4YlrSWcxKz1EjLXmbr7bTgjmzu+h3eFLd3EVf2qAAaww8FtzB7LKQJWSzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Wed, 3 Jul
 2024 16:38:56 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7719.028; Wed, 3 Jul 2024
 16:38:56 +0000
Message-ID: <11752a39-1aa0-4140-bc26-15283f045607@intel.com>
Date: Wed, 3 Jul 2024 09:38:54 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_CI=2EBAT=3A_success_for_Reapply_=22drm/xe?=
 =?UTF-8?Q?/gsc=3A_define_GSC_FW_for_LNL=22?=
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ryszard.knop@intel.com>,
 <ewelina.musial@intel.com>
References: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
 <171988208839.3729.11952250272154489901@2413ebb6fbb6>
 <mxtejwnl6xie7a7py2ntnrbq5s57o5ho4exy3gygwggau4hgt5@lg3ixotyab4j>
 <790e4a09-a383-47fd-8c1d-2b8994c6c0b4@intel.com>
 <ct6pqzwxnhlmgkal5yjbaaukl7kcshlg2ifhjiodxu464o4xth@6lnkhu7lrwck>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ct6pqzwxnhlmgkal5yjbaaukl7kcshlg2ifhjiodxu464o4xth@6lnkhu7lrwck>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:74::47) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: decbc412-46b7-4982-e9aa-08dc9b7ea19b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anhSOHVVU1VRam9waEJpeWpRVVhjQmZZNTMvYmFTQUxNMjJGMXh1NTRYLzBq?=
 =?utf-8?B?em0xTkVNZ0l0bzhZaVM2aUdSem9uVU9NMk5oRTNvSTJwSlVqZFFuejNaSzQy?=
 =?utf-8?B?c3NKSXBrbGtrT0E3dDU1MVk0M3l2cHJpdkdRUnRVODJuS1pWc2hOUmpmbFBk?=
 =?utf-8?B?ZGtSeW44MGJ4VW9zKzZNdXhGNXYxQ3JxdmJuVEh4MnV5c1VFUEtCNzIvM3Rq?=
 =?utf-8?B?ek4vREhkSGxFMDdrcWNmL1dRWXRxL3NRckw3V3lSRFcxOUpPK2RUSGhLUC8w?=
 =?utf-8?B?ODJ0Rm9GTG10MGMwa3hObkNCZ0E5RDdVbXhTL1ZGSncxb3gydkV5YTVQbTI2?=
 =?utf-8?B?TTJuTDUwVE85aHJ0aWY2RzFScDJCeVlwYjdWYW5JNzNCSU52ajBlQjgzME1X?=
 =?utf-8?B?cEpsSzdKZHVaeXNucXZscFNTUkVFcDdKdnAvQmJlalh0L1h6UTNWWnBtdVdP?=
 =?utf-8?B?aDJaT0ZsV1BBNDU4eE5zVy9WQUxURzRON0hWaHlMWkVpUjkzMnpDUXNmdnRh?=
 =?utf-8?B?cHk5THJUN0N4cDczYWlsQTRYelpqRk1kQVJUWEp5dXY0Q0FuMXdaVXFGbXRV?=
 =?utf-8?B?NjJ5Y2RhY1Z0VjRNUnFJT1lSblp1L0h3a0Q1dWdzdG04N1pPSTVhd3U1M1lV?=
 =?utf-8?B?VGZ4SjVVM3ZNRWMxd2d1U2UzcmNOalh3dmJBbTF5QWF2R0dlWGE1YXFORDY1?=
 =?utf-8?B?R05jV0R2N2Y2YTNiQ2EwODlOS2dGUjBYK3o2K01pTzBqQmV0NlhtQ21zYVp2?=
 =?utf-8?B?cVNZMjJoOEdVblc0M1ErWlVqZHhTVTNPajU3cTY0VjVFQlNkeWdBU0lCNExs?=
 =?utf-8?B?THE1SHBleVpMYUxNL1pwWDVVZEdnb01GT001ME9wMUFLR3E1YS9sTWJEUXg0?=
 =?utf-8?B?Yk9COFRTeklzK3cxc0ZWcitEYTRzVmhxRWdmWlpOamFMcDVub3paWVFaZml1?=
 =?utf-8?B?Tjh2Ym5JeHFYdkNYaVhScUFTR3ZnYTM2aUtsKzlqcVFzMGhrWkFKR29tVXlu?=
 =?utf-8?B?RFh6N01JM3NZZUsxV211OGR0bFNNek1Qd1dpc2RXYks1bkFDYko1RlpRSlla?=
 =?utf-8?B?MVpKUEV6am1MQzF6Z1ZBcWQ5Ly9uejhMbzk2N1JEWGgvdmdMM3d5L1BrUlUw?=
 =?utf-8?B?MWlQekhwTUJxQkhCUzNaVWRxWit3V3RaZHFxV1Fac1lFMUE4WXFzZmNya1du?=
 =?utf-8?B?QzVtZjZRN1NhVkNvTW1BMUxGWWtLSmZQUDZiR2NneFpQUDhlb2ozSmF4SnA0?=
 =?utf-8?B?a2E4cE56OG1RaWx6Vy9VUVFxYTdKMkt4dUpNM0RHaE5ic2JEYWlHaitQeThq?=
 =?utf-8?B?R2F3NHQyVElueUgzS20xWFN4MWpkd3MyMEg1MFVsWGpoTFZySTVzN3lJUHBk?=
 =?utf-8?B?Nk5uZ1BaZnFwb0FUM2pJZ3F6M28xSkN6WFNZZGZlSytZY2IvckV0Wk1FR3RE?=
 =?utf-8?B?Ymd4NFlEeGlldDlUTVJHd1Bzbk9ETjl4dkJiM0dSWTZFOStPL09yWXU4eGxS?=
 =?utf-8?B?eXdnZHBSVDlYL0duakM3WkRiV2U0cWh6ellhN3JScXM0YWVIMmJrZU9hTjBV?=
 =?utf-8?B?eGVPa3pJUEg3QVY1RCtoVEU0ZGxkZzZFS1F1RE1zSkxieVpXbm5Uc1pyU0hY?=
 =?utf-8?B?VFI4UVYxeWh2YUJvYXFIWnNHSXhkK3pSWTk0STFNNy9RS0RZVWxwRERtUmlM?=
 =?utf-8?B?L1hZeTQ0ZUhRbk1OUDBpV0V4ZENueU5rZWt6R1U1bXFCamF4YitXYlU3eVpm?=
 =?utf-8?Q?k+XLxOK4lfLVNurka4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDYxVm1DM0RmdUdmK3JsZlVpaW9vTkMvQldyTFRRRzRkM2hJZTNWbWNVRlJI?=
 =?utf-8?B?T0g0M1BZREJWcGY5dG5BWVUwL2VaWkh0TnNNdjVOS2lVSXRrS1QrOExHSVB6?=
 =?utf-8?B?MHU4SHk4Z3NzWGVRaG5Zc1kvTlc3RFhSV1BEK1RNTVFKQ2o3RmNKdStIazFC?=
 =?utf-8?B?amJoOFBVMWxFaUlFZ0lLOWFvaDVUZkhhNmpoQW9JQzYxVzFuaGoxRG9HUSt4?=
 =?utf-8?B?WHZYcTNCbG5tNHhxQjZaZ2NmTW04K3FZbkhwYlU0NU5BZXdBaHJ1TEpTdFUw?=
 =?utf-8?B?R1hqeGZLMHFnZGRxeG9vTEFucXpLUDBEcE5nUXZra092UEhMQWZqZTl1RnVq?=
 =?utf-8?B?SkpNTXFDL1ZSRHJEbXBaUURKREQ1d2pPWkVIdGw4UExLdDJoWFA5T0dBOU13?=
 =?utf-8?B?Wjc0WWdHWjF5RHRPWm5jMTlKMEFMTUc0dU1tM2dIdUFKQVRmYnRCdGxNWWpN?=
 =?utf-8?B?UkhmcEJ0cEJQS0Z0NGI1d2VVbHNFVVpCRGJnUlVSME1LVUxoOHpwdnVaZG1Q?=
 =?utf-8?B?WlM1L1JPZjUxWWlQYmVKZWNtcUEyR0d1dEEvZkx3SlhrQkwwaG1uRitvZGpK?=
 =?utf-8?B?dklaSlpteFBnc1JKbXl0aXVtQXI2aXkyU1pLZXc0N01Rd1V5UFZVS2NqMDN4?=
 =?utf-8?B?YkVHZUh3bTNjMUYxWERaV2QvSzhsY1lFZHM1ZkFRTGhOeWhNelY2dDdUVEdy?=
 =?utf-8?B?VlJxRUFmaEpZZDUzZVhQUnUxanNRbmdpQWZJZ1VRRFRuQ1M2RVg1RGdiYlBL?=
 =?utf-8?B?MHpGVXdTYmZLZ0xPODVSNkFUaVk2cjB5M0Q0QjBRVlNaSmQ3TTQ3VEhLT2M5?=
 =?utf-8?B?cFA4d1hDOUlRK1V3dHlEWjdEcFR1amxuSENMc3dIbHZWcmNMODB6bzRaV0tk?=
 =?utf-8?B?RXh6UGlvNmpuUllHdE12V1JwOFBuV21DMFZYNURSMUlBUkI0MkluSlRvaVlN?=
 =?utf-8?B?bjFGeGNyT1lMMTJqbk9OcHplS3hRcE43NlMwWlVxWVBpMWtSRmc3MjQzZHdr?=
 =?utf-8?B?Y3gwT205Q2g2RkJNT0dUYWJiYkhENjdiZlBtYlE0M1BpQktxMFdONTR2bW1s?=
 =?utf-8?B?SHRFZis1WVpnV2xqeU5GTnJCYzMxblBMdVBuN09hc25sTDhjNGwxTnh0bGdV?=
 =?utf-8?B?QnBjdXcyV0RLMHVhTmdDcWF6ams0MjZhQkFUc096VDJoNSsxb3hibVFvaUhh?=
 =?utf-8?B?QkJXdlMvQmZpQWl1TldhS3NYUm9OZThPVUhmbWRvUThOeWYvK2Z3SmJOcEhq?=
 =?utf-8?B?cnl3bythMUtocWdKQVp2SmtCZjZHWE01dzB2RnpjNm9VWXpzekU0TStiVkJF?=
 =?utf-8?B?Tkxid0FyOHRUYTlkMG1SUDZZKzE2eDVHTkNDRWRTUzQwY0RhRUJZRG5CRVl0?=
 =?utf-8?B?WnkraUxjKzA3dTlsYzZ3WHpqUG9zZUtOWFQ3bFRITVdSK0p4ZURNUHZIcUo3?=
 =?utf-8?B?MG1ncjN5KzhrS1ZqVWdaY1hEamNqREdEUld3Ky9zandrS011cUVtZS9RNitw?=
 =?utf-8?B?OG4zT0RKcGZpQThvUTMzTDZhOWIzSXVtaGN1dEc4dWpadUs2RU41ZzJCT1FK?=
 =?utf-8?B?ZkwyWWJUQjd0QW4rbkNTNWpCemczTWF1V0FPSnE2ZS9CS2JtOHVEN21qMVQ4?=
 =?utf-8?B?dUtLUXB0RzNWL1gvWWdsZU1wRWZHVHYwc1NFbXgyd2llRFNHVVRheFljb2V0?=
 =?utf-8?B?TkplOXRrS28rVSt3WFZYbWdwblBYM2xUUXhIVy9wODlPenhQY0xhRlREcmZV?=
 =?utf-8?B?eDBBek5Zbkx6djdCZXhwV0ZsWUxqVnFhN1dMVGZHVDdRNStLeDNJVjh4TTJN?=
 =?utf-8?B?cWlJVkh5N1ZwaEhoSnpJM3lPMDRhTHFtT0JYZlJVMHdGYlVuTTlrd1dqUkw3?=
 =?utf-8?B?eTJpRmtoUWZLek5LM0NFYTBZdTYxY1BleS9WUlcyTEw2RlBFVnJrb3lmbmxG?=
 =?utf-8?B?NlQwWUtVSE1FT3l0bWpYNytpOHV1eVVzZmVGL2x4enpDWElUbCs1OUY0aHFz?=
 =?utf-8?B?blBtTTBOR3FxVHlscUd2aXBhWEVPZHAxcVVYcXZobjRmcXhxenk1cEptTG1l?=
 =?utf-8?B?b241UmM1T3R3SVFqQm9RRHVFY0FnR21TZkk4a1hKVkJQK3NqbDFuQmNjbUcx?=
 =?utf-8?B?cW50ZDh5STV5Tk1LT2srUk0vdjJYVjJ6cnRoVXlkSkVuSC9QdjFwTTFTMTNw?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: decbc412-46b7-4982-e9aa-08dc9b7ea19b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 16:38:56.0539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fep43Nqj/AvfmOObVnHh5q9DboNH4iN9IIUWVepDsWg7V5NWk+JIrauulBdAn3cZNiNas9JILEoSHSjiblygkgwC12V3tVVCfkNcSADusKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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



On 7/2/2024 11:02 AM, Lucas De Marchi wrote:
> On Tue, Jul 02, 2024 at 09:25:31AM GMT, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 7/2/2024 7:29 AM, Lucas De Marchi wrote:
>>> On Tue, Jul 02, 2024 at 01:01:28AM GMT, Patchwork wrote:
>>>> == Series Details ==
>>>>
>>>> Series: Reapply "drm/xe/gsc: define GSC FW for LNL"
>>>> URL   : https://patchwork.freedesktop.org/series/135623/
>>>> State : success
>>>>
>>>> == Summary ==
>>>>
>>>> CI Bug Log - changes from 
>>>> xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -> 
>>>> xe-pw-135623v1_BAT
>>>> ====================================================
>>>>
>>>> Summary
>>>> -------
>>>>
>>>>  **SUCCESS**
>>>>
>>>>  No regressions found.
>>>>
>>>>
>>>>
>>>> Participating hosts (5 -> 4)
>>>> ------------------------------
>>>>
>>>>  Missing    (1): bat-lnl-1
>>>
>>> I guess it didn't really work. +Ryszard +Ewelina: Can we promote LNL to
>>> be considered "a reliable machine from the CI POV" so we don't have
>>> "CI.BAT: success" when LNL execution is missing?  Or is there any other
>>> reason why we report success in this case?
>>
>> Damn. I can't repro the issue anymore with this WA applied and even 
>> in CI we weren't seeing it when I sent it for testing before: 
>> https://patchwork.freedesktop.org/series/134099/ . I did 3 runs in 
>> that case and none of them hit the problem.
>>
>> I've triggered another run to see if we get any better logs.
>
> this change should NOT make the machine "go missing" really. Actually no
> change to xe-only should really make a machine not have any log at
> all....
>
> I believe it was a very unfortunate coincidence and there must be a
> network issue or the like... but we can't consider success when we don't
> have a report for LNL. Particularly for this patch since LNL is
> the only affected platform.
>
> "try again"  in patchwork sounds good for now.

It died again, but this time we got some logs. It died during an fbdev 
test, which makes me think this is due to the display side of the WA 
still being missing. I'll try again to repro locally and if I can't I'll 
send a patch to move the FB out of stolen and see what happens.

Daniele

>
> thanks
> Lucas De Marchi
>
>>
>> Daniele
>>
>>>
>>> thanks
>>> Lucas De Marchi
>>

