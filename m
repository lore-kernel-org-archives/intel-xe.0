Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4A4C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 11:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AADC10E660;
	Tue, 22 Jul 2025 11:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6nKrt1R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0B910E0DA
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753184778; x=1784720778;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PZQAu2axo79do0Z7iVxCxFwAeIFBaxLsz8m1QsU3Ru8=;
 b=C6nKrt1R6H1pzQfPPS0Wuel3V3LfzIfaxaWjCHb9sWZJKXFBpGTT3gSh
 1ACCQ6E4+5TiOUZWwqSqiQt/ovngYSD6Ik16nRXWiUWBNtaTaidpa+Qi0
 AV1hXTGPuyzDoY2byz2SDFj6CqyDH9aKy3gF5zvev3jFInUQ9HSi1vJ5c
 WcHxWxW/DOE3rOFeTISSCdtNiSZq61uEUcx+hfAQ/XbLQ+pmuRtNJ8s/0
 R3JrZxMLstSOoA0qe5fJws1ImFRj2mmCJrhD0jc8gM/1MG930X5H3jrjy
 xuADCKCKtsufxnnSu7WPFjhl26fYjgvSHJwiIQPemV05TfVa4D3iXIHse g==;
X-CSE-ConnectionGUID: Eca4RbPjT3eL36JESPFwlw==
X-CSE-MsgGUID: 8DLknRppR9CCfYNQb/FzyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55540146"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55540146"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 04:46:18 -0700
X-CSE-ConnectionGUID: UoX90ajpRxyA8cTxQjFYdQ==
X-CSE-MsgGUID: Zu7ayE6ESm6bdIthbc5U0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="159674380"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 04:46:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 04:46:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 04:46:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 04:46:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9j+1TnT8N8huW4buQZV88X6dIqjd/4/Nr3HsBEjkxiryMt7DlDEfn5OiGbo9C39zAqIHuGJ3jQFJFudAynAGYIEGAbHRFTtU8GTS3rOv7oxDkTdhsDz64EFVCuL2bKWd2XeQlrWb6E6Pja7RLp45kqPOOpK6XvwMNeoFJXlui0BvQoK2QYZ5D1Uy0aJrg1aRVH0KJsv8r7nOznRpCCHTk+s7369lHEqEsmO5ZLrYYUxWT/fTDstIzYRgeBZ8TaTosrEnc1PwzHD39ntNES3LqjhCoF/830mRyblrYp/5Bf8ymu+NSMgm7a2rZHAl9oYPjX21yHd0ZqEeaMRrqOiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pjin3NV3WQQRVAeOApQctJpBUnMSFUXPf7ytWg6h1k=;
 b=iIUQkvMNIGcmRsuSWSTiA/s6LBq8bD7eySzAwMLt2QDk1zSe/wZfxmbvgrT4fv0Rq6ekl4xnczKVc6RZus6IHwGA130UmL1JuRLBAr6vXgTePM+vz+0x3Cf2a68yFAujb02o2Q4hKRr04+3DgummsWivnCoJTV25VxA9xAMafJ1MAut9GMYwnSKIBG+o18q0UKr2NhaBTzmERD8oAl+y7AA7RMQAyf9Qf0EPdpZVrjskAHj/RFBG8EpBK4RwKdv/3cJEpQcWs9jcPRTLJ1fs3xGdpwiKDHW4nBP4Q6V3WmQKBmRv6PkLfZ+Agrue05v/EO05tK9qZ4DJ93dLT4UXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH3PPF801A91A7D.namprd11.prod.outlook.com (2603:10b6:518:1::d34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Tue, 22 Jul
 2025 11:46:15 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 11:46:14 +0000
Message-ID: <6c9ed7e9-f46a-4bb3-a264-ad667546773e@intel.com>
Date: Tue, 22 Jul 2025 17:16:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Clamp power1_crit to GPU firmware default
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <raag.jadav@intel.com>
References: <20250710125306.295478-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250710125306.295478-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::26) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH3PPF801A91A7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e46a6d-d9c9-45d7-0e1a-08ddc9155cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEp3a2tqT1FuMUNTZEc3SUlCczBQUHJUVkN0RXpaTVBrNW9pZU16R3N5dGlL?=
 =?utf-8?B?TkYzY1FPbVpCY0ZEY3BndUpFUEhYNkxrV1JLSFMzenh5cnhqUnZJSjB5TUhU?=
 =?utf-8?B?RllvRjdSQTJLZHRPc1NaaS84d21YZ0k1b3RGVzE2UjFIdGpLTjJ6U3EwMWVx?=
 =?utf-8?B?QlI0UkJVenJkcnFKMkhzVDc3RHpKa3UzUXVHQlhOOSs3OE1qY2tiWTFEYlVi?=
 =?utf-8?B?aVpSTngzZ3F6QjRWMytoV2tpNXNqZzBjT1RpSTFFKzZWQ0ZPSVZyeTRUUHdJ?=
 =?utf-8?B?aWxhL3RqZnM3UlJYVkhhQzVRR1VvWkVaTmFlRDBnMDhMSjJEbkxkdFYrYVFE?=
 =?utf-8?B?UTlteG9DZksraVlNTXMvZmlJV1Z3QjFDNGJmeGs5cVZXS2gxd0laaUVEaDcz?=
 =?utf-8?B?bGRabGY2NVZhQ3ViOE5nWUhvN0FsdFlneVVhMk5UbHRzUk9oeStYQnBPWElW?=
 =?utf-8?B?T1FreDJ0YkNVY2J1M3ByQUw5OWdOODlDeExDVzZ3aXFpT1hOaFpJN3NEZUx0?=
 =?utf-8?B?L2xVTU9TbEd2ZXY5RXFBY1Uya2M0Y1Y3aERabzdVejBDOUZaMHNEVUZVSGNa?=
 =?utf-8?B?R24wNEtHaFE4L0wyTmEzWUVxc1NoZUIwRk1JOVlqSmEwUmJLMExBSklBamRR?=
 =?utf-8?B?eWNQdUtwYXpjaWo3YVNiTVVBdHVxb1phS09QeTNDV3paR01DbTJWQk1lU1hC?=
 =?utf-8?B?YzROcEFjV3plRk1QUmJsRG9vNmhMUitvOFllbWNJdGRlZThHZW41Zzg3SE85?=
 =?utf-8?B?d1p0WWFITXU5MGNWa1h0eHdzTWtDeDFqYlE0OSswNjVLNVNIRUVXaTNDZFNR?=
 =?utf-8?B?TnMvYzdvc0ZxM1RoRXhldjlzTFJHb1dYL1p5dWJFT1o2WkVRWHFtZ0h2UWNj?=
 =?utf-8?B?Zmc5Z0NoOWV5UXlSRkhTMzJSa29RLzFvYjJRUUt6L2pQQS9ONzJFZEtiUmlE?=
 =?utf-8?B?bktnYmNUNks5VkIvejlIWHNYK1JZMnpCS0wwMGxEU2szZDN0bS9TN1pMV05o?=
 =?utf-8?B?RERGdTErcGY4b1hpS3ZBRGtJeVpkcnJVdG5HRXNucXNoYUJvSXh2ektreGhq?=
 =?utf-8?B?eTRHR05zc0trU0Z4RjNBdXBkcThYMUcwMHE3ZHFMdnNsTlJ0QUFLbmhmb2hh?=
 =?utf-8?B?cWJQT0RmcVArbGF4QXpPN1F3WUJ4aW9FRTAramNUN1Q1L3Y3cUJ3Z2t6WWFx?=
 =?utf-8?B?dFdEc2didDY4dUx3TDlQQ0dHSlJJVERnYTBGSENyZzJhY0l3Umw1UG1McVQ2?=
 =?utf-8?B?V1M2aDY5WWwwbDdCaFJMMjFWaHpaOTlFMnhOdWdyNUNYNnZhZlVuVllUNHR0?=
 =?utf-8?B?NGx0ZmpmS1FvUnBnb3RVWVkrK25mb3l2emZDc1BEeTYrNG9qZEJ5ZFZ6Mkcy?=
 =?utf-8?B?QnBmVUVINXVtd2pLNmo2MVhBakJQUnFyTWN6Wm1NMWFtMjJ0Y0Y1TnA5UFB4?=
 =?utf-8?B?VkdHVThyL2dUV2hQTU5vQmZDNlU3dG55d1N6KzBxSWhXOEJ6Tys4Y2xlR0JP?=
 =?utf-8?B?S0lZeGZIdkxvU3c2SFFNL3lORVp4bGdJME9ZLzB3dldDTkNqK08zNzFzUGhy?=
 =?utf-8?B?bnRqeVhLSzZWTHgySnlMbTFSc2l3VkgxNjJGVENnbStLVFlydnpIOTdxMzZQ?=
 =?utf-8?B?K05oTjJPR1ZqS1VCWVd3akUwZUx1U3FyMS83UEJ6UlNnMzlFMVEwVnc5OVRW?=
 =?utf-8?B?aGhiMGZocm5hZkhsMDZBblNhREp5bmFMRVpVazltR0tnaEptUzhOd1FyYXNi?=
 =?utf-8?B?eXZGa3hPZ2NqNS8zMTBSd3JRSS95RmZxSjJsV0g4NE95aWExL0JNeENFZ1Bo?=
 =?utf-8?B?bXFwVWdsT0ljVHRDK1VmWmNDampqS2FoaVNiL2Zac2pSOXdrbVUzMnkzdmk5?=
 =?utf-8?B?VE1WZ2JvWE1MRFcvOTBGSzIxYVM4L2ZObVpHOVlXRnc2QVp0VjNCSDlFOUY3?=
 =?utf-8?Q?IjtAWPHGycU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3NXWHd4Nkp2RkdNYzBFNlFDblR2cXBLbE1KcHlVNHJJZlBDSVY5Y0FUVDBC?=
 =?utf-8?B?U3RMTW5wL3Eyemc3eDhNeDcrWWwxUmtNUEg1UkZ3cGRWN25uSXZkTkY4aFZX?=
 =?utf-8?B?WjlUMWQ5dE9CMlcyeE83YTJ6dkhQQXhsRVo1Zi9PVko3dStNdUV6MHZISlRP?=
 =?utf-8?B?MDZGSUtRNU8zMUkyZlF6Nzgvekd1YjQ3a2tsS3ByRUs0UGVLZHBob0tsdEZz?=
 =?utf-8?B?YmxBdkFvUndva0dyT0lCRXFraExQdXlqOENzU0htT0lYWHU5RERTTHlFdEtF?=
 =?utf-8?B?eTZYTENWcGttV0hTMUVwbnlmeVZkWkZnemMxVk9IRHNMUDhTR1UvNUpzT3Rj?=
 =?utf-8?B?RjN3WTdETU5sbWdFOFVPdFNiT210TXRNVk5YODd5eFlFY1FHKytuMWVmNGN5?=
 =?utf-8?B?NmFscTgydlRBaks4ZmhHTGRPOE4wUkJEK0dSUjE5aTZSV3g2RkRhRCtUWjc3?=
 =?utf-8?B?VlI3VG1QQ3l3RnBkR3grV29rMEIzWlJabXR6S04vdEVtWEJ1RXNrSk1tMkM2?=
 =?utf-8?B?b09SMWo4dHp2WEMzS0U0ayt4bDloV2JIbVBXYzdvamN3Y0hGbDhRZ0tOUlky?=
 =?utf-8?B?VnJlWmY1UzJJVHNROGFSU3NlbHM1STV0eWhCYmo4Vk1rY2xTMTZZWk1xTmNl?=
 =?utf-8?B?Wk9SdVE5MVR3VXp1SDFCc1RQdmxHVGNDVFdhUmZnOXIvUnJLcGVUeVZ5MnZQ?=
 =?utf-8?B?OU1uZ0p4Q0VXS29XTXFoZDM3TCtOS0JORTE2Sy91T29mV3Rld1NrT3BTbnhF?=
 =?utf-8?B?VG9jSkI0ZDNBUk9XWm5IZkVoc1lGVWZ6MndGMXZmUnJKRURVWGdWNHZ6QVJq?=
 =?utf-8?B?YkZLcmR2RnROOXpzR3BMa2Q4Zkx6bVEzMEJWKzZiQUxhLytpenVqK2NRSWlo?=
 =?utf-8?B?K2RBeDNNS3ZndzNiZHRhUDgrY3BpeFdSM0dJd2RGV2JpWDdhS1VNT2VlbFdD?=
 =?utf-8?B?S3RFQkRWVldnMHJMMkdTZEJPY0wxNUg3QWtCVGxNeEU3ZGVYa1VZYkExTm1I?=
 =?utf-8?B?akpXcVJIV1ZLTUdJRzFXV3pkQzJibE81RzFmd2U1MkNhM3VQSVVhMUlPSXd2?=
 =?utf-8?B?K08xWmpranlpbXNkWUsxNXJzeldWYWhTMlpxR3JsVkIvc1pycGthQ3hMcTg5?=
 =?utf-8?B?SThyWTNNQW9OOVFzWlBOSVNHTG5uRjRMNC83MDZRUW9ldjdLUExZUlV1R0FH?=
 =?utf-8?B?RlRYVldaUWxTRjN0RlNZaUoxcDhET2hyTDdveFRUSnRJSUVNeWR4d2x5bWRE?=
 =?utf-8?B?QWMxdlBXZ3c4ckMvQVE4TVJiRDJvcDltdXp3UGkrRmw2WW5DUFluK040YzFV?=
 =?utf-8?B?T0tOWVdxaEZMSFh0SHhqLyt3bHdOalk4OVd0MjNEYkhETit2SFIxcy8velNM?=
 =?utf-8?B?ZElUcG9mSk96VnJhaHB1NDdOdnRiNmtIa1k2U05SYlYrdTdIRk44ODREYW5R?=
 =?utf-8?B?aFREWFRvRk5ycUEwN3l6VUt2cEkzcTR4Y1FYQU44d2RvYnVrUThnQUxJWTJ1?=
 =?utf-8?B?ZXZwMFNlZ0k0RUhWZ3d2L2crRk5KcVJGc3hrUnA2b25UV01ZVHlLdk80cS83?=
 =?utf-8?B?OEJOVU1HdjZacHBPZzVMcEczK05DSWE4OWFtS1NBQ3hkTnVlam5veHdEaDU1?=
 =?utf-8?B?WGlEK3pKZ0MvNWovNjJoZndjaDFuNHRRMkdBU2JMWnpnandmZUNzcHhjZDFJ?=
 =?utf-8?B?MkgvYWlha1dZeWt3Tmh2REJLb3dJSlJhT2htc280MFBldFpMZWJZdUFWNGlD?=
 =?utf-8?B?dmlQQUdSYmY0YmdSNWV4cEFpdUNCSHphcjIvTFBKaENieXF5Nk05Mm1DLytP?=
 =?utf-8?B?b1JWaWp1VGszcnVyRG5TNjN3YTBJekNZRzdLazNISzNSTEdZRmRhQ3V6UmpI?=
 =?utf-8?B?V2JiRS9vVUczbEJnVm0reFIzRXBZcHpnQXBlTVhOT3RLK3htZHBhTEtlL0R2?=
 =?utf-8?B?azFERmI3NTkxK0llWDlDaUowOTZaSVlablFmbHY2TUx2VFZDVWRGKzdFT054?=
 =?utf-8?B?UGdrWFlCWkh5ZjJ4SytCUjFaTSs0czh1S0g4dmJ6UFJWMVNNZVRxWnB6QTdk?=
 =?utf-8?B?S2JKbWpNU0J1K01ERGhRL2NLYlpXTzFXV0Q1WlhTVmZjeFdSZDR2QmFoQnhq?=
 =?utf-8?Q?I18cL+dC+n+wp01wr17Tb9tp6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e46a6d-d9c9-45d7-0e1a-08ddc9155cbb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 11:46:14.7517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SD8Mp8Fi0O1083zGhQE4G52FgU8Wy2hICzXgf8XgUm9TTfJRZNlsW4ik4hg+uXH29cuE7xtkgqylu/4FFZEt5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF801A91A7D
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

Hi Karthik

On 7/10/2025 6:23 PM, Karthik Poosa wrote:
> Clamp card critical power(power1_crit) to GPU firmware default
> when value set by sysfs exceeds the maximum supported by pcode
> mailbox.
> Though pcode already does clamping, values above pcode mailbox
> supported gets truncated resulting in incorrect critical power
> getting set.
> This patch avoids that truncation.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index f08fc4377d25..ce239bc00ee4 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -137,7 +137,8 @@ struct xe_hwmon {
>   	u32 pl1_on_boot[CHANNEL_MAX];
>   	/** @pl2_on_boot: power limit PL2 on boot */
>   	u32 pl2_on_boot[CHANNEL_MAX];
> -
> +	/** @psys_crit_on_boot: card critical power from GPU firmware */
> +	u32 psys_crit_on_boot;
>   };
>   
>   static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
> @@ -742,7 +743,16 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
> +	/* Maximum card critical power value supported by pcode mailbox. */
> +#define MAX_CRIT_POWER_CURR 1023000000ull

Add a comment about format. Can you try not to hardcode this and use the 
shift and data to generate the value?

> +
> +	if (value > MAX_CRIT_POWER_CURR) {
> +		uval = hwmon->psys_crit_on_boot;

As discussed offline, you can remove the reading on boot and use max 
value directly.

Thanks
Riana

> +		drm_info(&hwmon->xe->drm,
> +			 "Clamping critical power to GPU firmware default 0x%x\n", uval);
> +	} else {
> +		uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
> +	}
>   	ret = xe_hwmon_pcode_write_i1(hwmon, uval);
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
> @@ -1251,6 +1261,9 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   			hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
>   		}
>   	}
> +	xe_hwmon_pcode_read_i1(hwmon, &hwmon->psys_crit_on_boot);
> +	hwmon->psys_crit_on_boot &= POWER_SETUP_I1_DATA_MASK;
> +
>   	/*
>   	 * Initialize 'struct xe_hwmon_energy_info', i.e. set fields to the
>   	 * first value of the energy register read


