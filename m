Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419DD606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bDJifd7S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F053510E82C;
	Fri, 30 Oct 2026 06:51:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B264010E82C
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 06:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793343109; x=1824879109;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fapMDjqfmB1KjZIOoQOSNbo3S5pYowuGhToTYHn6tq4=;
 b=bDJifd7S7lPM3O6yGdVYOSYIFYL7YG3f1qf3dcJmYcrMyeJot/hVoypp
 uuNLVGhYo73NXHjsT3cTwT8kIxJDatsohCRJPb2QC2EwfEEHI/xA+14eJ
 9U5d8SugOT9rH3cLvsI/N/Z82X797H/pSxgTWwbG8fNoq4mI7i5FowxTY
 rdleJ5o0XFbBl8vcRT+L5G7O2tZy/RupDxx7WSfacIjysf45Wx3EleBV9
 WKlKAPQM+zrS73F0Nyrt66z0cXKtX87X3FYINozuHAHCjEApMeuvopQzO
 tNE9zxiY9+hJyAQPWK2qbuDryZ/3i/uzW6xFwE9iUUMsIQ9uUHGXUHcPR g==;
X-CSE-ConnectionGUID: ENggQxm5T6OcR98Bkb9u9A==
X-CSE-MsgGUID: tD1kEzo1Tl2+39DV1BLq+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2114853"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2114853"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 23:51:48 -0700
X-CSE-ConnectionGUID: uscHIPsURMKBRo7x5hFUXQ==
X-CSE-MsgGUID: Kh6nc5YvTTeVP9tydC7riA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5328459"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 23:51:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 23:51:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 23:51:47 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 23:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hs783cxmWDJ3gJdK0VT7hdHFur+w0Ob1ngpe7AeJCrdt90WmZP6VRUl6rlaePQUqqprq5QYuowzjzwQOTctcS0qH1jFGE8qZKU90Af3vw3QGA0XFJI4qGVihli/yvmAC2N8SDix4/JQVU9OhMRjWDyv2HomufVuTs7vIe9tCJ9EhlZj/n8oVZp/7avaWXI64pc/OPs/YG8MQxhzbR+qKIvjTFSEK0oK/YVT48VeDK/YO8XWrHCsUNZZSBrgiaJ6xCSbKjo5AFAckC/WAV55odqijoaQZYmPl+414MVo02FgSkGtuWSA38IhbRpFZcCMnPV/i90jJL9FH/cBaatC6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wq38PwuM8o3FsjmHgzOqKidMaWTLFJdR0FpVlggtFI=;
 b=XktoD9H6ClKf7WeesJoM5bgbF37TShBEHWE2QZmlj8jdH6KKdDk3+RJ9vnFYQce/g+pdlkZnU3Amfjv/9sRvStYqPO60F0g4Mq4aDFC0W68lFP5W05Pt1OEBx4tilAn8/+q1gPhbkKf7bm5146QNGuqIOL5DVruPKWpsZNIzuMiYORPUhKEFEDdsZO4EPLhAUxX30crydq+6IqxcmOPbvcTH8lH9d8Oppcf1XWxXWrGd6Q5Gr0TkzvBMinUnwW8OvUTDo2zKqz5xrLCTGGKt9vYtGuCsm3/vAs8Fqwho6liL1M2LHE4NkqyYv+jPEKNF6d46oRA8DZcoMVkRll85IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 06:51:45 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 06:51:45 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v7 7/7] drm/xe/guc: capture additional engine state
 registers
Thread-Topic: [PATCH v7 7/7] drm/xe/guc: capture additional engine state
 registers
Thread-Index: AQHdZ8tUkaskMmqQmUaxG+vvk+lJlrcVpoaQ
Date: Fri, 30 Oct 2026 06:51:45 +0000
Message-ID: <DS0PR11MB87182D91AF37838B0BD55204816D2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261029172800.2150325-1-naresh.kumar.g@intel.com>
 <20261029172800.2150325-8-naresh.kumar.g@intel.com>
In-Reply-To: <20261029172800.2150325-8-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|PH0PR11MB4901:EE_
x-ms-office365-filtering-correlation-id: 35e900dd-92e4-417e-b395-08df3652435f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|261026140227099003|3023799007|6133799003|18002099003|22082099003|261028144727099003|10067099003|56012099006|11063799006|261022113327099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261009223027099003|4143699003|261026121527099003|38070700021;
x-microsoft-antispam-message-info: LkhCWIpnQd8s/e2XBVw9iI+YOGE6e/E4H11pGMgZ08epU3Ejv59yd3FBVCx3Zqze3trQwwPBE7xVfJQ9UJF9JJQD5Obtq/0bUMA1jYR88F7kd9qb9xjRTNt+4FmvI/mu89L7EuhRuXYTa9bgHKaJW817lhfsNcWrqRSY1IoCaw5U1nDgcy3UP3ZBU2YlOBmFg+h6dk6u9ie4wF+FbhDgj373x9mNT8YdH6QUpKCLcyIpJVPt50TfZoLd8UL1JcC1tCsutEMlyd634dJjpLSWhSWSGzzrrHzBkC3bxdj6vHKSxkVgRNq7Drym9fOKomLrhOuU2g+r6XATkQKAPM8P8zC7QW6mA9yj3Fcm3kGxomgQ9yK/l78ET/jHl62ZEUtxGxQ3OeuVu/J5NmRwEHSJBerjYKaYnxJg0h6T8RSW/gD8prgFdS1tlWSltZQsrlP0yrWOpfLR6b4yJ72U2kZIY2bbP8/iJwUaj2VaK3x2wbZ29rhU4Qo2Z+hIFhtUYHcytMhYt//R4f4K9eP0X7qrY8xYFNXygHLN39s3q0Gj5vrdsBEoyxx7ddqp85f5E4KefW9YpObCf/T92ViMTrQj+3RXptJYTAg9gKhiqjRMBbS8DzgecULLIxIXu7fG2muLvsbuw6/BOBrikLAg+0LZoASs8ZGRPLiwZEmm63KDcTir5A7XBaidoHtbznJwZeUiNrGwmPofGI6zFqzbqMGVTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261026140227099003)(3023799007)(6133799003)(18002099003)(22082099003)(261028144727099003)(10067099003)(56012099006)(11063799006)(261022113327099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(4143699003)(261026121527099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iG5Il7ld44d68zhlpRfYqmMdh5p+UYpqK00m+nPG1u8zpHjvSzV2Uvzxn0GT?=
 =?us-ascii?Q?rhJLSYsTMqcXopJldPeLYpq9WueQ5LpPCWAWcWPHtfdaAVhnyFYz0ighmwPy?=
 =?us-ascii?Q?cSOYBJJhyWBAvTnaspUGIcvbjvMSq5UmSE+7aWsFNYWa66S3bXUkkMvqM6CB?=
 =?us-ascii?Q?rK5fvKphmDO78XF1UplED6aT2TX4dhL9DDS+rbJ1bYbKT4bgBEK5gLGUF4Kt?=
 =?us-ascii?Q?GIZxFSnpf74vkQW+BhVMXcYNuJD9lC8XVY/e7rcIr8+MdYGlRQBmAqBra6ku?=
 =?us-ascii?Q?dFp8/r+goOMbDGYkXkA+sWbm1FMHYfFoxDNt4E4cUail06axgYh8F2Hk/d4l?=
 =?us-ascii?Q?0pNY6s7noKreNGQFzUynzEY57Hy/hiATfq6tPQ68FpjXbBguplirNGMpwXJb?=
 =?us-ascii?Q?R6BLyuwBelMUMkbUmbaIJUxrrZwjX1fFhbeOF1ZN3YUOo/H9rhOIMtb7AyTP?=
 =?us-ascii?Q?Uw/BSEB6LJzWjayB8nlbP8isWr1pR4u4ucaTwjYCfKB5/ET0NcEGc/x0RnfE?=
 =?us-ascii?Q?7X8RWPSm88rWjLbkh5QkqGhLFXCoOaTtI3EgIGSqQR9dbXhLi/dj4MQsBl1C?=
 =?us-ascii?Q?Edi3y3K7PAlE84Sj2lB9x/XQn6RpAizeb7Qme4Ty9NKetMyP85rzudU1n95U?=
 =?us-ascii?Q?u3qc0hfZqD3k6cie7e5vI8QRgl3N7TXyYPszRPy8fvuxGhd0tjn0lALMhU6y?=
 =?us-ascii?Q?wXOGeDbgIavm7/JVJO9PZLlRZM6R/aCAjLT+JLtN+hbC0OKUivyGUB4mYrGd?=
 =?us-ascii?Q?gGRJP347FM9mbbzuQdG7FiwDM6fV7FLa65LKRxaufuqBRUIz6+nF2MD74WLk?=
 =?us-ascii?Q?t8spur7Nqq3hBId/bXEe2OmgVR0lI3vrc06TcGXeyCBAZfvtyccoXmEUKOxu?=
 =?us-ascii?Q?R5iwMTDXISEApsPyMEuQu3vTisP/0Op3o+r0olTeQbckFFRjX9Z8A8fEGCdK?=
 =?us-ascii?Q?f3E30jRFdTZJMhIfngVHb125XYRn+LM4E1z9/mHSf9/bPeVL3J9ztg8sRmm8?=
 =?us-ascii?Q?Ais1V9ryyfx3CXZCc65xLTTUW384Ah4v1T9VJ1xYxEuEOTTMdPSAifiiV+LM?=
 =?us-ascii?Q?RFVdsRL4SP7wPE/Lf7hMTgIN5CegvElIcFrXgDCKzADwVTBmRXExGZUauETs?=
 =?us-ascii?Q?lOV0SMPB9wt65ZT22dc7k0IWmc8J0YXsqf8AdN4m4J9poTPJ4GhNOj2suJbU?=
 =?us-ascii?Q?brC45m8XR8LwEuVtuUnc7bQ4fgd1oc5vzs1D7p/n9wTEj+Brh2J0PDWfwIb+?=
 =?us-ascii?Q?/BhBnIADK8akz2DomfTJ04P4Gri633zQscv3nvFvd/hP0ghPXrLiakvgFVHk?=
 =?us-ascii?Q?ilXJ4YlxCiDn3iNVA+LDj1w0MrUUy+E8uv33MKdGmV/eMvyXZz8xzNQ2FoWI?=
 =?us-ascii?Q?y043JWHN3QJn+rBAkE7MzGUqMGdR0wK3Ar9GWTDgvX/bO0AzEzdovrnHhwuy?=
 =?us-ascii?Q?yTURZcz9YAKL32p8MJo1zaWKMzPFz+suzMKxbpok57N18Xxv5v6YOspYZ1SB?=
 =?us-ascii?Q?2c4ykq24BIjIJHG+Zt6VsNTd8xyK6VsPUFvqgIGTIpnnPmM6c8BeMqg9H5kD?=
 =?us-ascii?Q?LDGBclE/X8lnVcS6zv2G6z3Y4daFbQ5eo6yPTmYP1XSb0Nlzr5Cg+VFy3Nnh?=
 =?us-ascii?Q?+ug9tIHwHE24iuNAk1ZyM0guusUMuYZKABrsElYtmS4rGbuov56AV0e77uho?=
 =?us-ascii?Q?8H8NoWYSXr/xyCqWqV1ibuMbm/RVd4feT1rXyUxnJuY0H5rQ6Ics73xAGc52?=
 =?us-ascii?Q?bfBK3jdezQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IdDp0Tjzjy1UIOy8UtFW0PRkcUxej0XvQ0CsnCLa6IGQXi6E6vYJH7KbLDAlUH1EnEbsNzk5TnonZ8Kf4zYXIUWjG55mX9Z4WMVO5mIQIGelRTPzYho38GzQKH16w9JMqq4oGUvxYzSNwE+AZ8hVWvbHVjB4WGbrzBHrlwqTKh9QYALvLAO0amtBGRHtSkdWm64fUpgxnjq1XKBNTa0bkARe3OszHMM8R7oMDvY8BLS+e2ViEphroRUchPcR7WUJby/jVVzGjH6VBw7Zey1Y6hRqXIKceSwZVDI0brO5xYI0EVTmF0sBGQn6ZBwu2IMPBrCvNwPkv5+OonR/B7wh2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e900dd-92e4-417e-b395-08df3652435f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 06:51:45.5442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yyktK402nYYJIGtwY2jOgwfHpnoNTZOH1/d4Z2dxGw08JXtzmA/iKgOlroRqXwD6YOjrZkqFFxjhPgVgBDbuEIesifs00xm7Pz2eKBlYOjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 29 October 2026 22:58
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v7 7/7] drm/xe/guc: capture additional engine state regis=
ters
>=20
> Add a wider set of engine state registers to GuC error capture to improve=
 post-
> mortem debugging of engine hangs and reset-related failures.
>=20
> Define the missing register offsets in xe_engine_regs.h and include them =
in the
> GuC capture list. The additional registers cover reset state, front-end a=
nd back-
> end FSM state, power state, batch buffer state, instruction state, preemp=
tion
> status, and related chicken/debug controls.
>=20
> This provides more complete engine context in capture dumps, which should
> help root-cause analysis when investigating GuC-reported engine failures.
>=20
> v3:(Sashiko)
> - Move FF_SLICE_CS_CHICKEN1/2 out of
> COMMON_BASE_ENGINE_INSTANCE
> - Add XE3P_RC_SLICE_INSTANCE and include it only in xe3p_rc_inst_regs[]
> - Add XE_BCS_RCS_ENGINE_INSTANCE for registers shared only by
>   BCS/RCS paths
> - Include XE_BCS_RCS_ENGINE_INSTANCE only in
>   xe_blt_inst_regs[] and xe3p_rc_inst_regs[]
> - Keep COMMON_BASE_ENGINE_INSTANCE limited to registers
>   valid across all engine classes
>=20
> v5:(Sashiko)
> - Keep RING_EXECLIST_* in COMMON_BASE_ENGINE_INSTANCE
> - Drop XE_BCS_RCS_ENGINE_INSTANCE
> - BCS_SWCTRL only on xe3p_blt_inst_regs
> - CS_DEBUG_MODE1/CS_CHICKEN1/CS_PREEMPTION_STATUS only on
> xe3p_rc_inst_regs
>=20
> v6:(Tejas)
> - Add missed register to capture in coredump
>=20
> v7:(sashiko/tejas)
> - Fix sashiko suggestions
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

LGTM,

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 24 +++++++++
>  drivers/gpu/drm/xe/xe_guc_capture.c      | 67 ++++++++++++++++++++++--
>  2 files changed, 87 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 94033982e6944..aaec9d02b9869 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -60,6 +60,8 @@
>=20
>  #define RING_START_UDW(base)			XE_REG((base) +
> 0x48)
>=20
> +#define RING_CSFE_GLB_CHICKEN3(base)		XE_REG((base) +
> 0x4c)
> +
>  #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50,
> XE_REG_OPTION_MASKED)
>  #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
> @@ -72,6 +74,7 @@
>  #define RING_DMA_FADD_UDW(base)			XE_REG((base) +
> 0x60)
>  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
>  #define RING_INSTDONE(base)			XE_REG((base) +
> 0x6c)
> +#define RING_INSTPS(base)			XE_REG((base) + 0x70)
>  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>  #define RING_DMA_FADD(base)			XE_REG((base) +
> 0x78)
>  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> @@ -102,6 +105,8 @@
>  #define   SELECTIVE_READ_GROUP			REG_GENMASK(29,
> 23)
>  #define   SELECTIVE_READ_INSTANCE		REG_GENMASK(22, 16)
>=20
> +#define RESET_CTRL(base)			XE_REG((base) + 0xd0)
> +
>  /*
>   * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
>   * The lsb of each can be considered a separate enabling bit for encrypt=
ion.
> @@ -123,14 +128,22 @@
>  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0,
> XE_REG_OPTION_MASKED)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>=20
> +#define FF_SLICE_CS_CHICKEN2(base)		XE_REG((base) + 0xe4,
> XE_REG_OPTION_MASKED)
> +
>  #define CS_DEBUG_MODE1(base)			XE_REG((base) + 0xec,
> XE_REG_OPTION_MASKED)
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>  #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>=20
>  #define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
>=20
> +#define RING_BB_STATE(base)			XE_REG((base) + 0x110)
> +
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) +
> 0x168)
> +#define RING_BUFFER_HEAD_PREEMPT_REG(base)	XE_REG((base) +
> 0x14c)
> +#define BB_START_ADDR(base)			XE_REG((base) +
> 0x150)
> +#define RING_BB_ADDR_DIFF(base)			XE_REG((base) +
> 0x154)
> +#define BB_START_ADDR_UDW(base)			XE_REG((base) +
> 0x170)
>=20
>  #define PR_CTR_CTRL(base)			XE_REG((base) + 0x178)
>  #define   CTR_COUNT_SELECT_FF			REG_BIT(31)
> @@ -148,6 +161,8 @@
>  #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
>  #define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 1)
>=20
> +#define RING_CSBEFSM3(base)			XE_REG((base) +
> 0x224)
> +
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) +
> 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) +
> 0x234 + 4)
>=20
> @@ -169,9 +184,16 @@
>  #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>=20
> +#define RING_CSFESM(base)			XE_REG((base) + 0x2a0)
> +#define RING_CSFESM2(base)			XE_REG((base) + 0x2a4)
> +#define RING_CSFESM3(base)			XE_REG((base) + 0x2a8)
> +#define RING_CSPWRFSM(base)			XE_REG((base) +
> 0x2ac)
> +
>  #define RING_CSMQDEBUG(base)			XE_REG((base) +
> 0x2b0)
>  #define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
>=20
> +#define RING_CSBEFSM(base)			XE_REG((base) + 0x2bc)
> +
>  #define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) +
> 0x4c0)
>  #define RING_QUEUE_TIMESTAMP_UDW(base)
> 	XE_REG((base) + 0x4c0 + 4)
>=20
> @@ -217,6 +239,8 @@
>  #define   PREEMPT_GPGPU_LEVEL_MASK
> 	PREEMPT_GPGPU_LEVEL(1, 1)
>  #define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
>=20
> +#define CS_PREEMPTION_STATUS(base)		XE_REG((base) +
> 0x5ac)
> +
>  #define CS_GPR_DATA(base, n)			XE_REG((base) + 0x600 + (n) *
> 4)
>  #define CS_GPR_REG(base, n)			CS_GPR_DATA((base), (n) * 2)
>  #define CS_GPR_REG_UDW(base, n)			CS_GPR_DATA((base),
> (n) * 2 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c
> b/drivers/gpu/drm/xe/xe_guc_capture.c
> index a8a3271991e2a..0fd68b41d4127 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -124,6 +124,8 @@ struct __guc_capture_parsed_output {
>  	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,
> 	0,	"ACTHD"}, \
>  	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,
> 	0,	NULL}, \
>  	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,
> 	0,	"RING_BBADDR"}, \
> +	{ BB_START_ADDR(0),		REG_64BIT_LOW_DW, 0,	0,
> 	0,	NULL}, \
> +	{ BB_START_ADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,
> 	0,	"BB_START_ADDR_UDW"}, \
>  	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,
> 	0,	NULL}, \
>  	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,
> 	0,	"RING_START"}, \
>  	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,
> 	0,	NULL}, \
> @@ -131,7 +133,9 @@ struct __guc_capture_parsed_output {
>  	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,
> 	0,	0,	NULL}, \
>  	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,
> 	0,	"RING_EXECLIST_STATUS"}, \
>  	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,
> 	0,	0,	NULL}, \
> -	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,
> 	0,	"RING_EXECLIST_SQ_CONTENTS"}
> +	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,
> 	0,	"RING_EXECLIST_SQ_CONTENTS"}, \
> +	{ RING_BUFFER_HEAD_PREEMPT_REG(0),		REG_32BIT, 0,
> 	0,	0,	"RING_BUFFER_HEAD_PREEMPT_REG"}, \
> +	{ RING_BB_ADDR_DIFF(0),		REG_32BIT, 0,	0,	0,
> 	"RING_BB_ADDR_DIFF"} \
>=20
>  #define COMMON_XELP_RC_CLASS \
>  	{ RCU_MODE,			REG_32BIT,	0,	0,	0,
> 	"RCU_MODE"}
> @@ -150,6 +154,36 @@ struct __guc_capture_parsed_output {  #define
> XE3P_BASE_ENGINE_INSTANCE \
>  	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,
> 	0,	"CSMQDEBUG"}
>=20
> +#define XE3P_RC_SLICE_INSTANCE \
> +	{ FF_SLICE_CS_CHICKEN1(0), REG_32BIT, 0, 0, 0,
> "FF_SLICE_CS_CHICKEN1"}, \
> +	{ FF_SLICE_CS_CHICKEN2(0), REG_32BIT, 0, 0, 0,
> "FF_SLICE_CS_CHICKEN2"}
> +
> +#define XE3P_CS_DEBUG_INSTANCE \
> +	{ RESET_CTRL(0),		REG_32BIT,	0,	0,	0,
> 	"RESET_CTRL"}, \
> +	{ RING_CSBEFSM3(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSBEFSM3"}, \
> +	{ RING_CSFESM(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSFESM"}, \
> +	{ RING_CSFESM2(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSFESM2"}, \
> +	{ RING_CSFESM3(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSFESM3"}, \
> +	{ RING_CSPWRFSM(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSPWRFSM"}, \
> +	{ RING_CSBEFSM(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSBEFSM"}, \
> +	{ RING_CSFE_GLB_CHICKEN3(0),	REG_32BIT,	0,	0,
> 	0,	"RING_CSFE_GLB_CHICKEN3"}, \
> +	{ RING_PSMI_CTL(0),		REG_32BIT,	0,	0,	0,
> 	"RING_PSMI_CTL"}, \
> +	{ RING_INSTPS(0),		REG_32BIT,	0,	0,	0,
> 	"RING_INSTPS"}, \
> +	{ RING_BB_STATE(0),		REG_32BIT,	0,	0,	0,
> 	"RING_BB_STATE"}
> +
> +/*
> + * CS_CHICKEN1 has GPGPU/3D preempt bits; keep with RCS/CCS only.
> + * RCS+CCS share GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE, so these
> cannot
> + * be RCS-only.
> + */
> +#define XE3P_RC_CS_PREEMPT_INSTANCE \
> +	{ CS_DEBUG_MODE1(0),		REG_32BIT,	0,	0,
> 	0,	"CS_DEBUG_MODE1"}, \
> +	{ CS_CHICKEN1(0),		REG_32BIT,	0,	0,	0,
> 	"CS_CHICKEN1"}, \
> +	{ CS_PREEMPTION_STATUS(0),	REG_32BIT,	0,	0,	0,
> 	"CS_PREEMPTION_STATUS"}
> +
> +#define XE3P_BCS_ONLY_INSTANCE \
> +	{ BCS_SWCTRL(0),		REG_32BIT,	0,	0,	0,
> 	"BCS_SWCTRL"}
> +
>  /* XE_LP Global */
>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] =3D {
>  	COMMON_XELP_BASE_GLOBAL,
> @@ -186,9 +220,12 @@ static const struct __guc_mmio_reg_descr
> xe_vec_inst_regs[] =3D {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  };
>=20
> +#define XE_BLT_INST_REGS \
> +	COMMON_BASE_ENGINE_INSTANCE
> +
>  /* Blitter Per-Engine-Instance */
>  static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] =3D {
> -	COMMON_BASE_ENGINE_INSTANCE,
> +	XE_BLT_INST_REGS,
>  };
>=20
>  /* XE_LP - GSC Per-Engine-Instance */
> @@ -200,6 +237,16 @@ static const struct __guc_mmio_reg_descr
> xe_lp_gsc_inst_regs[] =3D {  static const struct __guc_mmio_reg_descr
> xe3p_rc_inst_regs[] =3D {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  	XE3P_BASE_ENGINE_INSTANCE,
> +	XE3P_CS_DEBUG_INSTANCE,
> +	XE3P_RC_CS_PREEMPT_INSTANCE,
> +	XE3P_RC_SLICE_INSTANCE,
> +};
> +
> +/* Xe3p Blitter Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_blt_inst_regs[] =3D {
> +	XE_BLT_INST_REGS,
> +	XE3P_CS_DEBUG_INSTANCE,
> +	XE3P_BCS_ONLY_INSTANCE,
>  };
>=20
>  /*
> @@ -264,7 +311,7 @@ static const struct __guc_mmio_reg_descr_group
> xe3p_lists[] =3D {
>  	MAKE_REGLIST(xe_vec_class_regs, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>  	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE,
> GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_BLITTER),
> -	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE,
> GUC_CAPTURE_LIST_CLASS_BLITTER),
> +	MAKE_REGLIST(xe3p_blt_inst_regs, PF, ENGINE_INSTANCE,
> +GUC_CAPTURE_LIST_CLASS_BLITTER),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>  	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE,
> GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_PAGING), @@ -377,9 +424,12 @@ static const
> struct __ext_steer_reg xehpg_extregs[] =3D {
>  	{"SC_INSTDONE_EXTRA",
> 	XEHPG_SC_INSTDONE_EXTRA},
>  	{"SC_INSTDONE_EXTRA2",
> 	XEHPG_SC_INSTDONE_EXTRA2},
>  	{"INSTDONE_GEOM_SVGUNIT",
> 	XEHPG_INSTDONE_GEOM_SVGUNIT},
> +};
> +
> +static const struct __ext_steer_reg xe2_extregs[] =3D {
>  	{"ROW_INSTDONE_TDL_GFX",	ROW_INSTDONE_TDL_GFX},
>  	{"SS_LSC_HDC_IDLE_TDL_GFX",	SS_LSC_HDC_IDLE_TDL_GFX},
> -	{"SLICE_ARB_STATUS",		SLICE_ARB_STATUS}
> +	{"SLICE_ARB_STATUS",		SLICE_ARB_STATUS},
>  };
>=20
>  static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext, @@ -422,6
> +472,8 @@ static int guc_capture_get_steer_reg_num(struct xe_device *xe)
>=20
>  	if (GRAPHICS_VERx100(xe) >=3D 1255)
>  		num +=3D ARRAY_SIZE(xehpg_extregs);
> +	if (GRAPHICS_VER(xe) >=3D 20)
> +		num +=3D ARRAY_SIZE(xe2_extregs);
>=20
>  	return num;
>  }
> @@ -434,6 +486,7 @@ static void guc_capture_alloc_steered_lists(struct
> xe_guc *guc)
>  	const struct __guc_mmio_reg_descr_group *lists =3D guc->capture-
> >reglists;
>  	const struct __guc_mmio_reg_descr_group *list;
>  	struct __guc_mmio_reg_descr_group *extlists;
> +	bool has_xe2_extregs =3D GRAPHICS_VER(gt_to_xe(gt)) >=3D 20;
>  	struct __guc_mmio_reg_descr *extarray;
>  	bool has_xehpg_extregs =3D GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1255;
>  	struct drm_device *drm =3D &gt_to_xe(gt)->drm; @@ -504,6 +557,12
> @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
>  				__fill_ext_reg(extarray, &xehpg_extregs[i],
> dss, slice, subslice);
>  				++extarray;
>  			}
> +
> +		if (has_xe2_extregs)
> +			for (i =3D 0; i < ARRAY_SIZE(xe2_extregs); ++i) {
> +				__fill_ext_reg(extarray, &xe2_extregs[i], dss,
> slice, subslice);
> +				++extarray;
> +			}
>  	}
>=20
>  	extlists[0].num_regs =3D total;
> --
> 2.43.0

