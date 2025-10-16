Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACFCCCD19A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 11:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4355310E9C5;
	Thu, 16 Oct 2025 11:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7f2WpZE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3023310E9C3
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760614412; x=1792150412;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uIQ8gcfL7uXjZzA3RVvnPKLFk3zozN+qPwXx42ykjoQ=;
 b=W7f2WpZExOIaTwARG6+GSE5X7Ah6IWEU1PsxW9m3uPzPSAFnPDRm5ZMk
 5eESKbocMVDMNwPP4JITGLTQHUsALCG9lMVYRBIxgQ7AIoEt1en7vpQit
 TEG5iS5XiaBUksDurdIviXRMI+WZWu1Nsjohx2lqe4XJK07yXin+ULrU3
 3YpfnKEJNmz6hkWaQXpdprqcSeEbVGHaL3JDJkLAxQp6Px201IJCQiqHS
 jWVcIYjYbf6JdE0kxXwkmPFNcfDzGHbcOmGR00IHoJDkjEzA2hU2sLDtK
 ADQXBP97vKHbo3Z7MhAHH2EyBfpW06M8NU3pc99KTbix8IKXuo3FLTaav g==;
X-CSE-ConnectionGUID: iyLvZdOwSiiqI8sj+FsEGg==
X-CSE-MsgGUID: Koc8oXWlRgyqU6+2QbQljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62013272"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62013272"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:33:32 -0700
X-CSE-ConnectionGUID: tx3l2PgCTVm3npz5KH9awA==
X-CSE-MsgGUID: N/R54zeUQNq4gkizGJSrcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186704055"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:33:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 04:33:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 04:33:31 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 04:33:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJk1KHZ9jRaK9hgAwKqRowucAA9HePiWEduRyov/GZZy3IuxlKMzMxHoUkgxtFF3oRJc+jB9JgXkKLKkt8XViCkC4JKwmgpBhpI+PhPsyPooHhzZGMWGg1EYMzyqDUT9rzcqYV+sk2JAuXS0tZInmFFRH17j4C0oeL5H2Xzjm0DkI52Am5QRriEFZqlInAzQNpBQK8NHlllYZUPCLSVxiyzdSnWfRooW2XGjoqwEEuK5ayTNtrXfXkmP2cgBhNbDimitoxD2+2iE4c3TNkUVJMwuAdsh9THMPWoe/QuUPEAXEQG7hFg8TgDS8dYzG8Mr4KUcVghm0kVsKNNegRhbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5zOGIo8saTDHYTh6NDUd/Bz3JT8nBVZ0o+fo1ymMV0=;
 b=CM0xIvSYN3SOL9dMg0ksHUVydYwzGEjgz2HIw9CfxR+zsdk2GS+mjJzT7ZnNyD/vBsGddbbnJYUEg1pDngyAg7KOXCM8JrVb27tDrgH0heEgJDi6e2jo31NIY3wESfInL5PNYtoGBym6jDA26vzOO+vdNCApITj4YjRC1fdPO1MEfSA05yp0qQBeT0RkTNMd7YEx2RU1E2FOZBWTHgthBeXLoltDXWSaPENP6AaMDZlcKgAt3CxmDlJTcpMwwKRM3yaGO0Iq6VXXmOqMChKLds2h+jVjmEIjaUGR1YC+jrNqGpUZyTdnjNcCWdhBSKHfx0qiePGO7ISdXcEC41LXhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 11:33:28 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 11:33:28 +0000
Message-ID: <d264b175-76ea-4336-92a0-e377dd7e5b0e@intel.com>
Date: Thu, 16 Oct 2025 13:33:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/pf: Promote VFs provisioning helpers
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
 <20251015091211.592-2-michal.wajdeczko@intel.com>
 <20251015130033.fsiaela2k64kicm6@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251015130033.fsiaela2k64kicm6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0044.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: f6aa955f-91ac-4452-bb7c-08de0ca7d3d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXVlbzVqRlRXV0ZuM3FJMlhtOU0rZktJQUhqVU5DcXh5LzVjTjBqVTYrNGVD?=
 =?utf-8?B?Ykx2WXBjcDFMeFFZc3F6b2hpRFZ5YWNKRmVwMlU2WkxQWldiZ3NnOGt3UzFn?=
 =?utf-8?B?ckFoY1NVdTBISm53akUrcDdXRStxTTFjR2RqdExDN2x4QndTTnk2Y2R3WkNt?=
 =?utf-8?B?b3p1UllibVpBbWszeVBGbjhaK2FlTkg5WktrWTA2bHJQeklnTlduNjNrZ3h3?=
 =?utf-8?B?OVFTalJ4STFTY3VsSlVwcWtTdS9ncHhUd0VaTGQxMm4vZTE2TmNhNi9WWXZ4?=
 =?utf-8?B?eXpsMU5ybkFaalFQS3BZNjh6cXUrT2VUWlQzM3phT2cxSjU4S1BKTUpLTFcz?=
 =?utf-8?B?enRnRzNzSnVxL3lYMHcyeFh3WlF3NThFU2k4SlFjT1Z2RG1ZYXQwK1VLaDE0?=
 =?utf-8?B?T0NZTnYyMExJUjhtalk5U1VSczJNcm5aOHdRTzNXZHQzaHhMK1E0U3Nlc3VE?=
 =?utf-8?B?bllwWG9SYmlvK0puRzZ1Y2NwNmFEYys4WFpMZVBvNWw3cCswWTZOM0lVWml6?=
 =?utf-8?B?Z2srT3VVL1ZtYkV3L00xYUhtc0NmOVM0Zm9Td0dQN2JVL2tTckFzbWtsZVZ4?=
 =?utf-8?B?VXV0Z1M5VUJ4bWxNTmF5MjVUVzR6VGwxd1FtSmoyOTZ1eGYyQkRqYUkrUTdG?=
 =?utf-8?B?UkVJbW00VWNmdEVtdkx5bXFQc1dwWXZtc2ExRHUvQ0xMdk1mMkNKejNKWlE0?=
 =?utf-8?B?L3pqenJDUnNKeUoyOWNPRnRwRjRWQ1hOQW0weExrUWc5K3ZRS1VPWUtQVyt4?=
 =?utf-8?B?bHdLOUFpYXBUdy9nbG1tSDcyQk9hM3J2WEI0ajJPcU9LM3EzM1pEVDdGWkZn?=
 =?utf-8?B?OG56bERHY043OXJqTG03MEdVMjBuRkZteTFxdkJqdW15Tkprb1J6NFBuV09D?=
 =?utf-8?B?S2w4aDRYbGdldDFQbmJTK2htZ2M3WHNmYTRzanhCZjI4ZGpxanZJWS9Ld0lY?=
 =?utf-8?B?TUhKQ0JMR3hSWUNsUFBiazZ1QlRURDJuOWU4aDZXUjlOWmxzSlVzTHBlMWk0?=
 =?utf-8?B?d3VTdytaSHRvaHg3d2NCOGNGK2dQZVJ6QnhpajFHajVMUWdVU1dYN2tlTkRs?=
 =?utf-8?B?K29jZCtqV0JiNmFzemU2SUtxcDZuMTRRZUVKeDZwOHVCbElVa2ZQaFE1VFo2?=
 =?utf-8?B?M2NSOThreVQveE9ocnlncEppZ1o2S0Y1MG1zc3dvU1NTQVB2L2lTc1BQTXdZ?=
 =?utf-8?B?Rmhzb3JmTzFBTW1uSlRBWFUrdy9GaXZMMVpqWWNUb2pjeG92QisyYXNlZzg1?=
 =?utf-8?B?K0VUQkZGb1g2bGRqSjljdFNBbDdTR21WdG1BOTNNcjZTYlVzUWt4RXhxa0FU?=
 =?utf-8?B?eVhDbGNEMDJRbkNDREJnZ2ltSHRCZXp4TWtiMTlhMnhSTFVTODBlSlRvSjZF?=
 =?utf-8?B?UHBvc3Y5L2M4bDlNOUpNZ25ZQ2JMaERjeE1SRDFRdnUzL0FHL1hvNTlsNkJm?=
 =?utf-8?B?YzZXV21Ld01CbGtyeXhOVllxSlR6dnlBRE5KS1dqRlBOaTFTSVZyNDNGeDdn?=
 =?utf-8?B?bXFabkVjd05YNzVvOGVzR1l6eWs3WkZzTWN1dVpiWDBwSWNmRXRxVGs4VXdQ?=
 =?utf-8?B?MXNybDhTb3h2VDlCTmg2L0I0UGY5d1ByRjE3SFBLU1VMbWNGUEEwS2pYR2lF?=
 =?utf-8?B?UmhxMHFpUXNQTEFwd21XVkFkeHE0RzFkdlh0TlIxd3B4M292VkxiRGMzUGNC?=
 =?utf-8?B?ZE5mOVBNS293TzBYUVFOaEJJYlZ1VTBBVmZKa1d0TkJUamZrT1dMRHN5ekxv?=
 =?utf-8?B?NWNITUx6cHZhb1NiTmdONGVPUnF3TCtVY0dsWTBadENyaWpSOWduMHVMeS9C?=
 =?utf-8?B?UDlqSFNhZ3NjUzAyTUVneUdVQ2VycXczMFR3dS8zbTFpelU1RWViSDEwcURv?=
 =?utf-8?B?R2ZxS1M5d0RSQ0FQWFk0dEd0UGZ0bkFoZHJFTmN3THJ6TVRMQUN4cG5Ma1NH?=
 =?utf-8?Q?lRJlDkNqUnn+v+JdqukMGo++BJgUGMyE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUV4ZHB6aDkyd2xiWWJkQ3p3L2VXdENCa3JEVUJzSndlTkxnNWQ3SXEvU1Vz?=
 =?utf-8?B?a2pTdlBGWnFFVm1JdmI1ZGxzRUxDbVZpUk9VYkJmbXc1V2YvQXl0SndlMGFI?=
 =?utf-8?B?VW5PR0V5OVl2ZjVCRTZhb2pQbjExbnVNSHgwNDg4Z0xKc1ZvSmQzcjdUVWhp?=
 =?utf-8?B?bWFKUkl4azN5dEVnMVplZnJQckdrS1RvZlhlV09GME8xOENKZkFJY1BEazl4?=
 =?utf-8?B?a0ttSjdyKytaZ2FJM0syQWxSNllHR1BmdC9NclZBZ01lbDhCYUp2eEZJOXZ1?=
 =?utf-8?B?NWdSSTRKUGtQMjYwUmk5dHlSOTEzU3dFbzVCSHhmY3JEa0NyaWRHT3Zyek9t?=
 =?utf-8?B?U3RpVGdRN0VlUi84WUlxQ3BucmxLeENRWksxVktxWlpXdVNKUzV0Mk14ZkpZ?=
 =?utf-8?B?VXFMSFErVGhQKzUwOHRhdkJuQmRyclNKbHdPKzEwVXZUT2VVaUdaZzBGbGxn?=
 =?utf-8?B?Szk3M1AwN29kbnV4VUNJT1E2SHkra0RPbmpkclIwdFBlbC9hc09TZ0pMb3ND?=
 =?utf-8?B?a2crZ1BxQVJIcFZ1WHU5TVBqNWhOTVNNNUJ3WGszVHNtcnpUWVVEcTEzT3Y1?=
 =?utf-8?B?Y084Vk91VXJydjBlWkdRNUJiRkkva1RZY0l3ZC8zVFZQeVNOc05VWU9SMkVO?=
 =?utf-8?B?Vk5Rb1pMQnRkdHE1aGdBN2dUM3ZJRGo3Uno0RExTWlhNTWlFNFkzaDhQQ0tH?=
 =?utf-8?B?bXJTK1pIMi9FM0o4d2Z4TEZxT3FtN3U5b3dibUhwVG4ySTgzZTE1RUZZUkFD?=
 =?utf-8?B?MWhNOFphYXhPeWxzVDEydnEwZHE4K2ROeVRPU1Y4clVWU2tON0NEOEd4OFQw?=
 =?utf-8?B?VFlCNTBUZWdoWGJNV08wYTN1d3JCV0ExZDF5akhBSVQyeGlrZm9wU3U1aCt0?=
 =?utf-8?B?U29tMXNlL0ovVXVZOGhTQjkyQXFvRW1mWUVBa0w3N3c0blFQWTk2NUNOdXhh?=
 =?utf-8?B?ZGpERkVoenFXSUhuenVyZDMzQk4zNUYrVGgveE1WZkJzVFAvRFBFMVdLQS9B?=
 =?utf-8?B?ZWJJeWVIVkNMelZyRWVCY1NoSWdHcVoyR1RXRmhVQnF0YXhZVE9iem1VMW9L?=
 =?utf-8?B?VTgwNkhxMDFYVkNWbGoyMlBtSXhrWWtQeUhqT0VyNytydWRHMlAvaTY3Ykdr?=
 =?utf-8?B?VEM3Zm4xN2RZMFdLTWwxSFVPdUFrdGNEclhnTGJpYTNyVFlzcTRSNGUrcExT?=
 =?utf-8?B?UE51NmxSVzBFa0ZUSHRFRUo2d3p2eUV2SXpwQ0REeFptYXpQK2g5dGg0czh0?=
 =?utf-8?B?VHdRU1dYMHYzTURsUjArYkVuaTdYZ0lTL2s2WXFWTElKVG0wOFZxK0ZZRENT?=
 =?utf-8?B?MmpTcWZnOGZvVm4zaFF3b1NpSGtMU244ZGtNTTIySlBjYXhpQ0FyWUtkVGIy?=
 =?utf-8?B?Y3R0WnFKZ0hxNTFxakpOQWJGK1FrN2ppblJsUE5XWmZmTUdrUTJoR3N1aWZs?=
 =?utf-8?B?RkJON3Y4WlB0U2RZSzFZQXlOVUdSU3NtTjVCbkFtSXJVZzRnQWs5cmVMMDdS?=
 =?utf-8?B?eGNpYnJDNnlCcVVla2RnMWtSQkR4ZnRMUHZ1WEVTaURNSlIyMFpQQ3lybjF3?=
 =?utf-8?B?dTloV04raHM3SmRPS05TN2RkVktCSW1NTFBndU1HUU1sTzZQZDc4djN1YkZk?=
 =?utf-8?B?ZHFpcjkvcVVwYWR2eDBRU2FZeWtOam1ESk1oZWlvaUVTL2pWemxBSVg3Q1FL?=
 =?utf-8?B?cHhYai83ekN2VEpwTzNEeVRwRkF1UGlXd1R2ekVvOU5RWFJFYVJaYWpGcEMw?=
 =?utf-8?B?RzI3Y20xa21EVDQ1VFdwZUZSZythbG5aQzg4MTl1cVZoWGtiYzhxeXk3QWZ2?=
 =?utf-8?B?T2ZoQ3g4cXJYWTc0Wm9LQTk5ajlRUk94RU15U2ZIbWNVQXY0NG8yUFRWUjdW?=
 =?utf-8?B?aXhraGN3OElpdy9idGpMRlNTeGQ3VndpTTI0ZFhHdCtZdjRhdWhVOG5QUmFn?=
 =?utf-8?B?Zk1DbnIzTVM2Q3FuRnV4M3FtVzVDbkppL3ArMEhtU3VYUG1sRmllelVJc2Nw?=
 =?utf-8?B?Y3EzY1FwMVpWU0czQ2dQRmRNVWpGaEprb3Jpd3pKdnlxUkJuMzhlU3kyalQ0?=
 =?utf-8?B?cU8wWmx6enRSMDFvcHQ5SEV5U2tXQ1pwdUZZVGszYjNJOHdKaFkyU05RMjRE?=
 =?utf-8?B?TU5PWSs2bFJVUFJDWERvV3oxenJVMHY2eThCZUs1SVVKN0g4NlFIYWlDaVlY?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6aa955f-91ac-4452-bb7c-08de0ca7d3d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 11:33:28.8564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdEWcf7xQgJ2zFNj3IpNi4g1N4n/Du+2OhErntaBg5wz0T5pRuz35D+HVG9lcEPYUhlewN/fC3Gp3CnZtlVTQrGhfSWD/y4/jp8ZEmoQ2As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
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



On 10/15/2025 3:00 PM, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-paź-15 11:12:06 +0200]:
>> As we plan to add more VFs provisioning methods, start moving
>> related code into single place.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile                |  1 +
>>  drivers/gpu/drm/xe/xe_pci_sriov.c          | 45 ++----------
>>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 83 ++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_sriov_pf_provision.h | 14 ++++
>>  4 files changed, 102 insertions(+), 41 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 84321fad3265..edae0c2a6e2f 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -176,6 +176,7 @@ xe-$(CONFIG_PCI_IOV) += \
>>  	xe_sriov_pf.o \
>>  	xe_sriov_pf_control.o \
>>  	xe_sriov_pf_debugfs.o \
>> +	xe_sriov_pf_provision.o \
>>  	xe_sriov_pf_service.o \
>>  	xe_tile_sriov_pf_debugfs.o
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> index 9c1c9e669b04..735f51effc7a 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -19,46 +19,9 @@
>>  #include "xe_sriov_pf.h"
>>  #include "xe_sriov_pf_control.h"
>>  #include "xe_sriov_pf_helpers.h"
>> +#include "xe_sriov_pf_provision.h"
>>  #include "xe_sriov_printk.h"
>>  
>> -static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
>> -{
>> -	unsigned int n;
>> -
>> -	for (n = 1; n <= num_vfs; n++)
>> -		if (!xe_gt_sriov_pf_config_is_empty(gt, n))
>> -			return false;
>> -
>> -	return true;
>> -}
>> -
>> -static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>> -{
>> -	struct xe_gt *gt;
>> -	unsigned int id;
>> -	int result = 0, err;
>> -
>> -	for_each_gt(gt, xe, id) {
>> -		if (!pf_needs_provisioning(gt, num_vfs))
>> -			continue;
>> -		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
>> -		result = result ?: err;
>> -	}
>> -
>> -	return result;
>> -}
>> -
>> -static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>> -{
>> -	struct xe_gt *gt;
>> -	unsigned int id;
>> -	unsigned int n;
>> -
>> -	for_each_gt(gt, xe, id)
>> -		for (n = 1; n <= num_vfs; n++)
>> -			xe_gt_sriov_pf_config_release(gt, n, true);
>> -}
>> -
>>  static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
>>  {
>>  	unsigned int n;
>> @@ -168,7 +131,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>  	 */
>>  	xe_pm_runtime_get_noresume(xe);
>>  
>> -	err = pf_provision_vfs(xe, num_vfs);
>> +	err = xe_sriov_pf_provision_vfs(xe, num_vfs);
>>  	if (err < 0)
>>  		goto failed;
>>  
>> @@ -192,7 +155,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>  	return num_vfs;
>>  
>>  failed:
>> -	pf_unprovision_vfs(xe, num_vfs);
>> +	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>>  	xe_pm_runtime_put(xe);
>>  out:
>>  	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>> @@ -218,7 +181,7 @@ static int pf_disable_vfs(struct xe_device *xe)
>>  
>>  	pf_reset_vfs(xe, num_vfs);
>>  
>> -	pf_unprovision_vfs(xe, num_vfs);
>> +	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>>  
>>  	/* not needed anymore - see pf_enable_vfs() */
>>  	xe_pm_runtime_put(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>> new file mode 100644
>> index 000000000000..c24803312231
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>> @@ -0,0 +1,83 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "xe_assert.h"
>> +#include "xe_device.h"
>> +#include "xe_gt_sriov_pf_config.h"
>> +#include "xe_sriov.h"
>> +#include "xe_sriov_pf_helpers.h"
>> +#include "xe_sriov_pf_provision.h"
>> +
>> +static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
> 
> NIT: Why don't you use bool here?

this is pure copy-paste, it was "int" already there

but I can change it why applying

> 
> 
>> +{
>> +	unsigned int n;
>> +
>> +	for (n = 1; n <= num_vfs; n++)
>> +		if (!xe_gt_sriov_pf_config_is_empty(gt, n))
>> +			return false;
>> +
>> +	return true;
>> +}
>> +
>> +static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	int result = 0;
>> +	int err;
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		if (!pf_needs_provisioning(gt, num_vfs))
>> +			continue;
>> +		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
>> +		result = result ?: err;
>> +	}
>> +
>> +	return result;
>> +}
>> +
>> +static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	unsigned int n;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		for (n = 1; n <= num_vfs; n++)
>> +			xe_gt_sriov_pf_config_release(gt, n, true);
>> +}
>> +
>> +/**
>> + * xe_sriov_pf_provision_vfs() - Provision VFs in auto-mode.
>> + * @xe: the PF &xe_device
>> + * @num_vfs: the number of VFs to auto-provision
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>> +{
>> +	xe_assert(xe, IS_SRIOV_PF(xe));
>> +
>> +	return pf_provision_vfs(xe, num_vfs);
>> +}
>> +
>> +/**
>> + * xe_sriov_pf_unprovision_vfs() - Unprovision VFs in auto-mode.
>> + * @xe: the PF &xe_device
>> + * @num_vfs: the number of VFs to unprovision
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>> +{
>> +	xe_assert(xe, IS_SRIOV_PF(xe));
>> +
>> +	pf_unprovision_vfs(xe, num_vfs);
>> +	return 0;
>> +}
> 
> NIT: Perhaps it would be worth adding the assertion num_vfs > 0 here.

it's harmless here and in pf_unprovision_vfs() where the loop is from 1

	for (n = 1; n <= num_vfs; n++)

> 
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
>> new file mode 100644
>> index 000000000000..f6a902190ad7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SRIOV_PF_PROVISION_H_
>> +#define _XE_SRIOV_PF_PROVISION_H_
>> +
>> +struct xe_device;
>> +
>> +int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
>> +int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
>> +
>> +#endif
> 
> Minor comments, but the code looks okay:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
>> -- 
>> 2.47.1
>>
> 

