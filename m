Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72021CAC5B9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 15:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB7D10E23E;
	Mon, 29 Sep 2025 15:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpqgNLjZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D9C10E23E
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 15:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759160641; x=1790696641;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UEB9gILg172aN35YeKZg5zIGOggm/gLMxCJ1yluQ6ZU=;
 b=OpqgNLjZAWVFLaOBpSRr7/e39znAk+aYem7WBzshIEq78o079aVHgFoj
 4by1dto+8ainCE9bG2dnAVFXVY0tMcGySEv2T+NrpHNzHC3S+lRNAFAgw
 vDVveCUvQ1wmxAeCR8nPvQotuaN6cJsNMd4Z9cLrP1xCdcmGcDOGDnRXX
 LqEIeUtgPOWou5iUWAiff6fCoQu0K46P1v5P6++f2Ue342eZy7fqUrPu+
 VM0ZfplfsVlmsy2WAiSaZBO0ysP0sB2TN//pbUQ+NUCs1HTNTBg0tCIQT
 +M8EzehkfHBxj8Iv+lXxe+Dq6ZDYsWttih+b+D4GxD4+cGkALHMofdOlo g==;
X-CSE-ConnectionGUID: DRnp8s6KRFKc95+97s9hvQ==
X-CSE-MsgGUID: 2DAzvuo3R/SnQbMeEMxa+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71651537"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="71651537"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:44:00 -0700
X-CSE-ConnectionGUID: tcO7ksoyTTmOla89PQ/QUA==
X-CSE-MsgGUID: 2FEQjk2GRKGIP4gBgxwxxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178076420"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:44:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:43:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 08:43:59 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:43:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfsWgM7lXSvPQxUYA/JCSl9gZFV9MzDNqhXOL4Bufx4hnEc5TPzy22baz1Ynp0iPRZZar49VzY825ZInrAA69XQ9/mMPAh8ErPdoeRtNXUm/NyG+4hiV43tDRqDF4qavTybeyV7NaiVunixWvVh7UDH1Yovh5YBcFYExRvQnsgGdiylPAu07h9ADtHXPy6FfLJBEZ+PrQTVL+bd7Q2saHepyHH2rJeDTigZVbNeCzgsf651tlgIWNr8g+1XLba2kfHd4tR+x/nQb6AR0swFtGK09Sv1vRN3atQqzPCrKdSXciS+/jXpBunBsD9QDLR5DRL/Aciv6ycwR0T6wgBBFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbXpbbk89ncbpCujVZEDVyefm6r8y9Rksv5NIE/dElA=;
 b=whjPOwu3rb2mWW8WoqKwq/0qnfGUZebs9kKLSdia3Y9DT+G0asmf4HjejfpXjxnr9Yyjskae8cNGtDqZvEbxLN0zdb24Dk0wAGJWhRg10Mqxukbl/JCKN0ep7pcDpKXm0QFjfel3Oz4ejahatUqHnLT4DOSxV78Kb07pXl3L6sBzvOmFb4SXF9O6+wciQiV3DZp60GyNIklqsE2NeR4kwZBZbtHcnfR+5qrwibnw8eNu9CXSJmvPJLMN6utBSybpJOj8QvjaPOuKHIgZs/f/Gw25ESKbsBFohy484alVcN1PLgeFivHlTBDzC5kx0CqJJ29d3/Gf4z2yZ5c5acwBYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 15:43:56 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 15:43:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_late_bind_fw: Various uninitialized variable
 fixes
Thread-Topic: [PATCH] drm/xe/xe_late_bind_fw: Various uninitialized variable
 fixes
Thread-Index: AQHcK9xeHO+e3vtOdEaHtgd5Y4Si0rSqV6jQ
Date: Mon, 29 Sep 2025 15:43:55 +0000
Message-ID: <CH0PR11MB5444677FD99A13CA2979B7C7E51BA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250922161708.71155-2-jonathan.cavitt@intel.com>
In-Reply-To: <20250922161708.71155-2-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB5133:EE_
x-ms-office365-filtering-correlation-id: c890f9e7-7ada-4828-78cc-08ddff6effd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8pd50HcVJ9YnhYsnJQbnTPtPAYOn8rHWNyNga1OALb/m2XukxKaeXOi88hre?=
 =?us-ascii?Q?QcodhVK8/r3hl4aU1kiBWNrWdpB4XPNx2JdwTcj6WcpR4VWgqM3a01ku88g9?=
 =?us-ascii?Q?1K1cB/AbJbxH/2WQj1bnmIRIilzfY48ry8K/wTHjGHv5IA0eE56HqxCoM7Vs?=
 =?us-ascii?Q?01triv1FQbC6QQhcO1yevrU8i9IXhT0UKrrBjZWKYRWYiU2hpmEXMGaSsmjV?=
 =?us-ascii?Q?NLb4KcxjywOwwMt6T3QsA0j0ZJ6kMphTdRhQGT4r7S6/IPKVaSGHME1dTiqk?=
 =?us-ascii?Q?/vlI/tHpGC8PJp3XFiI1V1Zky5hM2O5G+w6+LTf4+18t/Nvct70I8A/JKW+m?=
 =?us-ascii?Q?t7C6m/7jPdbGOQwzgD3D9Ia9Q9XrjoMS70mpg7gB7N4gwTyMkiGUpLIHXPgf?=
 =?us-ascii?Q?dI1dVdebk8BXgnaswhxUM2H5stQojwU6drAK8ch5r+VC67wdothw4ISPvywW?=
 =?us-ascii?Q?zftgKndJQ0S8T0iVvTCgzZDrWUUsIjEsrG8HdBB4eprUxVRhQQWZNXo2gCJN?=
 =?us-ascii?Q?qMlbPDX1xlwtr6A6cfG7BbCApxYwCcolU4BiZsLHGQWqoGWXGlbdrZnjCVvi?=
 =?us-ascii?Q?BvV8V31/tDrxzVOuvX1mmDp6tbf2hmUdsCrJ6Js5huRBhfSaU0VuyW4JpjcB?=
 =?us-ascii?Q?6RW9osyme3h+Um2cNu7RTVNP9rvxM+TAEvXoD8d2/lLrmDgHCeGyFFWjVwz4?=
 =?us-ascii?Q?x1SfWB1YrJv4zYS6ErltEqJEwnO1mI9OTZkXwvRqpCk/GBdu2DqbSxU7Abq1?=
 =?us-ascii?Q?7dwrBIBy9qDz56rn/STqsx58jhxsoFZQCdxfeL0v1lW7uuttl73LR2LBYcfw?=
 =?us-ascii?Q?I3pnN2vN7+HFVveefS0tysXzxS+435XqFUgvTkmfV2C2dE9PkQRUluK8pLHo?=
 =?us-ascii?Q?vilfRfYBtvy1rIhXCEQocrhodlZiEA6MLe+I8zoQTeGvHj7TFtJt822eL1qa?=
 =?us-ascii?Q?lGFlfOlm9xjVlSU9eoAALaBkMc9iKW2mJTeiTWAg3ulNTn9gIbiPdg6BqlWQ?=
 =?us-ascii?Q?1mcq16vExLk5IeqiRiqkPszm2ovW6TCZay+DuSrBkhJObB8EC/D1/1DA3gd6?=
 =?us-ascii?Q?FNcp8rn5r86mMSJASdS+s+RBQ0ifwWiBZS/K2QQlspIVzGRll/i7ALLY53mz?=
 =?us-ascii?Q?/TPqDa+M7PKwX2PlpLLO18eYQaJtvz1DWNTiVC5L4YsHETSf7PvTJm84NMAE?=
 =?us-ascii?Q?VBZVeHUTrbNQc9LzM/x9JzxTTJTRrtPW6DuRKKxBDh7hxMse1wiYnFoOoncJ?=
 =?us-ascii?Q?KJwZYs5v/14kPTsxaBg+Rv+OSI11WOWoXKQsJsxrlgmgevgWCkxxj409wLQR?=
 =?us-ascii?Q?MpedKtNm6Iy5LXpVv6FcC77ng+1w/cACL9xKXoi6Q1md49RjoMj34uxF2KWj?=
 =?us-ascii?Q?vivaOerpYx9iEbemMXSUeHkt69JojyhWVOyq10gpxEMP9dHSl6ZBY+/UW/W3?=
 =?us-ascii?Q?l0aGCbxisnY3s+8JcY0/Irs9HgLBAeW9ap+ntoXoH+4pnRpaR9Y/Ig=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R/E6F2qJ8F9eeHvrLaxs++yQ+za/rNDOwWViFCY7/NIeslJXT3J/qxI5ZuyV?=
 =?us-ascii?Q?ba/XEOyDCgezJyBANhfY7s3AmfPQ09rg+6jIJJqxSs53WJJwXMV6MqzUh0P0?=
 =?us-ascii?Q?sf6P0SucJEMtTaojHDE7Unf19Kzoul9gatnIVxhnc1Zo6PLIKFBxl0YDNxAN?=
 =?us-ascii?Q?1qTyHugT4gbkRh9sXX9DB9Lh0kPBnKmricTm2IemhB39KfkUjF4hEOlNyKTA?=
 =?us-ascii?Q?OZHrw6+auuo/00aZD2e19Rt6beIwycKO4ELqZua++jLYVKzsfTjrhAy7D5yh?=
 =?us-ascii?Q?kLr16gt5JOubRykVIV/wS1OByGWRpegrkae4xMAIUsf+ujeLRijV0sB5EIoG?=
 =?us-ascii?Q?iCGhawFN55totDdzVnlMT+FVvCH+PpGkZH6qEVhwxFlcQvpo7jUmie8NZ8hN?=
 =?us-ascii?Q?r40cxCNi779N0FsE5lVDa55BYUsT0pZoa4OEsz3niIAjPWTKoCuzuPYYM+7b?=
 =?us-ascii?Q?GoR4zQs5cyqNAhr+cGTYYRzxW3dxl1Ql/qR0kqRFxs0gaOcrVAovim4qA4hS?=
 =?us-ascii?Q?8dgSvT7R2w44iJF9Lc6SS2aaMSy2GeBHayIoAy+85VNh+wpdY70l7Y3e8qV4?=
 =?us-ascii?Q?nf6+f06jLYtj0tKh6jYjiCdTIjHtui4OIuycbr2G413nWLh82Pd3Lz9ISlty?=
 =?us-ascii?Q?OpW3mRMkdcLdOnzcNMAliXBJpcgbEyFNknJdMkcBqQAndOT2UJC9qvbaTfYw?=
 =?us-ascii?Q?PztgdTj8OET2UmqiJ8G/MuttcpykjcXpJqesSkhQakpHgCbcuRHyZpobcKzx?=
 =?us-ascii?Q?pfewoDrgslXX7kOyLzAU+meRqU+sOr+pcxB+Kf/scdD809fiOue1ljhXeigc?=
 =?us-ascii?Q?G4KBeUWUhpIJzf04lBuAomEGrg85e8/LS2VeeiPkuzVQVNCyrHtycM6fi8iX?=
 =?us-ascii?Q?CFS4IgBiRrcpYHRQjslWRXMsy+HCz4ec5uptnDFfCZ7cOYnWMNxZoxIG6YmE?=
 =?us-ascii?Q?0vJ+znQGtQQ6hkQhML+kgTmKDGTqFD6iQpj+1lD6eYa88nkMA98bvb2qXauu?=
 =?us-ascii?Q?oJ1gFDsMTGeR8RBOtdOKOwH1S2gWh4qSDqAvAUuwxDUP7bt9WoIOzuju2WAn?=
 =?us-ascii?Q?8CQPHIft0PrYGuKhtUhR2dxmWAxDA7ZgXhPeEDWv6uQuXYbVec/46pTTcbTu?=
 =?us-ascii?Q?ze/YfzXVJslpB175m94XicnG66EQ1XTUJk+iCBy0QdwYT7FMzJh3JGBSc4KC?=
 =?us-ascii?Q?9yoQPlCTFtRqt4VqVZ256IXSSHhQBlGAZFdHx80/6c1lEL4WTK2XwgtKAriN?=
 =?us-ascii?Q?gtp2zVNY1bhnsApmHKjyBLKYw8rXTDNLy7XEEodkq/D2I1ye2oW2JeTVbqTo?=
 =?us-ascii?Q?+90Y9sAa+uyYgcmqSqMm/AIclv8EEU08rKyQa4EWzd13DRLIPq35fwoVnHlB?=
 =?us-ascii?Q?5HUCYWCHsrtu2+jzRabM8tLQIOIy/QDacLR/yQf/sZpFmJtDCVw/Lr0qAvtb?=
 =?us-ascii?Q?mIZtVZ/kEgsRzSswNxBJ6WLWTtFG83xhje8NIw7/oAhiKZ2FHg103gfzOxnr?=
 =?us-ascii?Q?5XzVk4w1HQIBvqSc7hKqCGDVCO1kZ8wZaxAQPkVBkWxPI10Tjdvc82Q2iWOH?=
 =?us-ascii?Q?OK+BaWnuW5cAYTgdI+uje/CvRiSBfX6U5z+oJafZ5rCdiNnc/RsVaSeeMMfw?=
 =?us-ascii?Q?CN5OIXe/crZFsxgcckML5Ze8gare+jbjNTh3e9jigjEw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c890f9e7-7ada-4828-78cc-08ddff6effd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 15:43:55.9831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lo1Wzr2h8DtsIKoqqSeKiniQsEROdaIanJC6a13wnbaCPydg94NFa9oMOWfF5hjknRJdbto2CJ9ktE2PQ8EKEXlwlyfURxXNDVVX+3Fh9fQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
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

https://patchwork.freedesktop.org/series/154952/
A fix already exists targeting this.  No follow up needed.

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Monday, September 22, 2025 9:17 AM
To: intel-xe@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg=
.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>
Subject: [PATCH] drm/xe/xe_late_bind_fw: Various uninitialized variable fix=
es
>=20
> There are a few variables in xe_late_bind_fw that can theoretically
> be used while uninitialized.  Initialize them.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_late_bind_fw.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe=
_late_bind_fw.c
> index 38f3feb2aecd..2a57f7d28e9a 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -60,7 +60,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_=
fw,
>  	const struct gsc_manifest_header *manifest;
>  	const struct gsc_cpd_entry *entry;
>  	size_t min_size =3D sizeof(*header);
> -	u32 offset;
> +	u32 offset =3D 0;
>  	int i;
> =20
>  	/* manifest_entry is mandatory */
> @@ -116,7 +116,7 @@ static int parse_lb_layout(struct xe_late_bind_fw *lb=
_fw,
>  	const struct csc_fpt_header *header =3D data;
>  	const struct csc_fpt_entry *entry;
>  	size_t min_size =3D sizeof(*header);
> -	u32 offset;
> +	u32 offset =3D 0;
>  	int i;
> =20
>  	/* fpt_entry is mandatory */
> @@ -188,7 +188,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bi=
nd *late_bind)
>  {
>  	struct xe_device *xe =3D late_bind_to_xe(late_bind);
>  	struct xe_tile *root_tile =3D xe_device_get_root_tile(xe);
> -	u32 uval;
> +	u32 uval =3D 0;
> =20
>  	if (!xe_pcode_read(root_tile,
>  			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
> --=20
> 2.43.0
>=20
>=20
