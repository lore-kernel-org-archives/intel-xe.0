Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B00C54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E01510E290;
	Thu, 16 Nov 2023 15:53:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3296D10E623
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700149991; x=1731685991;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=1Vkw96nDRQsCTc8Ul6gmBJvtPFCjJ7yITxdUbhzxph4=;
 b=Pl71V51laOaRhlGYKGkelDz3Rubd0FlM3QTD2zseQb+zbpXGbyrNQHZ4
 /0qGuVKSXablNfu79dEShpYSSerpklToajW1kKgsU4H2IG2ZHlbOXXrgM
 isDnQ2YCAZXBztB0Gb6n/Vw5klltGTaG7OPe1TzR7VFHcHXFqBsjRWj3j
 K+W+UjeEFRXQlJyi8d4nl4aO0+AWISs461exVOaSAJo2RibsqlPM5eHZ+
 Xxq6BrCDidDnDwEWh0MrUkum34BZqAE9JQVP/gpyGoePQlXwvs2epNQpz
 3ysHKycLianXIFJvYLwd7RP9x89UF5AKywuUeYqsONyiYHdL/lBg6vF+q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="376157112"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="376157112"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="13591436"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 07:53:09 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 07:53:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 07:53:09 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 07:53:09 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 07:53:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBmuXtCmlcjAYafTFm8ndGWxxehscUCgEqMnSBn/2l1X+ycJ1Va640nBwU3I/pXjpqA9CvMn1FzEAC3xF7pu0+y5PYcqutqdiDWfh2KzDWaiWq0+348hg6duSIZxqm/2zCroLCB+WFdgIXkH8ZFSN8k35QdsmTi6BkgGFovqGHzSsSM6dm9PA54L5BIFt4yRDFDP2TE0+ZXDlM6zQvAsbnPKhTuZU9GmaLiFNw1mUW9jRo3ELeV1C4NXhyM6klDKpc0S55Qb1QgeY/RX7oxf0GLsmK/5jK19TdSg//JoAYlc9TV6a0bOkB3R5by9QTErHYse2H4I/jZfd2CJW7MPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6AfpbFQE3VGjfkkfflf3AkAMDuRpYwd6rCGqkpH4k8=;
 b=L0D39VoUJgBF9bwpRCusuXErYtUvzJ+4RmzSBiqNMlrA1i5fRqzlH2cXhki+ls5a7lEhSm1s1pOypGhTsyqsXeq8u2uxAM/ecK/+xVSe1lNRFzgaDTXr1C549+rvxXMAafWhPv0xsSnBD/Sn52Pnz6auPDxQwHMDBjuzem3rprdrq7yxYgVty+ykbWGeGiqXstvntF12uBVXnJprY1PMtzEIKlMtw6fo1CLW6SR3Dv7Y3PvgUcZtv/Yx4fbha//mOKaLYPJYVNcVy4LPnDUNo0HRjQhMswmhnqZ8Wc/7dsdiKgway76Grodwd43sIm1o8KLRH80OA33TMM37n87/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.21; Thu, 16 Nov 2023 15:53:06 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c%7]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 15:53:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <170014935532.3094.16567676584388667438@emeril.freedesktop.org>
References: <20231116153901.31941-2-gustavo.sousa@intel.com>
 <170014935532.3094.16567676584388667438@emeril.freedesktop.org>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Nov 2023 12:53:01 -0300
Message-ID: <170014998167.3216.12035085570279494266@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR01CA0053.prod.exchangelabs.com (2603:10b6:a03:94::30)
 To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 77edc540-06d7-4524-8e45-08dbe6bc1f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oEBU1MVcA3xP6Px6we90GZsnyCqa32BAc40GoJYHCxG4qrm3R9PJyKlLsxQB22zuYEBoXsI1u40VbhEqxSvBB6HghmpEIg2eFdnDdBOHgw6qkZbQ7OYOdpKh7ZJi9ilagkUU+5qZBnu+zkY6wYSE6o1+gZJWNLNfQ0vhS5lUzRqkQJPEGHl5aQxmS6GCvrWKWWd2wO9UdPKOGbOccYhNeW7zVud7L2X7VYsT8jhiHLjjiqBx8Z3VM/TV1VhJWrtwTGi1Z1o22tKn+vePHut5nNH+qTUmRu1f+gM/WC3zcpgTNEDI0+pyN30Vzzf3szVI6lz8DSmQQIBgBrt52Py5jxTGhjmALNV0hDXc+IHoKh++N/aZUm31JyennWp3uoqAiPuHDT8nJkPaiBuWIs1uVze0wIwaMUuhHkKAoWEnd0n0aufNWA26gC7UO8h6ByECWWC5eZxjVi9KKY18Bj98KHwMdZdk1IWV9gk+Hs1iiUcV+tUQOoHMn4CbPavzegJv2n1LK7pW91Pg+muz18tKNGJT1EwhsD3E0Yuuw/aZMJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(39860400002)(376002)(366004)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(66946007)(41300700001)(66476007)(54906003)(66556008)(316002)(86362001)(5660300002)(4744005)(4001150100001)(2906002)(4326008)(8936002)(44832011)(82960400001)(83380400001)(38100700002)(6666004)(6486002)(966005)(478600001)(33716001)(9686003)(107886003)(26005)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGdpUWdCMWpqeE41cmhRSDhkclBmbTcwNDNTek00ajRFR2haNW5peDNFbmIz?=
 =?utf-8?B?c3Y4K3UwR3k1Vldka2xTcHNUZXJ5MEpxbjdjK29ZOVIxVm5vbEc4MGdFb1Mr?=
 =?utf-8?B?cVZEY1N5ODlyTTJGRmpVUlZWYlFrMEluZ1pQTFpYUUM4QVBBTXVzNjVJQUVp?=
 =?utf-8?B?Uk1SVVUwK2N1dW54L3g4OFJldFBCTWNuRGMzQ2UwL0tYMjRuK3dBc0ozK05t?=
 =?utf-8?B?TCtNU1VVdGE1RUs2WHhoYmRtcnpxUTFMNk5CaGIyczhFbHBERTU0MWZLMmNF?=
 =?utf-8?B?ZGp3bzVXTFVOODROSkxvK1NiSjUvdGQ2WG9wcFBpK0J5QXFwRUNER2VsWlVT?=
 =?utf-8?B?RmZQeTJUaU10b2ZUdll3Qk9zaGZBSW1PYXN2VjBqWHp3SHRBVGZjanB3RU9q?=
 =?utf-8?B?eFp1ZnlYU1BYcHQ2ajcvQld6SmpqZWJLcGhoazVTeDRweDVwb28yWkhNVG9q?=
 =?utf-8?B?OGJRb3ZYVUszUzJxMVpLZlZsemI0Mk1qaVZHcGt5blFCTW9JODZYMXErZ2sx?=
 =?utf-8?B?ZFJGZE93dldqT0ZwQVd2UGNvdG5YMjNVYVNyMGYvZFViaTFpRnRrTTd1NFRF?=
 =?utf-8?B?NVNRbTNXUCt1NUJZQVJXaWxLc1lzbS9ZSGU3eVRaaFFHZlEwM0tUUGRxaWRu?=
 =?utf-8?B?WGUyNWt6dGhDS1d2UGxpdW5oSnpWTWw2Y1orWGszYjlTdWZHdExPOFVuYVY1?=
 =?utf-8?B?aVVWS2FRMFVYWE4xbXN4U09MMDVJN3MzTzRuZFl5Y2xWdjNwWnNqM052TTUr?=
 =?utf-8?B?T2EyU013REthTGFuai9BMUFpbVUyS2IwUUg0T0VpdGp3RjlMK2dRSU8xUFRo?=
 =?utf-8?B?YWtkTU1DTXhiaHdxYUpKbSt0dVpxYTFSdGIrVmU1V1BBUmxJZmlLUWt6a3E2?=
 =?utf-8?B?YzhBeUVOWWplU0lwdzFQWVZidzFNVjRXTnpzZHJXT2JwZTRmWCtRVzhnM3hx?=
 =?utf-8?B?NFVTaXVjMlJHNVpHaEdPbk43OTNveFUxK3h5WnF1REdMUHAvMzN2L055OHBj?=
 =?utf-8?B?eHFPVFZLUHA1U1dTemFvWVB0cVUyRDRWYjF5UlVNSVBleVJEcnBDRFg3YmxH?=
 =?utf-8?B?NTB3TFVGQWQzaHlndk9LdGhXSzBzcjNIQ2FyWmQvb29OVVNIakZ0dHlEMytw?=
 =?utf-8?B?ZWQrRHFmT042TkJVWHFoWktOSFVmOXhtN0hudXFhMkVoWXJnbzc4UStiZ2M4?=
 =?utf-8?B?RmU2azgzZXFxWHdmTURtaDdjZXVkb1pTSEQ1NXlQbzYvYzVVMFlBV3BQWWg4?=
 =?utf-8?B?SUxrblIzdTVmNUFQQlhhcnF6dEc0eUZ2dnl4T3BMaFJFc3YyeVpySlZ6OEhH?=
 =?utf-8?B?MXFEUVRVdjRpY2phNkV3UFcxMUZnY1NNM3RyblBMaTZpYnpGT2ZYb3VqWjJZ?=
 =?utf-8?B?ZVUzTDNxWGxsZU1mRG1oVjVjNlhJZVFkZCtnVC9ycXhnNzVPU2Nyd1owYjVZ?=
 =?utf-8?B?RlAyZUc2M2sxYjdBMGpLMXVWeVAvQm5nWDljR2kzOGxVWGFlaVVia0huNlRh?=
 =?utf-8?B?cG8xMWlPZzhLekJNSjA3cktTK2E0U29yRDFjVGlkbEt6dUM5bGg2Z2RxK1RR?=
 =?utf-8?B?VTZ0U3ZtTzlzVmoxVjg5V1FQUHNXbUlNL21XSnZoYmNFeWdwT0NKYlVsalFy?=
 =?utf-8?B?Wldlb1ZuczQxVXBIRndRMlp2azVKNGJKR29LZ1g4VnpWS2ZmYm1Cb2FtdmNC?=
 =?utf-8?B?Z3Y5b3ZJWk44Sk82NnlRZDY5eEw1MDZDVFp2YmlYLzdzOUFIMEh0ZGQraEE3?=
 =?utf-8?B?UjNtRDNtdGdCMlV5OVR2UkJXM3dxOThHUGlKNkprT2I3RHFMT2xUUlNObTJJ?=
 =?utf-8?B?L1R3N0xSODF6WUVpd1ZySlRzTXJ1REFrcEhWODRKOVZJczUveHlGbW5ZdTRJ?=
 =?utf-8?B?T3h5SitBMWxLMmxBWnFJbVhReDNWNVk5d0VUMGVzK1hWN0hKMlVZL2RrYngy?=
 =?utf-8?B?ZU94WllFUFZ1WnlkY0NiNXpCRzZ2TXlVQ2g3aGljUng4TEdyVE5HWnRMbVEz?=
 =?utf-8?B?M2I5a2VjSVgrek5LaUJyVXZlR3YrVFE4c1kxUVZPNzlGSzkwMCtFOTU4eS90?=
 =?utf-8?B?NnROY254Tzk2Skg2ZEpLSnZWYUpOSEY0b25XUlZacmphOGxLUUJ0YlB5TXBM?=
 =?utf-8?B?KytLTTV2K1JlSkZ5SXVLQW5RVXZENFMwNFVpQ21IcWpKT3R0QzArUUdyV2Y4?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77edc540-06d7-4524-8e45-08dbe6bc1f5c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 15:53:05.8764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aulzYDn7nPgQFAR3X6MK4UEGpCFoYGPr3X8z+Ky72QmljSxOFHHTweeVZm5AALvsuIXgOZRT2EYbH6aSzqyd7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe/mmio=3A_Make_xe=5Fmmio=5Fwait32=28=29_aware_of_interr?=
 =?utf-8?q?upts_=28rev4=29?=
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Patchwork (2023-11-16 12:42:35-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe/mmio: Make xe_mmio_wait32() aware of interrupts (rev4)
>URL   : https://patchwork.freedesktop.org/series/126428/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>=3D=3D=3D Applying kernel patches on branch 'drm-xe-next' with base: =3D=
=3D=3D
>Base commit: 33775eb43 drm/xe/guc: Promote guc_to_gt/xe helpers to .h
>=3D=3D=3D git am output follows =3D=3D=3D
>Applying: drm/xe/mmio: Move xe_mmio_wait32() to xe_mmio.c
>Applying: drm/xe/mmio: Make xe_mmio_wait32() aware of interrupts

Not sure what went wrong here. I just tested and I was able to apply the se=
ries
successfully on top of 33775eb43.

--
Gustavo Sousa
