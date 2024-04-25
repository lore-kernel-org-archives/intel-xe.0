Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE4EC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 06:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C9010FB0B;
	Thu, 25 Apr 2024 06:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeepGm7h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C797410FB0B
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 06:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714028295; x=1745564295;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UmcsWfHHqqpDFJ+s8hq0zMtWNIxKD9OtAi57CmFcmx0=;
 b=jeepGm7hycujfzQxAZsjsMPbhF8aiG3zNhkVGBd4dCwQj/3oE7QMEBek
 y8Fp0aWmfL9MCgc3diEPhb0wHRfUqwPN28uImLXfupLq7O+L48Mddfcc3
 +QQL7M3IYOIayt9ezwZPc7rWB7GHTC3q+uVBWpKfIxhPsAYLXD73Ih4ED
 DTsixqKoO+CtdtYMd5k91ol4RsFZEE7L3cuA18S08Pbbkmf86n/bUstN0
 hJUP1uJiPAlDsMHeCS+/5pOZwu7JUJdFvsW/eU8s/HiHOEgRW+pN+Q/4u
 RRIySZEOxwb43Mb29t6QQJMRDjMRZSuxZTC/4PPvAUfAXrhQeJ2a9fJ9Q Q==;
X-CSE-ConnectionGUID: fyXt2UaZRtmrKxpuD4D10g==
X-CSE-MsgGUID: /FuYrtvHQd+1HjKf7DiiIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20241719"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="20241719"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 23:58:14 -0700
X-CSE-ConnectionGUID: Jls34u8vStymSpiI2S7XLg==
X-CSE-MsgGUID: IaZTqPTeQOextyo/Avpl0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="29431971"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 23:58:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 23:58:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 23:58:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 23:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGkbTssaP+Ri79flpP9cH4abnSg/nhYzADKvSLujyc5afHcEQtHSzewgrMW0vTSq916AePTdiB2KgZPEbd311T7HkOgYK15TGtC9o6duanvURuTtcZkApHx2rUgTe8CuZjv4kMvH2TR7FRJYjCJrFRaIAo7x2uMFc0VDTjEXcjHUtmgtrgZHKCtOQv384IuE7e0UC8B5Bm7dwgefhZJAif33KfJTENvSqj/+c46NqsRx9Xs/NItsWCAFJHnbVbhCp4+m6y4SeySke9xWEaXQysZJ02OuxqjtebXB7Wcp8noSTHDl2fTRw6uUatoPiqyyDwIAPBNJ8tBMUq6xo8z+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9/O/e8YZMz/QUt4TZtTRZnxASCByv+2j9fQlNvCBZM=;
 b=gkWebwgo3iDqxLGAxylthrsuJvwkuAe0etXZ6sKeu7iMmmgy30rSqV/Rl2IzE8plolDd+0d7MCJOHY8vmYiFB+oP1mvgLa0XGIKrxn8dDAvXGovD0WQGv05B4GD/4BZcJe9eTyfByuAqICmDw3GmWcMbExyehfF4m8uTZ30UyNtnbmwu4YEIbv0dQt2bU6DXsX2VoXk7ehdsJFNNF8Nl39AhOKtEsVlTZAlNo7/vHHJf1lQTYMbwVSsJHDeB2QGgawKCO5oUSR6gIeBH6Lyyjkn+nrvLM7EfuIjA5/RMYE57j+9mzaMsyzyJOOpTD519lUDbQ5v2iQlFL9fFd33kng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Thu, 25 Apr
 2024 06:58:11 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:58:11 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2 2/5] drm/xe:
 s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
Thread-Topic: [PATCH v2 2/5] drm/xe:
 s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
Thread-Index: AQHaltUgnwL0nEOpBUWB3qehTMlBSbF4jhyg
Date: Thu, 25 Apr 2024 06:58:11 +0000
Message-ID: <MW4PR11MB70568479ABE040DDE32DB5EAB3172@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240425055522.1919005-1-matthew.brost@intel.com>
 <20240425055522.1919005-3-matthew.brost@intel.com>
In-Reply-To: <20240425055522.1919005-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|DM4PR11MB6096:EE_
x-ms-office365-filtering-correlation-id: 5da68587-4bb3-4cbd-ac24-08dc64f5120a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?P0XRuMRAkIiHQNoQ51duhCaQB0QfsZPXHvGYtnhnzmAsRpHIlVWfNaO7xD12?=
 =?us-ascii?Q?JQNGkTKRU4g/3vQGNq0PIzlZv2kR+KB2cBxbfs9JDvxx6uO21Md3Ux1jlvq3?=
 =?us-ascii?Q?Hoqtb3hD8mxCJSPl3WpzwIIU8Uu8mNar1GURuYNE3Ebnyh6HWksKAnBWW0Yw?=
 =?us-ascii?Q?fSUWKEj7cXhtgx4kHU+O/W2AtHpmUlI2zFl2lhcCZquPxETrbhjRmmVjVIce?=
 =?us-ascii?Q?fdyg5DHZnRy20W99hsIUDsNSUL4HsnEc7DlpU2OvnMEctU95snr5QQpNGaE0?=
 =?us-ascii?Q?HHR3vw4NxN3ioZrADVggcTtxsA+tomsy4SoyHtTK9+lP7PFe9doUTHC8MR+z?=
 =?us-ascii?Q?xdDLP7muAgBLzQlY7ncpGYZtrClSNK/6w5B2AkOuotuo70OYLt+VeRQfYr6F?=
 =?us-ascii?Q?zZSQUy32ovo0ILeSWqwYRasER+1cmbVeOO4IlnOZnLDjGVqzTWJUNq5F92Bo?=
 =?us-ascii?Q?j/fzOqdsOOa+R+EkVr+lRf83TB6Ls2vcaC3hyH0EH+T1TS2kX3s15JbGYfK4?=
 =?us-ascii?Q?3pO6jtzUnn85VrAXIYCofTIpedOii4VnBUCaXGWgb9CkbU1IzZLviGxmfrIM?=
 =?us-ascii?Q?f1ovoxgfUy1RdQP9oTj+RYKlLD0rS1AuAwICXw9MvIWEOjS96av/L7YawkBf?=
 =?us-ascii?Q?26gd65mKXwI+OTjhDGzTVnTKDt8uI+MV9w0/ZxpIDjq/QR3lVvgtzBXBC4QR?=
 =?us-ascii?Q?OEVUzdKaqvHoOi60lgwwxvurHB9cSCIYP4Z/FlxVbCGF2k1/Ax7HF1gCco6d?=
 =?us-ascii?Q?1TDKbKLLUEnM/oMinpJxXcrte6/ukxku0UPuT80Dk7uKsNApdlIuf92LuXko?=
 =?us-ascii?Q?IdytWNcNPTOLfcDxsrzS2z96dkbV/ojvvB+uNkXTWOlwC1svm3A13J+Q5NTO?=
 =?us-ascii?Q?kRjBsOFU+wpGU8EWWGnp+ZrWXJ9NivUrBC/g4MRiBiHiLfDPkjp1EoKcCqCi?=
 =?us-ascii?Q?1src88l4mvQcu5c0QhGcoo/2/9VZljrnzdkdZJwlBhNRO3OcnZy7G/MFOLYj?=
 =?us-ascii?Q?hIyjfKIgNY/1ZWzJ67m2/rwwn3s5jvHDABatfSxfqPou83C2QZtRQr9Ktxme?=
 =?us-ascii?Q?E3zbxXIFlYFsciot8XujAH5k+foH9ZoJm9Nxm6TFqxGZksSNwt/K5rs/4CCx?=
 =?us-ascii?Q?upBqiwKmUhAvunhcGlbNsvLGXAa6UX7jHZxW+DwS7I0hsJoFx9MPBFZcsByI?=
 =?us-ascii?Q?xZBe3J95zb5pR51xJr11arnQGvBiIdPuqea7pXGN3rHoLA/Jk0Ir0eS7KPpD?=
 =?us-ascii?Q?/C+CBhF+mlNQZWq+F8tlDbH+C9B8xn/vE0VWTQPks7jQtPgsCI3TsdTL17YA?=
 =?us-ascii?Q?vtK7J2hFMspkP30J3LdfquUxT0hvkUovMRrN3u6LaKlvVw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wIQ8u8Ve19QNmLRpR4tP545++ZBDX899Wpyi6bpINEQ3AIaxZHBn/aRu35ll?=
 =?us-ascii?Q?odNXlFzkBS7rVbTHPxrRq8yN9l0n5SLZwoD+WyyQRfuFJXsKYnWPjff4L9AT?=
 =?us-ascii?Q?WN2J/TzBnKxc2c60XEhJVboydHjFInRrxH/NgerK6h/Vxy1gcmcl/tHKG8Wu?=
 =?us-ascii?Q?94XOhhJZd01BaKdJusZNuVxLDLb50fP3U+6mh+izyvwspE2HlZTSS5xj8Xp6?=
 =?us-ascii?Q?dSG9xGBfkV5QspTBJ65oOlfcN1HS1w/nD/uBL2/3/YXIFEWs4M1cp/Kk51LR?=
 =?us-ascii?Q?OiShbdvIaHCH7rlfYJHzNAjdG+j78x4p83ndqigLSkcSHUVhzDfqtU+h4QVK?=
 =?us-ascii?Q?qhFwCQ4OKqgghW8DoBXNsS1+BB8VwmFz3odTIXcQOWOyOWV310/KfFYtZSNl?=
 =?us-ascii?Q?tHDvLibq1C8jlpoqwSzI9OQLwAtEZR6SnL06pZRHt8owe2qfc0IHp+l5DHGp?=
 =?us-ascii?Q?ufFSbKIeUK+yFK4APJcmsrL8L0NDCMSoFFCLGokNXCPpYpVaG8FERMZ3c784?=
 =?us-ascii?Q?hd1Ir8OS9I8jCz5F0/The5IdmbYEeuvURugIfC6Rf/JKx+LVIjHNqJXWwUfB?=
 =?us-ascii?Q?vSszjVFbmpk4y4aIEm/6F//aX1L+UbV4D3x1XtWKwcwLjSQ2mVvknKrVBbaN?=
 =?us-ascii?Q?Bc+p+i+hkNWmjRaiqISB5q/PWL1k+F31FeC/NZ8EOuv05Z6PEWkT4j9EMbGX?=
 =?us-ascii?Q?Gvr1Vt/S8i1jm+R/s6YPx2RIrorBcyHjizgheE6WJfTwV5kSkVhYx+INsFSL?=
 =?us-ascii?Q?FgX6Srkl96exr02yPWlcByIfsCAUie8QbgY6TN/upT3jTXV4nALuP4t4HIwY?=
 =?us-ascii?Q?vHQdJv2n+fUEkRQ0VHJh84a2c9st0+HJ89PpHHFHIPEK7kmiq9hyTWI2YU+s?=
 =?us-ascii?Q?uzm5BaUBtTsHBqhCDphAKtExyf75vh/Vfu638OnrFATjksyFXK4kArq6QOlh?=
 =?us-ascii?Q?1sJLF7OZYOHh0rgLjMdKmqaXr97Adbknb5wTxJ6FKry8nGmZ2yRBnnn1QP8G?=
 =?us-ascii?Q?OKrN+ge9+NFyeWaKERzl3SgKF+WYxYt/pujbsK0w5c6l4HdMH918ZSafkz1t?=
 =?us-ascii?Q?fUi5ocvd+1xf2de3ydirvUeuKp2NE6sQBBkY38KIBMm4p11kjBiWZlkXjHV3?=
 =?us-ascii?Q?oYySZ5C8j5kMR/W+OgR9c1C+YdJjODBME5MXYLxTeB5ow4dUjwnh95Hh8FtA?=
 =?us-ascii?Q?dMjuYkFgZHgiBhvkD1kJID+P6JzEScKtWtW9N6ABD6CLvc9yhk0/vUBCi/bo?=
 =?us-ascii?Q?htfok+AfWoX9IdbjmzJRVQibKby4nB0u9ibZo/sSYoS/jTeopqxNRqBL/1Wz?=
 =?us-ascii?Q?rtdPpqmTorLjCwqOVnzo9lJhzHvrbAO59d1eYhrELLuEAgRRHORDpjCLNVL3?=
 =?us-ascii?Q?8TwwKPX3qqfnXBrbjzC4OYV6uRP2H1m+N2UF8hu8Bt7F9zaqc9ZPv3G+11vL?=
 =?us-ascii?Q?mXpQm2RxUV6UOh1HFcJfLQnvgtBcwyauHqJ7iBhqMtYzgYQ07K3zowujmCY0?=
 =?us-ascii?Q?cGJgAx45F1MUG84UzIq2Dh5gwu9oEH0nV+9AtpwvdFURaht30H0gNOnPbCr5?=
 =?us-ascii?Q?j3Dq79IOxT9k+4n/tzWNxB36INuB6Ln3WUBvn4WGW/OR0OmTOctvlBOp1sXM?=
 =?us-ascii?Q?Wg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da68587-4bb3-4cbd-ac24-08dc64f5120a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 06:58:11.2133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0xdKtW8Uws7N35j9vDWgzVqYMcAm+BLl0ryH7mQIEiz6xOuTe101pmwrzAPfkSAACSu9jR8MRvhHaWRVQ6qKOlZ2w2k5e7XLQnMHCSYaUjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6096
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: 25 April 2024 11:25
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v2 2/5] drm/xe:
> s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
>=20
> Exec queue has replaced engine nomenclature.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 689093259302..b26f374ca20b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -56,7 +56,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>  #define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
>  #define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
>  #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
> -#define ENGINE_STATE_SUSPENDED		(1 << 5)
> +#define EXEC_QUEUE_STATE_SUSPENDED		(1 << 5)
>  #define EXEC_QUEUE_STATE_RESET		(1 << 6)
>  #define ENGINE_STATE_KILLED		(1 << 7)
>=20
> @@ -142,17 +142,17 @@ static void set_exec_queue_banned(struct
> xe_exec_queue *q)
>=20
>  static bool exec_queue_suspended(struct xe_exec_queue *q)  {
> -	return atomic_read(&q->guc->state) & ENGINE_STATE_SUSPENDED;
> +	return atomic_read(&q->guc->state) &
> EXEC_QUEUE_STATE_SUSPENDED;
>  }
>=20
>  static void set_exec_queue_suspended(struct xe_exec_queue *q)  {
> -	atomic_or(ENGINE_STATE_SUSPENDED, &q->guc->state);
> +	atomic_or(EXEC_QUEUE_STATE_SUSPENDED, &q->guc->state);
>  }
>=20
>  static void clear_exec_queue_suspended(struct xe_exec_queue *q)  {
> -	atomic_and(~ENGINE_STATE_SUSPENDED, &q->guc->state);
> +	atomic_and(~EXEC_QUEUE_STATE_SUSPENDED, &q->guc->state);
>  }
>=20
>  static bool exec_queue_reset(struct xe_exec_queue *q) @@ -1406,7
> +1406,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct
> xe_exec_queue *q)
>  		set_exec_queue_suspended(q);
>  		suspend_fence_signal(q);
>  	}
> -	atomic_and(EXEC_QUEUE_STATE_DESTROYED |
> ENGINE_STATE_SUSPENDED,
> +	atomic_and(EXEC_QUEUE_STATE_DESTROYED |
> EXEC_QUEUE_STATE_SUSPENDED,

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>  		   &q->guc->state);
>  	q->guc->resume_time =3D 0;
>  	trace_xe_exec_queue_stop(q);
> --
> 2.34.1

