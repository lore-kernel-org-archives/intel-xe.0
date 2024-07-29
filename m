Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56906C3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 12:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2097610E05A;
	Mon, 29 Jul 2024 12:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDTM6azi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4941C10E177
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 12:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722254780; x=1753790780;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=0HzhfyvmJrgWEl6O48dOMGCSS7Dbh110B8jSVAk7FiI=;
 b=mDTM6aziA+RC0d7gPkdj5ywJH7O7trPk9pE2kxp5N4QzQG4xvxpSDwQR
 1jz1FzRtv7C/PBWxqmK56wmRI2okytFgOEg7FWfo0b4ExH4d916gtWc8p
 9B565cdrap2eZDkeL6D6+7htJdna7iZ9okbjHArUclN9HDFhRFWocbzqP
 GdWaybIlyJdbe46H8bI4KzWXZ7uJGAQYrt9SC6BRPIxWsnRinoOf+8Lm+
 n8QOf02xRmAXFE4KlbdDwdbRk+2CHRaE/21jGNoo75uHmgO4SmiGEadrs
 MFTtI5SwTYl8xh/87lHsMM/ss4ACD9pAuhyxrRaKxToM5DbUSDvb+pCHh w==;
X-CSE-ConnectionGUID: R70IulbUSQ2cz/ume7ZIaQ==
X-CSE-MsgGUID: Enp7U9qdRv+qYwqmxNV4Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19885593"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="19885593"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 05:06:20 -0700
X-CSE-ConnectionGUID: 7gB6016aTKyUQCtAprCBQQ==
X-CSE-MsgGUID: f4X/+NoXRLCovBjhiUpovg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="53869406"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 05:06:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 05:06:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 05:06:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 05:06:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 05:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyUbZ5DI7T1aTgzwmKQsDzDXcqCzUqP2KkhnmUCIa5J0iZUfM4qSSTptJ8Qcxr5VK+vG/fhTD7FYO/C7/caTsz5AzvAyDD48RvPUFMZuwTrBENhdirIDcTjwKg8k3c2P2kVrAl+9oERdSFMrYkNGWIigmJnj1sOfP82aA8SZqyLHz7f0PmjGFQ8ye0TeIr6fbP51firdJfX+bPWstarT0zkAa+MpLGf9yV07Ti54So34qH5iai6dkdGfTtkI4CZg3Xnl7KcYG/2H3psBVOyKJjKuCPVtsUCxV226IekVaIMcmakBFg09oJnQa/ziwV8Fl4U9GaGLk2CGppqeUVm6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJ5vSwD1qo+EvZlHSLcEYbrdLdXwZyOgMdrrz3kQYkM=;
 b=kCkX2gpRt5JN0RpHcFDNcThvZ8uGrCrtrKevgxhW0iETDwvvhPpjAWYGEoY9hKpgcI8U5vcCaFDPqP2zh+0d4+rpFEA8oT3ctwa3PsBL/xWCx9PJHczHefsSC5vHSjI/4vkTnORk3gTx6CMAymOkj/Gt5httMtiDy9s2f/NhW1/AhuyPxhzYSV15ZO70TptxAqSVv6LdTGzxpD+UjJyRAeQWkQ5Hmx3Ii3u1bB55AerdDm0iUrjPY67gj4A9HDezNwQGoiyImr53oWqjSrGf4h7viWh6V8hL2595dUjokxhaUQ5oicvgkZVIoSjw+0wWjjgp1ZSJ1c02DmOuaT+b4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB6984.namprd11.prod.outlook.com (2603:10b6:303:22e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 12:06:16 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 12:06:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240729105731.419850-1-osharabi@habana.ai>
References: <20240729105731.419850-1-osharabi@habana.ai>
Subject: Re: [PATCH] drm/xe/uapi: restructure query config types in an enum
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <obitton@habana.ai>, <kelbaz@habana.ai>, Ohad Sharabi <osharabi@habana.ai>
To: Ohad Sharabi <osharabi@habana.ai>, <intel-xe@lists.freedesktop.org>
Date: Mon, 29 Jul 2024 09:06:09 -0300
Message-ID: <172225476985.1863.5231937651565614803@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:303:b4::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: eedf00f0-d566-4a00-2970-08dcafc6d8ed
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1VqcG5VNjQvMmxremZ4RzBOdVhNZkt6dFNOUnFBUEZpN05MQmlyTTNTQU9N?=
 =?utf-8?B?YzBnNmM3MnZmRGYxQmdqdWZjclM4VmU4a3NacTBwWkZnTHlmTU1MRytoMG1Z?=
 =?utf-8?B?T1VzMUI2akhUejhpL2JMZXorbmJHY0xvTm12SWdJWjFQWHNFb3RUSnhqR3h5?=
 =?utf-8?B?TmFtU2RuRjlTTUFBYXZQc2hOZkhBc3VZZm91Vlc3blRYS1d3L05IUGE0c2hE?=
 =?utf-8?B?NFhOV2pVd3Y1b2d4UXd2ZTZTS0ErUnZMSExtdU9JcWpaMFNydThVKzlLdjdk?=
 =?utf-8?B?WGlRZDdKQ2M4bkRLaVB5OU5IellGTXlYZlBqdEE5b3hJNFJZQXM0NTZxNUFI?=
 =?utf-8?B?MDMzalN5dS93Vk1YYXEzUXlFcHdISlBPNVI2Tk1EdEFlWVFnaStNdGNpVWJ0?=
 =?utf-8?B?V0NKMi8wbDlNYlVkdnAyaXp1b25jZ2ZFNzNhK3dwK2tnUzQ0Z1FwVHlKb00y?=
 =?utf-8?B?TDZIY2lOYjBnUk9CWFh6K2p4S1dqSFNqN3FNdEZsL3NvZ3UzcHVZdGNPWWFj?=
 =?utf-8?B?ZnRMdy91WU9VMXMrUFAzRXZsQ204MTJmNXljTythemZ0LzV6S2hCWkJFUVI2?=
 =?utf-8?B?ZWozQi9FNm1FaU9tSXpFVjAyWG9Ca3cwV1B1bUVqT3hBU1RwUFBOUUh0MXpN?=
 =?utf-8?B?Umlxa0NxZE5yMDdGWXpJVXBZOXVKc1hOWUd4elN4eWZ5ZDlJMDdodTQ5V2l3?=
 =?utf-8?B?cmt1M0JjWVBHci90L2FWV09FTDIzUCt6U0xaeXVjL1k2TW5qR21OTHhOb1hL?=
 =?utf-8?B?YzZiTmI4clUvbjJsY09rQVBUMERxOXBGdkpGdmxGaS9WSzczQ1FyZEtMakts?=
 =?utf-8?B?MGk2T1pvWmQ5aWFIeHZhNHJUZkRQZVp6aE1kWXdHak9SY3VRaksrcXlQR1Rl?=
 =?utf-8?B?WWJiN2puYllRS0xKMDVaQXZjcjhHTGhjRnVPLzJTNGsvRnN2Wk1td0Q3UzJr?=
 =?utf-8?B?dGY5Qkg4aCtVcEEyM0FNVEI5UHVUd1R4ZVc2bVFiL0FlbGk1cmkwT3JCbzF1?=
 =?utf-8?B?UEZCb3ZQV3hXemdHQ1VCaVpkQktLa1JnQ0FidjRpK1hCbGVQd29IMVBmVUcz?=
 =?utf-8?B?RWFCVHVremZkcERPWnpId0pFSkxhTTJTRUcwM0ZCVXk0dENlY3djWjgwdjlz?=
 =?utf-8?B?STZJRXQzT1FKVndMcG91OGg5ZHJLbW5VMGRNK1ZoYUlRVithVzltckt6NUtn?=
 =?utf-8?B?QVY2dUI3YWRaOVF1K3NHOUJsaElDRzJUc0J1V3BrZXVqVHJGN2dGViszL2Vv?=
 =?utf-8?B?U2hyWk1lRXR5V0xHbW14bi94bWhWU1doSkRVNnVUWmFCZFRaUE1DZTFCbC9H?=
 =?utf-8?B?emgrTTBXNDlBTFFGaXFhdnpkSFFVNjdsdmdoYzV5K1J4SlY0VUgyaWNXbTVG?=
 =?utf-8?B?Zm1TTWxDQldPUDU1azlaa3VUb3ExMDNyZ3k5SXgzZjVUSTg1TGJLRUYyN1RS?=
 =?utf-8?B?a1doMWcwcG5EbjhMVnpldUZhYVAyOWR1YTc2eTBHbnlheDQ1RmVoR3BQRlVQ?=
 =?utf-8?B?Y2pJRkVJcnExUk85bUtIWGFNQ0RKQUJoMXoydHc0NVpCQTgxbHdHL2xCd1VG?=
 =?utf-8?B?Q01COSs1S0VWRlRMbWZvL3I3My90TE1WMW1uOFBnQ0plYXBNSkVIZHlFMEps?=
 =?utf-8?B?ZmxFQ045ZlhQUS9PVHM2WDBPOVIzQVBQR3VCeUQxMGlyUHJJWlIrSzI3WDUr?=
 =?utf-8?B?ZkJTendBU2tuRFJpOGk0Z1NZZFlrZFcxdlBUbmpRMTZKOXpYV2FvRmpwTzNu?=
 =?utf-8?B?dlJ3WXRJMDZuUDFkL2RPQ1RXVC9qSVB0TnQ5YmU5eDhES2pqOStWNFFacHkr?=
 =?utf-8?B?ZlNDLzhIdkJiN1d0TGU2QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEUyRjZRRXA1N24vZW9HbkdqcGhaVWFMai82MzhUN0RzeWlkZzBkNy95QlNE?=
 =?utf-8?B?T3owZE5BK01MU0hkTXpoU0U5bzRmZWJkOGtrSmZ1WXlhNHgyRWpib0cvVm5O?=
 =?utf-8?B?ai9tZkg2RWN3WVFnVW1YNkZZc3Y3NFppaWcxM2lZLzhBai9oY0VUUWRMVmlr?=
 =?utf-8?B?M0gvUGlLWTk4U2MzcERyb3dUS3kvMy9aSE5wOTA1RW9hWEJ3QzBYVkFIdXNO?=
 =?utf-8?B?aFVZNFVyVDhZenVnMitPenpZUmtHR0tROWRiNXIzTkJtZjNzc05WZW9QZ1BI?=
 =?utf-8?B?UW42UkJZSXp6Qng1YjVnQlg0MG81SHZhbmt1WGxFeUlmY0wzMUtHZ2NyYk1u?=
 =?utf-8?B?NkhHTVNyR2hEWG1mdG1rZHB4czZFTnBQbk9naU8zeXQ5RnVnOTZIL09HMitY?=
 =?utf-8?B?dnFXYjVub0VkNThwZEg5Tmc5NkNubWJhMlBTUTNPT1Z4cVVMWTVnRzNTNzVL?=
 =?utf-8?B?ZytZVWNKcWI3YWJDbXNWNC9xUTVWMjkrM252V3dYNkJocDBVelNleXVqMmMz?=
 =?utf-8?B?WTJKTXZPNzFJbnRqNDc1OStLUmN4aURDWUh3clR4SzhHbXpTdTM2QWdGYnpB?=
 =?utf-8?B?NmN0SnhleFVLZSsvVU1ZTUsvSTJRQ081V2doaExPUThXd0pEL1A2dXcveFhN?=
 =?utf-8?B?QWpkOGxWZXJFMldqaW5xNlgrWmtOTko1Z3M3TVRKRlFiQXNhbjZJZklNb2dv?=
 =?utf-8?B?UXBTc1pHRHFXdmlESjBjZkRVL24wZ0Yydjk3c09QNFJUMCt5L3ZrSnZjY2V4?=
 =?utf-8?B?VVlnNDNwYjJQTG90SFgwQWJUWlRmSFl4ekQwUmZ6RlZHQzV4WXl1Q0FGdXBx?=
 =?utf-8?B?THo5cmtXbGxuUjhyN09LWVpuUkZWUG5JeFJ6bTBHMzVrYkxJZVNST1JkWkM0?=
 =?utf-8?B?OCtwSzJSN2xsWEpPK01lZDNad0ticWJjc2JOWUFYd3JUNGpWU0VCVnJWRkk3?=
 =?utf-8?B?YXJPOGRtOGVubnVabm9WbURNMGd5ZmZLOHZNQ3kvVzhsd0diWnR2amFRM0xL?=
 =?utf-8?B?dGZYMlRPOW1uL3ZMbEhXZ093eEtwOGxCZ08xYVpNU0FSZ0EvNjVNaWhDMDBQ?=
 =?utf-8?B?bGhmUGlreFFPRy92bUlxUUU0V2E0QnBrZkFPYTVYSGF0VHdPQXZNa0QydEQv?=
 =?utf-8?B?M3FHdHNDYmVvREw4Y1VWbGhaU0Exc3ZhaUlNU2g0MWlzZy9zYjI0QXFGRkRE?=
 =?utf-8?B?STVSWEJLSFpWbzQ3WEVZMmNVbHU3OFpaaTE4VzZaRnp3aW1kai9EUEUxZHhz?=
 =?utf-8?B?d3ZCaFE4N2dDYWlHekdkWHo1NjY0WTl5UklYRHd1YlBYZWhzWEFwU0kyaVZ3?=
 =?utf-8?B?b3BWNWk0cytqcVl5OGpCU0llblBpVDlEa01COGhaOVBDY3REZmJYOVViRS9x?=
 =?utf-8?B?d1dEdUE3T3gydHNFcndXTWt5RGV4SElZWEM1YS9rN08wa1g0Yk1IL09XbTBv?=
 =?utf-8?B?eldKUlFaMWU1MXkrUFdGaXBoQzdSaXQwYWVUQzlkanRhZER4aGFpMXFwVWF0?=
 =?utf-8?B?L21ZQUUxWlFYZ250c3lqUWVhQ2hXekFSbSt0ZGZqRk55cmoxUFA4Z0plM1l2?=
 =?utf-8?B?dkRmVlVTM3NCRml2VjdsUmtRWGd6bDg1TVJHL0ozUFJycVY2UnRMdDZIRzEr?=
 =?utf-8?B?SXlaNWI2ZStuSGxUUUFvaFBFbks3WGZWQy9IV05MQS9XYnhUZGhIeHhuV0Z3?=
 =?utf-8?B?SzV5dDBVUHBsSGlUK3dmMVRxaFFubDlBVzhSa2RJL3hjT21PYlk3cFlsbXlF?=
 =?utf-8?B?dHg4bXdCWmVlRjZWdklHbnBJbUVhb25XNG5STVFNb1Q2aDZrU01IbFVyTC9l?=
 =?utf-8?B?aDVDc0lueCtyNGpaTEI4dXhNeVg5TiszYjJ2UVNWRjd4d1FlUnl5cGpGYjVM?=
 =?utf-8?B?WlVuTVdaeE5ZSUVYemY3eEQrK0RDbGFidTIxdXVndmJDem5wRFRJZjdLTm5m?=
 =?utf-8?B?MnpmZDdtSWtyVUFpdWZUUHlWdmVvZUs2UkJZeGlSditlbFZ2NGJGSElYK2ZQ?=
 =?utf-8?B?bDh1djAwd0o4ekVWa2NOUlJHVlFCU0pSMGdQeVFId3kxL2xFS25xVkFFelZY?=
 =?utf-8?B?Zmp1cU83bVIvUW0xc3N4ZjNlSkZkNDU0K0J6dmlwanU2UUF3aFpEUzkwM0VV?=
 =?utf-8?B?SXM4VzRmd0hqdU56ankxRlVtY2psYm5JNDVFNndxbDV6Qi92OW54MjFST051?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eedf00f0-d566-4a00-2970-08dcafc6d8ed
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 12:06:16.0466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dG+BkQUpCdzI7R1h52xlDyQMmh+L3Uv4cqtH2KO3PZqXan1gTGantZhePKH9ACaxrO/x6kgFVF06dQxUCLaNmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6984
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

Quoting Ohad Sharabi (2024-07-29 07:57:31-03:00)
>The config query has entries per config type.
>
>In query_config(), an array is allocated using the last element of
>the query config to dictate the array length.
>
>Instead, a more robust approach would be to use the standard "number of
>elements" last element of an enum such that one wouldn't need to modify
>the ioctl each time another entry is added.
>
>Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
>---
> drivers/gpu/drm/xe/xe_query.c |  2 +-
> include/uapi/drm/xe_drm.h     | 57 ++++++++++++++++++++++-------------
> 2 files changed, 37 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 73ef6e4c2dc9..aaa60ff764ee 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -313,7 +313,7 @@ static int query_mem_regions(struct xe_device *xe,
>=20
> static int query_config(struct xe_device *xe, struct drm_xe_device_query =
*query)
> {
>-        const u32 num_params =3D DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIOR=
ITY + 1;
>+        const u32 num_params =3D DRM_XE_QUERY_CONFIG_NUM_CONFIGS;
>         size_t size =3D
>                 sizeof(struct drm_xe_query_config) + num_params * sizeof(=
u64);
>         struct drm_xe_query_config __user *query_ptr =3D
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 29425d7fdc77..b087789956e3 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -378,6 +378,41 @@ struct drm_xe_query_mem_regions {
>         struct drm_xe_mem_region mem_regions[];
> };
>=20
>+#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM        (1 << 0)
>+
>+/**
>+ * enum drm_xe_query_config_type - Supported config queries.

I would rephrase this, since userspace does a *single* query call and then
we fill the array with all the available config info. Maybe we could
replace this with something on the lines of "Indices for the supported
info returned in &drm_xe_query_config.params"?

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+ */
>+enum drm_xe_query_config_type {
>+        /**
>+         * @DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID: Device ID (lower 16 bi=
ts)
>+         * and the device revision (next 8 bits).
>+         */
>+        DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID,
>+        /**
>+         * @DRM_XE_QUERY_CONFIG_FLAGS: Flags describing the device
>+         * configuration, see list below.
>+         *
>+         *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the d=
evice
>+         *      has usable VRAM
>+         */
>+        DRM_XE_QUERY_CONFIG_FLAGS,
>+        /**
>+         * @DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT: Minimal memory alignment
>+         * required by this device, typically SZ_4K or SZ_64K.
>+         */
>+        DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT,
>+        /** @DRM_XE_QUERY_CONFIG_VA_BITS: Maximum bits of a virtual addre=
ss. */
>+        DRM_XE_QUERY_CONFIG_VA_BITS,
>+        /**
>+         * @DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY: Value of the hig=
hest
>+         * available exec queue priority.
>+         */
>+        DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY,
>+        /** @DRM_XE_QUERY_CONFIG_NUM_CONFIGS: must be last. Number of con=
figs */
>+        DRM_XE_QUERY_CONFIG_NUM_CONFIGS,
>+};
>+
> /**
>  * struct drm_xe_query_config - describe the device configuration
>  *
>@@ -385,33 +420,13 @@ struct drm_xe_query_mem_regions {
>  * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
>  * struct drm_xe_query_config in .data.
>  *
>- * The index in @info can be:
>- *  - %DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID - Device ID (lower 16 bits)
>- *    and the device revision (next 8 bits)
>- *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
>- *    configuration, see list below
>- *
>- *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>- *      has usable VRAM
>- *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>- *    required by this device, typically SZ_4K or SZ_64K
>- *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>- *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
>- *    available exec queue priority
>+ * The index in @info are the entries in `enum drm_xe_query_config`
>  */
> struct drm_xe_query_config {
>         /** @num_params: number of parameters returned in info */
>         __u32 num_params;
>-
>         /** @pad: MBZ */
>         __u32 pad;
>-
>-#define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID        0
>-#define DRM_XE_QUERY_CONFIG_FLAGS                        1
>-        #define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM        (1 << 0)
>-#define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT                2
>-#define DRM_XE_QUERY_CONFIG_VA_BITS                        3
>-#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY        4
>         /** @info: array of elements containing the config info */
>         __u64 info[];
> };
>--=20
>2.34.1
>
