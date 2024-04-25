Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79ECC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 06:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8784E10E63E;
	Thu, 25 Apr 2024 06:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCk+Pbqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B02510EDC4
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 06:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714028022; x=1745564022;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+uh6snnFmMAbTCazwKECgKGQQwR8o34dmVPpirsqjeo=;
 b=hCk+PbqrislSUlc0EK98C7mh7iv2QKWA+YzZDhHOBcMLA4uwGLhzHDax
 To2bfn2fr4HfMUZ5UETRDxy9SYNqU1vBJgGBV30oAjtrc0qfFhBE6BH2f
 c21nw3+i0FUE3jZFfQtFiLe+TlblCiX3KpM8/psp70w7vhvzC+NuUlkXs
 IiaQ3bhH4h/VrVmm9XbDSyWbW+7fqxyZSP8LjNhJ0s73zTvB5J6CXkuo7
 Z0TxJPdvTX5cOhA9IPMn9H5mCQD9cm/g9HVv3zrCbpkC3TxaJ7yeduXn/
 Aopsif0Zp1R9FdqdWK8ulz5JcMTGjxvQ/t/CFCQQlYDY+dHPWx49DVAXT A==;
X-CSE-ConnectionGUID: EXTCnk/9SjaqA/nwmxzp/Q==
X-CSE-MsgGUID: iKb5DnEMS4ai8Q55qbR0vA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9558607"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9558607"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 23:53:41 -0700
X-CSE-ConnectionGUID: srD288yRStCM0LePygK7bw==
X-CSE-MsgGUID: Z73sGlUbReyAKyh+fW1wIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="29750128"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 23:53:42 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 23:53:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 23:53:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 23:53:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLWi2nF4sm8/BOCkmoEg259cnM9JczykF8aQ5xWzjRMANfkFTVq+qnamfrVIOQDYkUY6yFQFyFWrnbu9t9QjpHneAk3OEmbbPyXnhVY0Sw+SgB6sJNKD2aW0EemPPtNLhmMi5nsiuS/qm2FGnnZIrI3sLpteg8E/btNQnUZstRF0HHVJ0rpFjvsOVeQHDZ8EQlvLwd290KTU4wMEmqHjAcLjaLJo6aroNQtFLgJ+X3SkseHkP0UAY4kb7BVEUj9XmILGlvpYnmKKeCJy31sUuu1zVqYymRQyeR35uThVvP3ieO8Qir9PSqWEQAJk3I2z+GvCTXwUCt9cU+2KBoePUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iU2TiCcAw20MGqUZuNVmcGEdL1k0pPaIt5yCMjaJesY=;
 b=Bx2Tc6t38raErIblUS/BUMCKuD35ulr7vCOBdn3snpCM0TfSnrMhtQAGMXz8puBTQOn3eo6/xFTqVijYBf3lrVGVzeFRaCJjD6G2D3nDzskzF1Pmf2+uS3aWCnfHt1AlAh7ksfd4FK5zpy2PRa7U3JJ70FDJUsikW9/cloDlpU7GAlkb8JeuoGJXZwtaa+H0/l2SZLcRirX3L+vIc+ghRQMYO+3ZIVfMfiaNgdOTlJIwnD1b1CkpkSN07UoyRuqbWP0x+tw+AZUS+9L/jVEEhvgI9hb/7Yp29fD8/PvSdskeMKFjxat4kIH5jrRyOvFctOB+QhnB+v6r+0cxmYYdAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB7657.namprd11.prod.outlook.com (2603:10b6:510:26c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Thu, 25 Apr
 2024 06:53:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:53:32 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2 1/5] drm/xe:
 s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
Thread-Topic: [PATCH v2 1/5] drm/xe:
 s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
Thread-Index: AQHaltUiT75yuzis+0mX5m2dyhVQm7F4jLIg
Date: Thu, 25 Apr 2024 06:53:32 +0000
Message-ID: <MW4PR11MB7056D423E0993736829C577EB3172@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240425055522.1919005-1-matthew.brost@intel.com>
 <20240425055522.1919005-2-matthew.brost@intel.com>
In-Reply-To: <20240425055522.1919005-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|PH0PR11MB7657:EE_
x-ms-office365-filtering-correlation-id: 08083e07-60c7-4036-71fc-08dc64f46bd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?VrvDNI0LdsJBkIbJMr9G//x4FhdYKJxEdzZ8DNrKxJtMkUq13OxoGEFEOnvi?=
 =?us-ascii?Q?/fp1CYq0rSSINFz+7cEh8Yo3WW18VK7QfdeoOx7AT1YWaYVTq5PmYLm3WGYj?=
 =?us-ascii?Q?ATHhCtj0P12J00YpVbqJEPsmfquUzz5G/t/ZdQsjZkqsT6nQA7c1ImBETUY1?=
 =?us-ascii?Q?84FUWvLr8k1wDquIpsgg+UUsJ+/9NIKl028QAfU3K6P7wlH3HVAOkQVqssnK?=
 =?us-ascii?Q?OAd59wDwi+m23djI7wUPPntsN6mJO0PNPgvktQWz6sog0mxjaWXNULXcUfDe?=
 =?us-ascii?Q?YPFSDwk4C/Zx+uTmXgeKVognovOlOHIcZo5ce/GGnNxmXTo3uMiafUKEGuji?=
 =?us-ascii?Q?zPZAI45039P6x6FW2eX1evz+kfKqzTCtGrgeFW2IV7GuS/dTSDJgsioadUQH?=
 =?us-ascii?Q?eNBAYsKaTabrzVRazOF7F+m4z3js744pbpUt18udAnAwqRNK29FEA6qNsrB0?=
 =?us-ascii?Q?0c46bqnx09Dr/zrN4MbNWFTSG52ydZEkPvTh/KPF4eyrVAH8DIxjIazOLP+X?=
 =?us-ascii?Q?sQ7yu7BEPb61czlzctsfv9iS9HdeeVIhJ2RCyWZqx0h+WFUVk/9Ld95xCmyP?=
 =?us-ascii?Q?If2zZszB9T56HESAk8IQl95GwodV6+KPOUr1THl/s47IsmMVYVNmAIoCLOol?=
 =?us-ascii?Q?rXxBHO/v+/5aXW+PwxZQiuWGv8Od3OwWNsbD/gONlX8aImtDGSPKor5nOwyY?=
 =?us-ascii?Q?h3I9Gh0IfCLmnCuGQFIO8Cm/WI+QpPgZ/gVYBBVS9X1fgAX9OdYcvRjAzb01?=
 =?us-ascii?Q?nBaN0f6zfAum3OCK4Nur1F7O5p6p2OqXRO1dED0CXFcY6gRIW22E9389dxtW?=
 =?us-ascii?Q?XJ9Cd5cTC+SRYgAAj+dXZPVjv3p9R1kjmpSYJGfgIS3RsxYsJzmojk/uBhh8?=
 =?us-ascii?Q?SsB6GDeEL0i+Ioa5csK9UuUF3pXWr1iPDZ9fkvYH2/u/5aS3CwZLOW7EEqXQ?=
 =?us-ascii?Q?ZsfajcryIQts5wlnCpZ/73KK1wxEVmQti9wpc4Qq4rrzMbshdNxjrGlUJPza?=
 =?us-ascii?Q?uykcRGAieyIaWJP8ZeuorcBjCTQsDhy+VGqrchimOjHUFRe7WYD5CAfmHwt0?=
 =?us-ascii?Q?Z1pnbcRFDLponBYdvjvMMyLfW+np1SasJE1p9SKYpbgTqk9so7kek1MNmwo8?=
 =?us-ascii?Q?N/OzRCZEvtkCwAoOt/hnqqJCeQ4NmyrBeerL1mmZ00mcHPIuH1ORR1uL0Scu?=
 =?us-ascii?Q?UI3svY/4/KtioUyvft6JPrMS5o+KrNHozpoSyBZPux7VF7lFgn+rGbo9OWVH?=
 =?us-ascii?Q?G0fEuL9YRaA5qtVwopb+ZU1xci6CsjCJI5gfRL9eghBl+LQK9/VPA5PcAmMX?=
 =?us-ascii?Q?IEKFFnxf/mEQYrwzpbR7KcIkzHwWtNmHpe6ivb1qWMGJoA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?coyF9HxsqVla8LLYecPrdTHKD4IWJM9O1gYld4maiaCqQEKr6iLVlanlPXnj?=
 =?us-ascii?Q?n1s1Z56cqUq/LbpbjRV4YgfMZfZU6C2b16xogY5jY76GPHGaFc28tZBxjpoO?=
 =?us-ascii?Q?BJ1EAe3hC+iMk714Nf3F74vrg/PInCNJWvy0z1DmI8RyaZcRyrghv46PTaQD?=
 =?us-ascii?Q?il6B8uMRd5koxhuUTHSswf5FitiQxVC0n32VL6/3F67hk5V1XNWEsX4qDfzg?=
 =?us-ascii?Q?RnYp2M9EukXM4GcqPV/jR4zL8OBnqfyHuqb5m1xyR1NC8igVOaU19E8CsWsz?=
 =?us-ascii?Q?7l9YF0LqcppLMgFYuuq71CxFMJysnUyucS2tHkUgY57knihyPzJ3MkCAQGbm?=
 =?us-ascii?Q?v0kyhqsilwX2O4/DdtuMh2vz0V3lSffWjiNWxZJ/7P8fjniTqWzpQkUrin1D?=
 =?us-ascii?Q?6yu+0BUXTRKwMs0zcdIbXyqs6qwnKRCojaFcV39GFsWUattVOYA6TnjauYHD?=
 =?us-ascii?Q?1HdlyqJ/QNNkuj4bbZtp+xQk4GnwXNRMj9HN6b8n5yfpdB6W3GLWYYal3zKe?=
 =?us-ascii?Q?9+suoRXC61Ob7Ks4A3V8+su4ibOB4wO7OFIeG9aqkJ7VXwfMRDh747IawXDD?=
 =?us-ascii?Q?LLPvdoZI+acpRbj8DRs1KyvnnwEY45KREO4OjGLqEkPsthqvo4+QUM6RRa0w?=
 =?us-ascii?Q?j72yHKVQUAb07szXFzZkJRIMueyrDKKHqv8a0y6DZfYjo+jDRreHba/ZPF9Y?=
 =?us-ascii?Q?0aShVpLEFdWg5YOoeXpcRFasxi92ktOuQaZHTAyxbrOtbt1TLqVIIQJ5UVFX?=
 =?us-ascii?Q?5SiZR0zLkuc4E4WphSF0IqrWaRLVQitlylm0oy02zX9adh1blmqTjv0f1ldp?=
 =?us-ascii?Q?ucZUCcKVWHmztGXS621uuBzP33gYiaseZ+uzu8Pnp9kLjNNDMTsPJY9GB2mm?=
 =?us-ascii?Q?YkSWdJc7RDqvUvKij0urHgbzDmu7OiiCK0p67laTNJ01FMPfd6jWMZ3t2H8q?=
 =?us-ascii?Q?sWtvTairQfo9NTxCSB1+MaSIDs1xrdV3DL5Y7LomSbWu7vjKLgnrqwK25FUI?=
 =?us-ascii?Q?Qm92v2dEpX1n6dCXgdKo/e/0T5bBeREprI1MaWp07DaoPOYazAqk0BayhXBo?=
 =?us-ascii?Q?EAdRgfSGRJwi5mmOdpQx9HoBfwShfG/DvU99cqwO9+z4Aa7Ql+iK31wvZTU/?=
 =?us-ascii?Q?8ktlLpG00k7cXD/gQdloLFOOfl37iS3CeTgY/8fh020d62M54wWo602cOxFa?=
 =?us-ascii?Q?WbL9MstIwFqj49i0ja125mhqq3vuEiwq0Je+RMyKRBAURFBTElLEmNJHlr7g?=
 =?us-ascii?Q?UGNgKuHyl+IBgheYIBcPeEAoKhx7Z/tLPkD8JZYeB5q58Y11nDgCiBmtmYx9?=
 =?us-ascii?Q?eyvcSiX14jd0SOCN8SIDwnorJnjQwhd8LlhmSjZwt2XJubenyhKiEfK7Ey6F?=
 =?us-ascii?Q?KOA/Vz/NtYAbL7pdDFyaWWVxZjveYgZuGJ9CX0lAr1bmTz79OODltwVX5CIZ?=
 =?us-ascii?Q?BN6Y9o9fZl9E68RRx+5X2MNyGE8KmO9CGz8eGw00gWZSe7kfVbWsEX2sX2HP?=
 =?us-ascii?Q?PuWy4172DTsNMvRLZT4R+pQPOc7obXmkUi3lHG57flcMspXf+3KR24o+S+6T?=
 =?us-ascii?Q?Oy/FeJsuM4JRFG7CM/NobPFjOqbRCxdb94fQ1B8edRQDgvEEEtrl5BRwMTx+?=
 =?us-ascii?Q?8Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08083e07-60c7-4036-71fc-08dc64f46bd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 06:53:32.3825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMqmbbQwEula56iQz6j8U9J6zDYg42T4K/Sh9eJFafg0wPIIT1XtzS92lvMC3AVY6QqXWI0y8S+PNMn9FUrhGGOaMhDfEx9Z8gQ/gT/pi54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7657
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
> Subject: [PATCH v2 1/5] drm/xe:
> s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
>=20
> Exec queue has replaced engine nomenclature.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4e78610d1591..689093259302 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -52,7 +52,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>   * engine done being processed).
>   */
>  #define EXEC_QUEUE_STATE_REGISTERED		(1 << 0)
> -#define ENGINE_STATE_ENABLED		(1 << 1)
> +#define EXEC_QUEUE_STATE_ENABLED		(1 << 1)
>  #define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
>  #define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
>  #define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
> @@ -77,17 +77,17 @@ static void clear_exec_queue_registered(struct
> xe_exec_queue *q)
>=20
>  static bool exec_queue_enabled(struct xe_exec_queue *q)  {
> -	return atomic_read(&q->guc->state) & ENGINE_STATE_ENABLED;
> +	return atomic_read(&q->guc->state) &
> EXEC_QUEUE_STATE_ENABLED;
>  }
>=20
>  static void set_exec_queue_enabled(struct xe_exec_queue *q)  {
> -	atomic_or(ENGINE_STATE_ENABLED, &q->guc->state);
> +	atomic_or(EXEC_QUEUE_STATE_ENABLED, &q->guc->state);
>  }
>=20
>  static void clear_exec_queue_enabled(struct xe_exec_queue *q)  {
> -	atomic_and(~ENGINE_STATE_ENABLED, &q->guc->state);
> +	atomic_and(~EXEC_QUEUE_STATE_ENABLED, &q->guc->state);
>  }


LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>=20
>  static bool exec_queue_pending_enable(struct xe_exec_queue *q)
> --
> 2.34.1

