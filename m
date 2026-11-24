Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9A606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gy+gotUv;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MgIh98m2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B74010E1EA;
	Tue, 24 Nov 2026 05:54:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317AD10E1EA
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 05:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795499630; x=1827035630;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HW8J2racLFA2tm9YYq+Nwfu1sV2/BKBeXOu2r9JQMb8=;
 b=gy+gotUv7b7zAODvK8TRPhfwS56/r3+YhhC2YTAPY+jXGkGZj6YHWvsb
 EaCQP69oJTzVjJBT1PnNGhJNkh72/uMSN7GgSgbh8qmJprwyktMkfodtL
 RFofg3uDGGSmqXyVwlVjiNX/clzf5fJoiXb5lVjJH8MAsHmxY3PhTH9lb
 HGqpWciih0+avmglDnZvotwoG7SjrvTEKiQ0MFJfSZRzdynxwgNIxG1eL
 gIurRisgBO1V9KiVa9ZRqc/dOAb4eY7+ico6iTt6ijdzfAIzqXVzqdv7C
 djivOOuwiDJV0guo3/U0bt9n0LVhzzqw5WMsoR3ij2FYMS2SNbYzePcoR g==;
X-CSE-ConnectionGUID: pZYI0fE2TVyiFouPoJOCEw==
X-CSE-MsgGUID: V9NIThRpSMKADBWfBSggoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4362235"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4362235"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:49:05 -0800
X-CSE-ConnectionGUID: uz7OSq2yQYCilI1A+G9fkw==
X-CSE-MsgGUID: iIVd8VXAQmWKLghICTvemg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="13473502"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:49:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 21:49:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 21:49:05 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 21:49:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTZ/sW4lySMqQrqlclfLt9ho0izpCYlUZu5kx1Eit1QYt7ITlgDyVvEfsahNFC9beTlrC//UgmHZbP1FThaowYZIc66BEHTXFKo3TmsM6Y9jysM8o0UUBMYiTQllqREFXXPWIif7SnL8RLJjFJb0eBOUzx/xwn40kh5wv++aPC9FRv1uDMMBOzS6OjI0/cmB4gD2rAiWZGQ/lTnXCSl4uJAWS08jnXSfSUvR0actVbu3y39xcmAV/rhg8ZI3k+/XaSmyXu8r2ovKPCPeJRQzDT3AJp5xsrKFdyye0HgBQMNRpGo96jdDDGwVdN1OG9z+W30d2gcrLR8JPCQgB0Kghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EI6XlKe8nmM6039LHWcHmzQ/lVYtuJViAv/2wEXyKM=;
 b=KSNh3hI0V9ywBYC7Sy4MpZZ5DFgTyTJFjDgnk8S7ltiv0odhjR+YhTeVLwn8goXGQkJMM+i/+25nsxVQZ+IYup9+T7RW110D6EE43lK3Nu21Kjqy3tLCX8eV9oiQNnjlrXg3qfUNU3H3XTJsQy8MHgx95XH7dPOFSrp51fojuyjyobZNJIjK5v/2u9Lkg9xhzGfxbxhBD+3MNFaRqhb9B3+Y/z4yK4kEJKwyHtK9yQeDPo/KTEFEMjRIJke1yPHSwd/OEnT/qZDCJNfSxgvpvFzsCWJhDVhfoeHe3WjYcb9yLWlgIfww5r9LhMTMqa5XzhMT5jUJyGPpB+fAVdrBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EI6XlKe8nmM6039LHWcHmzQ/lVYtuJViAv/2wEXyKM=;
 b=MgIh98m2FvHIllO9+kk6DlOUx14sSv+y/y3O9BcFtDGtZ1re/a5COm842F4pleYCTLyr1bXl1O2tAJRd5bfv3W+uJv/cAaquU2wWuHSW5NkX78mMBnko5x7Fe7z0aYtcNX+wAQYPqe0mvom0XZTD5RAPtCwD0agLM9KhkrprGsY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DSVPR11MB483333.namprd11.prod.outlook.com
 (2603:10b6:8:3e9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 05:48:51 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 05:48:51 +0000
Message-ID: <6379b49a-64f9-4bb7-8604-074d0d0f32f5@intel.com>
Date: Tue, 24 Nov 2026 11:18:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/xe: run compute rebind worker on device NUMA
 node
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
 <20261120-userptr-repin-v2-6-65e1f6e582ef@intel.com>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261120-userptr-repin-v2-6-65e1f6e582ef@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0132.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DSVPR11MB483333:EE_
X-MS-Office365-Filtering-Correlation-Id: a662d82e-62d8-4a2a-abee-08df49ee9e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|22082099003|261009223027099003|3023799007|261021121427099003|261021123027099003|261026140227099003|261022105027099003|261102123227099003|261026121527099003|261022075727099003|261028144727099003|56012099006|4143699003|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: p1lmJ7TqqfV0jnqBBz+sUG1mFhU45aMasP5bpN2Rqpk331QztGUPT5YeBtRu1F9Jw95nx/0fffdlJ8q8fXpjffvYkoTYdkZzsKOR1w0uYm1+m+H9HN33uYpG1TmrWPMdqERePVXfVAU6VW4L6xTQyMPnOHYxsUeb540I6A/7XAzj35NgZxCoL6VmRoIuN27ev8le+M0O832zSaRzjBSzGttxFsHC8l8vM1FKDdGqnpmh66+/mlAwG/8Y/2hfVHuzXG1wbyBEEYMjiOXQEn3g9i7vujZ3Ma+iHKa0E96j7b34hxmCmDi0WUb/IRHi+hIkCpQxMQ2bCLDVOloj9RgZEQWy7JM1iivs4gsHLpg/dcjpGFGWcMcRKLQZKTbOHrZw0D6rOkVhtjPKjT/mlEZICTYJxi2NxwGreh1ZqPDW6EDI1pjp3V5QvPd7K0Sbriw9Z0F78TRUiOD9b3k8XHdXqekaf2a38uwnKt5B84cJORrMeVjvTFYR8jhfLPVTrDCx/2OUExnszoUkjPWBKTLuL7YuSs3MpY9gWaQlleAu+2oEf5+H6CtyLeJFGGJuDxXKqZHmokV/KdANyc1mXAxtLKG1PBGcp4o4xTTe+Ktv1i4nwy4kHa8uFmtS4wHwRqKvGYmiR3XtE0ILcbjfz4CkILNUvVCQq5sXJgDbk4pVtTE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(3023799007)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(261102123227099003)(261026121527099003)(261022075727099003)(261028144727099003)(56012099006)(4143699003)(10067099003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFZRbG9uWFBJazYvaXFUMUZ4T1p2WXkvWjI1ais0RHlnbWpiSWlqOXdMUDZy?=
 =?utf-8?B?TExDdTZqT1JsVWxlWHRkQ0ZwQm42Y2M1d2ZpazMyeTRWSU9RaWxQU1dTQzJE?=
 =?utf-8?B?Z2VmeklzcFVEdmZkYTJuR1lDNFRnL3pJZVFWcDNRdjhUWnRzdU9xNEZBbG0z?=
 =?utf-8?B?UjFzRGIzelNyZ0pRTkE5Y3NYNm1TdUQ3UXhBWE5QdlpUR3ljU1N1Q3dMQmpo?=
 =?utf-8?B?QVRselVwZStpK1MzZFNRSVZDczA1S1pCSEtmSEk5cGtiSWtNQkRLckJCT2VX?=
 =?utf-8?B?LzIxVE9CQWFtckZtVVpHVmdCS0M5V1doQXNiOEIzMU85U01QZTVIOXFSOFMr?=
 =?utf-8?B?bGVPbTNCTWE0bGw0Q2E3M0w1a2RKek1GdHBHMXhDWjFmSnFLWFNodjd6Wm0y?=
 =?utf-8?B?akJONEtXYnBHaEc3SGdwcm1oMlZZdEc2TXlsK1BNLzd3Z2c4L1hOMjR3a1pC?=
 =?utf-8?B?NDlDVzZtcmZ4cnBKK1pqMlhRODFUaUpiekgyL2R6ZGRnKzBRWjRyYk45c1di?=
 =?utf-8?B?SlJDd0kySVBlNklBTFRYZEhoQml5UGNxbkdkVEhwbExGK2Rkc2k0aURsZ3hv?=
 =?utf-8?B?bWI0OE0vVTVjRjdkU2lER1YzQmlnN0txR2N4bnkwR3F6R2kvMTFMNEszaDJL?=
 =?utf-8?B?RkZwY2tYd0wyVytGV2ROWlQyNnNtZ2EvSG1BNEU3Y0RUNWpGb1lMcDdhdkpl?=
 =?utf-8?B?MTlSU2RRY0wrbVU1U1VITjJVSlhyOENqQ1BuREJJZldKbThYNjhPV0JBazdW?=
 =?utf-8?B?VnljSjJaWEVLMUwrSW5vYjhsQTJWa20wYlA4MGhITVljUnFjcnF4NzM3K1RV?=
 =?utf-8?B?WTl3UEpkSHhWTjJ3RnM2eEN1a1N6VVhQY2Y4ZmZOTVd1YUx6b1c2QzJCeHQ4?=
 =?utf-8?B?ekVwYnZMOHdBWDM3L1F0ME1Hb085aXBHa3E1RmZGeDdzaXJrOWZSZnl1dXlV?=
 =?utf-8?B?cWxQRHR6Z2dNOUNVdURyTEVYQmRWUGd3aDJqRVFwbG5xb2dJTHVKU0V6VGpn?=
 =?utf-8?B?Sm4xb2twczdYMjFnSUZTR3hwWG82OVJ2VVJseW42cU81eXJ1WmJvRDFoUkVN?=
 =?utf-8?B?eXFCRDhRZlNPWDl2dE9lQkpqdkt0bnV4Qm1RazRaVUFsTXhETTlKWkt0RFAy?=
 =?utf-8?B?S1hBQTUxa3A5WFRnVFh5cHlObzd2RlVtL29paFFKbWwvaElyOUl4OFQ1bXpo?=
 =?utf-8?B?SUJpeFBtVWozL3NhSUk4ZmxkQ0JNV1JLcTRVSCtod3Y3RmcvYm95WUVNa0px?=
 =?utf-8?B?a0Zxc2JvWEQ1Vzd6UDUvc0VSSEVhaDFSMjBrVC9VNnhZSnhxSkJlVDJReUlI?=
 =?utf-8?B?MTR3UklWblpQdTNUb3BXelhWRFg3MmFDOWhhU205bmNsZ0pteUZtR29sTGY5?=
 =?utf-8?B?MW9xdUVLeUpFRi82Z0Q5R3hXQnVZMG9POERNdlBWak8vS3l2ZDJTbktaTFVR?=
 =?utf-8?B?ZnNFbnQzSmowTGt2UFlPTGdQN0lla3c2NlJrR01ZV0lNbG1FVktpeWJvZ245?=
 =?utf-8?B?T2tJKzZueG1Ha3hkRE1XWlBvT2IyeURHL00rS2pXUGxMblljRG1QTG4yU1hD?=
 =?utf-8?B?ZmxzMFQ0T241TlNDOXJURmkzQTc5ZEZYcjVwRUtJTE93SnJ6dmpDd2tMelRv?=
 =?utf-8?B?cm5ndXdUNkZXZ2pNeDB4MjJXV3Y3cFhUZURvSEttMXRaekpUWlBYMmtITHli?=
 =?utf-8?B?SkNrV0l3ZjAwZ3pXbjhWWXgzbGl5VVlwWEtyUGhtYlZ3aVA1cnRaUTNDbGFL?=
 =?utf-8?B?SkliYzNYYnBiVExVLytjSWgrY21OWEtZT0NORGtYM0trdXFrbzRLbWQ4UEpT?=
 =?utf-8?B?ZEUrWXV0TEZGRFl2QlVpVzNYbDNsN3A0b3Vtd0NDZ3NudThQd0dSbkpEQWFF?=
 =?utf-8?B?dXNoMDhHOGlnUzBsTFFpWjNHaVE4S0loK1ZhTXFNdXRFd2tpUzNwaTByTGlL?=
 =?utf-8?B?a3lpaktMVDhuOWF0SjN6VU1XUkdCN1ZXKzNDUzVkL3VwTElCUVBoM2xIUldV?=
 =?utf-8?B?Rm9HYVlQUnhOU0ZVeG1jSjlkTHN4b1ZaTE1jd1BnYmR0Z0R4dDZqeTRaUm9l?=
 =?utf-8?B?d0JqNGtvaHMyaktuSTJEcnF2VDdiTjVzQmwxek5CS0ZYSUl5MnE3SUlGWG5S?=
 =?utf-8?B?Z01FSXYvMzJzUi9acGJONHhhOCtTUlg1T2ViWU1hR1pNc0ZOWGQ0U1JEQzA2?=
 =?utf-8?B?Q3hqY25TM0JVZnBBa1dhcEp0Z0I5ZktEYTV4SFNuc2t2V1pwM21PeXhPbnNs?=
 =?utf-8?B?aWdEOXFYV3FQbnhLTytxOHowRlVLaGsyRDd3VHpXZWpRUjl0MWltV2tTTVlo?=
 =?utf-8?B?OVlkYTBIbTB0bTFNRW9KbEUwREY2NjNuMi83QjczRy9kU0xGc1R6NjBkM2hl?=
 =?utf-8?Q?bW6ivznhcTtYhet0=3D?=
X-Exchange-RoutingPolicyChecked: l6xM41h/sYVQEgvRaAVX5kESlVxRDm4Ewd73jyXSABUX7CpSt13WCrMe2MqCJbQwO5wB9cjQASTTPer9+kByr3lYKKu1gt6SJCj2tTif/uT42A64bJ1XXGbdkB1gJiCPQiTQ4M/abh2yfqfASIrAI49SFpyVi7n3UjwNEoFFeS2ok/zD4M4njpVfEr9v9GjYKORXGQo1lVXrlPadtQZvPw0bkT4LgioGmmSnqP7nfal74Er2dtmJDXrc3ZFUSPlfrk9sHTOLBYnRVh82Y8p9kHcACGoQiLDBQRz2o9+3zcd1fH9d0USR3FRGBYDppYp2CBjg84g88oblS/FA/OQCHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a662d82e-62d8-4a2a-abee-08df49ee9e0e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 05:48:51.4073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GN/UxVmtlJ+J/mSy+ise8mZShhBAPp5PMn4qgKKFwTEafYWCJ5iiZjmvj4sOkTW2DeKz1cdQW5DNM0W0wHfX2ZBZ6pZsllniM57qb+k50VI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB483333
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 20-11-2026 18:32, Matthew Auld wrote:
> preempt_rebind_work_func() currently runs on xe->ordered_wq, whose
> unbound worker pool spans all NUMA nodes. On multi-socket systems, if
> the rebind worker runs on a remote socket when faulting userptr pages
> marked PROT_NONE by AutoNUMA, hmm_range_fault() invokes do_numa_page()
> using the worker's NUMA node and triggers migrate_misplaced_folio(),
> pulling pages away from the GPU's local node and causing self-inflicted
> MMU notifier invalidations.
>
> Historically, xe->ordered_wq also serialised compute VM rebinds across
> the device to avoid eviction ping-pong, which should no longer be
> necessary since commit 8f25e5abcbfb ("drm/xe: Convert existing drm_exec
> transactions for exhaustive eviction") serialises OOM eviction via
> xe_validation_ctx.
>
> Move vm->preempt.rebind_work onto a dedicated WQ_UNBOUND workqueue
> queued via queue_work_node() with dev_to_node(), leaving user-fence
> signalling on xe->ordered_wq.
>
> v2 (Thomas):
>   - Drop the whole 1-at-a-time ordered wq requirement for the worker.
>   - Move the rebind destroy before destroy_wq; much safer.
>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       | 7 ++++++-
>   drivers/gpu/drm/xe/xe_device_types.h | 6 +++++-
>   drivers/gpu/drm/xe/xe_vm.c           | 2 +-
>   drivers/gpu/drm/xe/xe_vm.h           | 6 +++++-
>   4 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f0c88d3297f9..8dfc8ef9dbd7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -10,6 +10,7 @@
>   #include <linux/error-injection.h>
>   #include <linux/nodemask.h>
>   #include <linux/units.h>
> +#include <linux/workqueue.h>
>   
>   #include <drm/drm_client.h>
>   #include <drm/drm_gem_ttm_helper.h>
> @@ -390,6 +391,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>   	if (xe->preempt_fence_wq)
>   		destroy_workqueue(xe->preempt_fence_wq);
>   
> +	if (xe->rebind_wq)
> +		destroy_workqueue(xe->rebind_wq);
> +
>   	if (xe->ordered_wq)
>   		destroy_workqueue(xe->ordered_wq);
>   
> @@ -523,10 +527,11 @@ int xe_device_init_early(struct xe_device *xe)
>   
>   	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
>   						       WQ_MEM_RECLAIM);
> +	xe->rebind_wq = alloc_workqueue("xe-rebind-wq", WQ_UNBOUND, 0);
>   	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>   	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
>   	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU | WQ_MEM_RECLAIM, 0);
> -	if (!xe->ordered_wq || !xe->unordered_wq ||
> +	if (!xe->ordered_wq || !xe->unordered_wq || !xe->rebind_wq ||
>   	    !xe->preempt_fence_wq || !xe->destroy_wq) {
>   		/*
>   		 * Cleanup done in xe_device_destroy via
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index fc80cd2c766e..778cc1c9b39a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -7,6 +7,7 @@
>   #define _XE_DEVICE_TYPES_H_
>   
>   #include <linux/pci.h>
> +#include <linux/workqueue.h>
>   
>   #include <drm/drm_device.h>
>   #include <drm/drm_file.h>
> @@ -375,7 +376,10 @@ struct xe_device {
>   	/** @preempt_fence_wq: used to serialize preempt fences */
>   	struct workqueue_struct *preempt_fence_wq;
>   
> -	/** @ordered_wq: used to serialize compute mode resume */
> +	/** @rebind_wq: used to run compute mode rebind work on device node */
> +	struct workqueue_struct *rebind_wq;
> +
> +	/** @ordered_wq: used to serialize ordered work */
>   	struct workqueue_struct *ordered_wq;
>   
>   	/** @unordered_wq: used to serialize unordered work */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0c5121361f8e..ab138d495f3f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -540,7 +540,7 @@ static bool vm_suspend_rebind_worker(struct xe_vm *vm)
>    */
>   void xe_vm_resume_rebind_worker(struct xe_vm *vm)
>   {
> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> +	xe_vm_queue_rebind_worker(vm);
>   }
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index b1c5f940bcc5..ed590bad892c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -6,6 +6,9 @@
>   #ifndef _XE_VM_H_
>   #define _XE_VM_H_
>   
> +#include <linux/device.h>
> +#include <linux/workqueue.h>
> +
>   #include "xe_assert.h"
>   #include "xe_bo_types.h"
>   #include "xe_macros.h"
> @@ -259,7 +262,8 @@ int xe_vm_validate_protected(struct xe_vm *vm);
>   static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>   {
>   	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> +	queue_work_node(dev_to_node(vm->xe->drm.dev), vm->xe->rebind_wq,
> +			&vm->preempt.rebind_work);


LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   }
>   
>   /**
>
