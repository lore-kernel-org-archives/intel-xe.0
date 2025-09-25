Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C7FCAC5A5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 02:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5788F10E825;
	Thu, 25 Sep 2025 02:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wm786d+T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4A910E825
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 02:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758768086; x=1790304086;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MSmxNzkRWOvI2liNFYQH95buhBM2GUAu25QWbOYbZmE=;
 b=Wm786d+Tmy706kf7IJvNenvKvX6Z6Q0MNJvIgFWPNeKmieffcsWws5eY
 M0Aa95rCL6e9Ln9jKoN0eRDzjvGCe7pYdb+jROgg1IsAXUXNN+e2KLy4P
 n72OMoATLWzUZyeWWxHDn2EIC/l+MyOOj2njumpP6SE6C6K8CmhQUyGnk
 xlifcnXS6Z3Ws0MG360OHH/zd9H6+D2/gDHYWvqiaX5+iiJbNrxAZzeNa
 B5AchpQ0a9YmMeGT/P+vhXv1YRu/WSwEoN7Ch1tkNLS3XMAtkyGYQvZSB
 7AGILlCqgM303IUGddEunDHkh6Y0f/4WuAlaVnJ8fooK1IAMFsHFahx2c w==;
X-CSE-ConnectionGUID: Zf7py/5gT2S9LVZPmaHwUQ==
X-CSE-MsgGUID: BfNSj6wgS6Cv9wxvJIQ9mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61185258"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="61185258"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 19:41:25 -0700
X-CSE-ConnectionGUID: PuRvWZjQRKSk8Rkndk1t1A==
X-CSE-MsgGUID: KBSaysNOTdO1Qjt3cmYcKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="214336983"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 19:41:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 19:41:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 19:41:23 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 19:41:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEkDZAJqKYkCeS3g/xcEkJF8B0qXTqE7XLLs47EqUvslYcg0HwHJ1klqctVU8KR0ubQoAbxYr11jzK6OeSgZ0a+prDe9aKjAXZgBruEBNiEZwaHhGLpE6+CImfPL+Qoe5/gNxUNYWTufVYpdXbpXe3t5pEsxZBQ7BYu5HYoDF1Gxd5w7krWPk3/gDCqHvh1ZWTcGbFNzrZJr0sLgXEOa2eThNF4LeCjvjbdTea+muJfD8EgT3Jfmh+Nr3Xeg4+pIylW8o0nDjcT6s15uxsVBG6aEZgH9fZVetOeK0uJS2eM1wQUvb2cweHc0xjgef+4eAzWpzuwcx5Iq+Bh60Ianrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ3CGZMddblXB4zPp9rOShaeS7V/P///wOIuolaUeQY=;
 b=sqmkw1lPJolJSCBSbpyk5S/nvesd7cqN7wXP1+rdhEl9Tg4+3YLcY1Lxm+FFyEcnfHzRvHipxVM6LKYKWbR+NvLF129TJwL+ZGG3YeR3iSyS3TMUNsStqmvpZYDnGZNgrLpPAVNgNGFyvIEnnrhiam8RVqdAu5mWRZc3qfpDiBU5tWKfJQb7lcu9OBAKl8NOnjcsv9TbLjUiRHHGwVCwQr3fkvmyz489Hb2O4OY8jYcZO4RYUBDa52AEZ9nfjeNEd66yE7DCs5nidJ3GcNJnvCLZ3kuV0FbbXwX03Ltkhqz1y28zYIWT2K2u+n5AFp/j3kUEl011hK0fMnrSH6TSIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM3PPF63A6024A9.namprd11.prod.outlook.com (2603:10b6:f:fc00::f27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Thu, 25 Sep
 2025 02:41:20 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 02:41:20 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/pcode: Allow min_gt_freq equal to max_gt_freq
Thread-Topic: [PATCH] drm/xe/pcode: Allow min_gt_freq equal to max_gt_freq
Thread-Index: AQHcJAr5mnppZ7LwbEu0hwzrLf6zB7SjQhoA
Date: Thu, 25 Sep 2025 02:41:20 +0000
Message-ID: <DM4PR11MB5456C37D5516F4889B275855EA1FA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250912172813.1631529-2-shuicheng.lin@intel.com>
In-Reply-To: <20250912172813.1631529-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM3PPF63A6024A9:EE_
x-ms-office365-filtering-correlation-id: b86be4e0-16a5-47aa-f2c5-08ddfbdd0259
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GyhQl2PrfmnV/4jg3EcbF5qX3gyRFXOkrGpEXxSrcdBtRT0sMXbEId3n+y67?=
 =?us-ascii?Q?ykrkg9TzbYzq50cezdVZGKLDPesE4E44S7Dgnpwxknqf72p5roOiJNYTb9Pu?=
 =?us-ascii?Q?wPssuq/uvkK9krh/T626v0otYR6LXwSBXKc7aWaQ+5CFAasS+X38Gyqx7GI/?=
 =?us-ascii?Q?KJ+iPziCpJ5QOd0F0o9L+BP+M88D/ZarMugfoXkxQyqc/7SZPAokzKBdKSPI?=
 =?us-ascii?Q?SOqgo0IIU4n8pfktliTx8k9BaJht8RJjAFBQm6nHY2Cy7hkYn2nfcnIEBXlv?=
 =?us-ascii?Q?bRljxkQQ1lW3UX8QDq+B3W6/6J0kGwvNJO0vLix01qZZprtEhNDUt3SHAvCq?=
 =?us-ascii?Q?e8OKC4Sqcf4GX8H4w/WghVBLVWlwHz9XN9sERhKEoZAihTBgFETxPjr5Miq2?=
 =?us-ascii?Q?zCybgChBKyziyi8kzPvJhNUVLhGpj+aGj/e/j/PtS5f6tITl/0FiPLoMc+N6?=
 =?us-ascii?Q?zsPv75e3ML6c6Y2tZ234y04nBrMBII/T6H4eCABJGicjX/mqVGCGi4W8VGDH?=
 =?us-ascii?Q?MNhC80uYizHFjFkR94XIzY3iHvc5UE8X+KzPZPS8TSJYvwjdMSpkt3cX8uxb?=
 =?us-ascii?Q?1X2iFHG8y35HW5CjTDdnTLizLPPR8L2ApX+w4wNUjKBvg68hnzE4xszakm/9?=
 =?us-ascii?Q?/TvZOMyCehslSvHPFiWsD633QhxyYanVNI+E+eUAC8o/6u689V/ojTNAMHEP?=
 =?us-ascii?Q?hgleTBLK2+ih9nFMN/7asbGtRj+ctRpyrA+muV9jnAWmaJ3vgEuyKlVkhmrV?=
 =?us-ascii?Q?a1uepXj8WKDJC0C1+tZvoYlPu2GCg9ZCpzXBjKVv20GuyrHt+O0RAVWAt7lk?=
 =?us-ascii?Q?WxLbU+0zlqIT2BVydLe2uumChjnt1gz5dDiY7xZUWh5aprZYsdNikQvOml9w?=
 =?us-ascii?Q?SefoWfWp5MHncefqvqj+soR2X7N9j0SLIZhN1PivOgSkSnQQ+/3GiJjkjLUB?=
 =?us-ascii?Q?9jzUVsH1CBs2BW2x5JqtHVG8392Hkva6I53QjB4h5lacDOzy8DuxU9qEUqXh?=
 =?us-ascii?Q?VlcxNZcnaAAz1KuaXETNR6WFFUOhYyQ4sg67fX677bGIAbark/n/0LMD6QLB?=
 =?us-ascii?Q?d72rKMtgzovhhq29z0KCEyC+asKOiC2Sc1fcevjOt4d2V7BeaMe6bl2+JkAB?=
 =?us-ascii?Q?qwL3B5xGd1KCSUX59veUKZ3/2MOV7zb2A3Rx0vzRDTUiqdNMuS4YC/yA99t/?=
 =?us-ascii?Q?zXMXcq+Tl4qaaVFSEZ6F6OzjQh8wfU1tNRs/5zpiX6FZf18Kv73CMzfkwYME?=
 =?us-ascii?Q?oJGT61NAeminWhvqxublDNaXtYCCP/4u+EcbPpVvartM5ddZERDx+o6fzHcj?=
 =?us-ascii?Q?7NLCFIIYN/BktKlnY9U4yHQBLgThOFSnq8s09RD950JQeMmF+S599X5cbMO9?=
 =?us-ascii?Q?7vRgl/I3EjRcwCo4rn7AwFlNFnSD1VsgU0qQR9Dr0Z8Yu/sahFCX0TK9EfR3?=
 =?us-ascii?Q?YwfLFD04YcCceiqcZY24FKr9+lh2lc2/hjQATBpvVQWBsdgBaJSKdL3WV7Ct?=
 =?us-ascii?Q?ETEI+iSr/E1FWuKSqGCg/WoowQ+dFRmG60u/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JjA7Xc+d0zW/klXvzFEcVi2Fm3BF6TfNICtT0WmfDuiwcjTugYTjOGtqLK1b?=
 =?us-ascii?Q?IHc6/piaqb9kV2cXQMnOg0MpKoW6p95iEO59tSQMXucELCqbu4PQIg3nsW+n?=
 =?us-ascii?Q?aTxYUEQ478hZ11kgdOFsXT2XQVbO2an/M/KWNo+VehzcFat4EWbXojvsQJXx?=
 =?us-ascii?Q?6Fne0HLtFranQA0jhecB8gw6ghzGYDhGWmA62J6VcjyHGcLDJR+GgVp5eZRS?=
 =?us-ascii?Q?gPyXZ377q8n1oCzE4LE82EsO9WFyeuIRaCJ9FxS+ATkGTWJLzYzFRVajRR/I?=
 =?us-ascii?Q?Nf4n2YIdWr0rFvgqe6NNy1CUdPx9EqwLvwlla/FL0B6uVxf+WayHkP0Md9Rp?=
 =?us-ascii?Q?7N0VIxjh/HeUJjOapwzLxuEfGSaXSdf4kETRs5FQ6KRW+pbVrbu30wPDOqft?=
 =?us-ascii?Q?DZtmlIxpzXI/f38hWe3cJyNTBkq+ZsYaLGRTKFoSIdU55kB/2/lqSdLiPhkT?=
 =?us-ascii?Q?gDmzVG5fjiA4gp2ZQgosmwGB0zVBmvqsr1aO+eTKHncgUZIDAXnFDLqWZtlI?=
 =?us-ascii?Q?iYNX5QGhDjlxqzKDSMtMbYF6ULAAG1OYPWBvvkU9Y2FMlb1SH/wvg/TbYTXz?=
 =?us-ascii?Q?vHX9sRxYgz+TwoYJAVqisVVvWXhnJAiunwucbKpLOXz6rWWfTyyzu/4HtLFh?=
 =?us-ascii?Q?TMvB/JZwX5aCHwk3DUJTmwrl91LNNMVLuWO+zYPCWtgQ2vfADBx2z+gdEOQf?=
 =?us-ascii?Q?A3ooqiyRlm4JsMByXi/UKD5hYqUjxScCUDOF+RGkPnDNWDCj4ZTUHY/YelGW?=
 =?us-ascii?Q?ZlItlPjJk7ME0MR8egsPvy1nY6vIWhkqeVmJ6PoLVJmKjMWsowzYgyR03Kmt?=
 =?us-ascii?Q?zkom2/feo5AfiVr6soDaHmjgXqkzuG9Bo8lAdD8oVQwsMtmXhMTtMtFVJ5AW?=
 =?us-ascii?Q?IUkCGmWIVrd3Gk5VQJIH74F/qhoRldG/+DpubOT6D0s4huRVb+4nsH/xDAJ2?=
 =?us-ascii?Q?3NPTxu8nacTixIN0ka1nzo3o4+eAHjOow8luToRAi7QNjMuQZrwpxAMpVbpG?=
 =?us-ascii?Q?rRF5052Dc4MiHQN0HDswMekSMe4gQ2VU9NOxLFBMwTwOEscR+CDi0GvPNzFu?=
 =?us-ascii?Q?rO0dhQ2LFD8qPUN9DlvEqZFi+dfcNYt9lqEqtCygNtP0UJkffq0T4a9K5WR9?=
 =?us-ascii?Q?vhbESAVwmcI4vXx1PpM/F4iILuT9OspNjZ8ZAJ+Y6/68uWC1w3sA7g3nANuD?=
 =?us-ascii?Q?+3u/xYIWpF6DQ32X9SPFmqa27Szn7apXEXBOgmBemjg2kge8fYSDAcL8LwMD?=
 =?us-ascii?Q?2HFb8JUATP6xqPFf5rLVmPCSyf/lpk0UNosWEeF8RE+g3wF37Map1B1HClqY?=
 =?us-ascii?Q?2CBxHNboZZI2TA9xer8RmVOZvLxK0B01gIk1y9jeUhleLx7mKQzzaZgxy/zU?=
 =?us-ascii?Q?W4C5xfWcaatuxvUdQXzjWc6aGZHa2QdjNv+uBtwMjtAOX3oI5YcAyLUhE0Ob?=
 =?us-ascii?Q?6LAHBRCRNl2+edVXsTbIzZ5GJHdMv4reTUxrfWMyv72UnTwxh6eXm1DV8CkV?=
 =?us-ascii?Q?aDc8oGBTapP0Np627bVzEoRWQvpWaYKEhXE8cVVM61PS69Nk6q3wTBH5BrlR?=
 =?us-ascii?Q?H4F8WnFgusiHTT6OCTS53HVYQbWxGRKriBQ+HgyF8U1f/XT6grS7jEQi7sQ/?=
 =?us-ascii?Q?a8pRIAoZdhna10LA33C0c3Ue+JZZMxWggFoM9DkZLPY5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86be4e0-16a5-47aa-f2c5-08ddfbdd0259
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 02:41:20.1910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMZ2r+8Orkc/qeNG1FYPvMFWkZqXswvyX9yrtXA3YVV1uVpEE+SPzPbVE34R3p31GoaYO3czriY4sDiyG6GwLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF63A6024A9
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

Hi all,
Could you please help me review it? Thanks in advance.
There are 2 changes in the patch:
1. Correct the comments.
2. Allow min_gt_freq =3D=3D max_gt_freq.=20
    I don't find the spec for it. I think the equal should be reasonable, a=
nd I tested the equal with BMG, there is no error reported.

Best Regards
Shuicheng=20

On Fri, Sep 12, 2025 10:28 AM Shuicheng Lin wrote:
> Allow min_gt_freq =3D=3D max_gt_freq.
> Update the comment to match the code logic.
> Add a blank line to satisfy checkpatch.
>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.=
c
> index 6a7ddb9005f9..ac09b4c8c5cd 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -214,6 +214,7 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox,
> u32 request,
>  	mutex_unlock(&tile->pcode.lock);
>  	return status ? status : ret;
>  }
> +
>  /**
>   * xe_pcode_init_min_freq_table - Initialize PCODE's QOS frequency table
>   * @tile: tile instance
> @@ -227,8 +228,8 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox,
> u32 request,
>   * 1-1 Ring vs GT frequency. Even though, without setting it, PCODE migh=
t
>   * not take the right decisions for some memory frequencies and affect
> latency.
>   *
> - * It returns 0 on success, and -ERROR number on failure, -EINVAL if max
> - * frequency is higher then the minimal, and other errors directly trans=
lated
> + * It returns 0 on success, and -ERROR number on failure, -EINVAL if
> + minimal
> + * frequency is higher than the maximal, and other errors directly
> + translated
>   * from the PCODE Error returns:
>   * - -ENXIO: "Illegal Command"
>   * - -ETIMEDOUT: "Timed out"
> @@ -248,7 +249,7 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile=
,
> u32 min_gt_freq,
>  	if (!tile_to_xe(tile)->info.has_llc)
>  		return 0;
>=20
> -	if (max_gt_freq <=3D min_gt_freq)
> +	if (max_gt_freq < min_gt_freq)
>  		return -EINVAL;
>=20
>  	mutex_lock(&tile->pcode.lock);
> --
> 2.49.0

