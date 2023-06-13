Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4B5EB64D0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 14:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB2710E26A;
	Tue, 13 Jun 2023 14:17:27 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C3D10E3AF
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 14:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686665845; x=1718201845;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=KApht6RGDgXmTjxx66zHTknU6x+PFtmR/nYL/RBqy+s=;
 b=Zl0keoRCw2QTwUajIUtwfWOubj/9bahfA15rUltxKOpEDeSzjhkmaA/R
 lyNai47n33iWNyEYMjd3JqZmq5udGnPeSWoC3VsbVO94iW9QszVHcnTGb
 NJlSP4qQP02Kx7loHNg9Aj3hqejFWuGS0nVRdVh2dM3/f6h2Sq9gxTHMW
 EKPdnJfNUH7ITOa+5881lLnbebbbdg6vjPFY4igUisI9z3W5dYWeNXL9s
 PIriVnSg7gv+jLfVrwS2stmPUzftN5H8mPlI7AEVrH8eLY2oSYdz+UmbW
 UbsaqAgDKjTJHfBUCvu9lJ+30VD196h+HvRtduD/fU5gTebUrMuVrl6eu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="343032463"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="343032463"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 07:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="958420370"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="958420370"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2023 07:17:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 07:17:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 07:17:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 07:17:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 07:17:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0OYoDUEdeCn4DAXnYLW0bxLC8qp4rm/jO0KaMyAfV2oji+fjdLJwZG4W7mvLqAV8XzCEs7ucI7wtliadATAPxshVtJfNW9y06ukroXnIfeXoZIfvcg8KSWPUQPACRpXrW49cPPRNa6fzu/QbanYKdu08ZkSdY7wDBoeQ9O7ZPLCgh9AjxvBB5UhkdC291+EdygeOfaEzsD2U4U/TgeprQDX97ZKF43jOoa3QheKzJOD1wWaRUEOZQq+VOrZt8FfgMOdSGzeeQvOoE1QEGamLnOzG+ih9WGnffFiChyOX+LALt9gv02W/bSQd7PsSX5VgHQXH0CAOqYsDrFdWgYqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFV4dYguRIzX5AAsmhgwqbqbMNgtkS8gmJesMIW4mgI=;
 b=XaNOE+FSJNOr+k93ZKjnGi0Grm73a0IRNPeKLIIMTWYYVt6SifmKXtel68t4zL+m/zh+xHzvIRlx2Vp+uicyFNxuWyTYCvxc3q1mWNNiNh3B7TmJsiGs6eEINangO8VEW6dHjRMJOFANHW3zsxN6NVEJPTpQV/TbzJZjbfsmHzX568wmOY3TRYTl31bfvdJfWR0O7VwManGUEBoF7eZyFXfdZF1r1nJLt3I5tSGNumvTEOd1pFjKzazrHPRoVUsQLVI9Y9nzs5RGyNyJR4bfOcxjaUF8BlPsqYeDBUiW+LbGwlDia/7sXVuakfHWMvxbyL8lmu6t+a2K8AwafDO7yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3567.namprd11.prod.outlook.com (2603:10b6:208:ed::31)
 by SA3PR11MB8002.namprd11.prod.outlook.com (2603:10b6:806:2f6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 14:17:20 +0000
Received: from MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::8723:ca8a:452f:6e4e]) by MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::8723:ca8a:452f:6e4e%5]) with mapi id 15.20.6455.030; Tue, 13 Jun 2023
 14:17:20 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230611222447.2837573-5-lucas.demarchi@intel.com>
References: <20230611222447.2837573-1-lucas.demarchi@intel.com>
 <20230611222447.2837573-5-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Tue, 13 Jun 2023 11:17:15 -0300
Message-ID: <168666583592.20985.15456589620134344075@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:180::23) To MN2PR11MB3567.namprd11.prod.outlook.com
 (2603:10b6:208:ed::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3567:EE_|SA3PR11MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c238aa-82b9-4204-f3ac-08db6c18e630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UD++nG62EevdH4nZG1jciUKzKDTZUGBp9uLrIjxTnREei8YJSkx4Go/Ra8C5cZli0ExgKyTGzqaXf8eVdB825ag/UaQ6zUvwGz6nO14q+c+GMEMB8bHI/D6lkQkWeP6EZcH1zfs7+OZPdcXn6h1IComfVW1hWy/10tidc+jdA/amYl1+mU4e/X6rKP1wEB2ML5/qXXeh4ZaRnCn3IAfNipd9B3TwlsRSKW4bZwRSPPZBA29SnxdGA2eLZ1nRRMSgcXs0NbshAIkcSne0P7ozC9AnvOqJeFkwqGnQ1goNX25SSb4DJ5z2UgRcf9rTtBXiZD28iRZEbV3OeGNwOn23SoVv67W8rM+AEOo2/0AU3GCAD+2VZON69+4Repy07GQB1iZm38pLI4nJaD2kx26v7JEMd2jp49DhNdpqeitLxmnHyWU1I0MweolHmeNFiGPGAXvUk81mXkGzj5ztZHpmO1U+qYfcoF0bhFY+ccfUbJYQNC9qzivZGMwUFuGy9/BLGcLPrC6Ijv7iRhlWlMqv1EW+FXM1GihWREg4HP9f5nGE81q4lKyj3NNM+yX4bgPs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB3567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(4326008)(66946007)(66476007)(66556008)(186003)(478600001)(2906002)(33716001)(8676002)(41300700001)(86362001)(107886003)(6486002)(316002)(6666004)(6506007)(9686003)(44832011)(8936002)(83380400001)(82960400001)(5660300002)(26005)(38100700002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0l2YkJGS1RrYnVBY3VYSndMaVZpTUZkOFVCNDNYakMvTW1oNXg0TzE4U1Fv?=
 =?utf-8?B?MlM5T3lkMkh1MTlUL0FhRGdHZmY4VThNY3BVN1F3c2dKODl0OTljcncvdUNu?=
 =?utf-8?B?R0ZBdS84bzRzTUhBZ3M2ckZiOG9icjAzL3FuakZhQ1ZHS1BjeG9OeVZiS1Zs?=
 =?utf-8?B?eUExZjlSdEp4TlpEL0lGVXdqdU1xUjIwcmd2SWhRMjRRMXhFcU8vVjRXZHQ5?=
 =?utf-8?B?eVJZeHdDZXU1aVYxV1BmczJvRktJOGhTcjdOQW4rQTk1eWFKbUFxckJ1cEVp?=
 =?utf-8?B?Qld4dEJZdEh5bDl4djFmM04zV2gyWmpkNVZYTUFibHVTSWtZSm9IZTVTZlF3?=
 =?utf-8?B?MGVGUE0xZ2tRN3FOVjZuK1BOWk0xWU5qYVVBa29wK0gwcVhTUUtFRnowQ1Qy?=
 =?utf-8?B?OFFoNG4zd0x1ZXJzbTRzQU5LMGprTGFvWUVJeGJqNlZ0VjdOcHBybDFQR20y?=
 =?utf-8?B?WkhHY1lnS2t0eDluSnF3L293WWxXaVpQODJKTU1xSE8xby80SkZURjNsQXcw?=
 =?utf-8?B?UFFJTlI0ZVRyU1NEdEgvN3E3K1doa0svZENWUlhPVGQwWE4xclF5ZW1lazRS?=
 =?utf-8?B?bGtMSSs1Tkh3KzJad0FTOGZMOEtFQUVhWHpRWlRQWHVFOTdJL211bWdZdWFo?=
 =?utf-8?B?NlI3eTRlM0E0OGdSV1VTVEJVc0E5aDZaVWJWSHFEL1ZCYlV5M2ltL0ZtVTJX?=
 =?utf-8?B?UGN2dnJYaDdsWHFHUTdwYmdGK1BPWWMxR2xkbTZpS3lwd1VlY2lqS3Y1OHg0?=
 =?utf-8?B?K1VNYUZYYWQzdWhIOWdPLzQrUTVyVlk2b054bHZHNE9Na29vVjVYZjY1NkpU?=
 =?utf-8?B?WXJBQzYvTWhWcndJczE0VExETjJmQkR1eGRMTHoyWFhuVXl6MGJpWnFFNlMy?=
 =?utf-8?B?eFRFT1ZTWDNWbHhUSlQ1ZG9qK2s0aEJhUnoxOWVRSG1YbEpJUW1Na3oxaFY0?=
 =?utf-8?B?clhFTFg3ZDB0TXkxUmdmSW1kQTVmYWRhMkRKSWI5clVmQmFsNFQ3OFBBNzYx?=
 =?utf-8?B?MGJhQzJVNklRaFNJL2lBWjZEYlFqalpxV1dFZTNOVGxXU0t1a3h3U3dnNWFt?=
 =?utf-8?B?YXFvSFMrTERjYWw3Rll6MkY1cGx6VUZxeEQ1RWNEams3N1ZsQURoOEZOYWlu?=
 =?utf-8?B?cjhhbU5HYlZFQkxLOTQ5cDdRR25kMnNjcmpNVkRyZ0Q4cno5VXp3NUlXVFVo?=
 =?utf-8?B?YjRyT2I0VHdvdTFVanQrdWZRMzJpK2pENXVtU1JMcFFVcTh3VHl3ZzBLTmVS?=
 =?utf-8?B?VDFNb1BQOE14T3ZwSStnQks0TzZJWFgwUnJrUjZ0NnFyTmVjZWIzUG9TUElF?=
 =?utf-8?B?UkJLUytIa3lWeWN5aFJ4em1xSjM5MmJkRDFTT2xaM1JGWUJRazZIRGFZcnBV?=
 =?utf-8?B?M0lkdnRKaDlyTncrMjgzakw1RTlLNXhnMUZkdmZxQUpGc0lpaXlCaGxKMkpK?=
 =?utf-8?B?T1RkRDNZb3p1c0hMWHh5NDYvS0JvR0ZBNlc3Zm5YMkxvdDlvL1ZrSzY4QnRP?=
 =?utf-8?B?L0p0V0RhZ0lqTXdMV29pKzhFSjdyN0tuNlcrZU5pM2w0VUM4UWgydlVoMm93?=
 =?utf-8?B?STAxS0NBNmp1RnVZT0Q0RHdZcDFVaU1OV0tJdUFpR2VHNCtmZGFyRmdBcWFI?=
 =?utf-8?B?T0JFR0JDSXNhWGhhQ3NRMVhmeHJPVUU0d3NtOGhuV2VITmhNMGlDbDFxV0c4?=
 =?utf-8?B?eW9ZRlVVdDhnR09acE05VERUdEl0NmNlTHRVTVFiWEZwbXpxdUdCRUxxYXFj?=
 =?utf-8?B?WWg4c0NTUUhGMVNqR3pnN1hmS3hRNE1EMGNXTmMwVVBSWnBkUUJQUnVUaCt0?=
 =?utf-8?B?MVJtc3RWYkkzaStBaldIQ2l2TkdMVzRpR1ZrTXNIdThJT25JNjRiQUVyUS9D?=
 =?utf-8?B?L2F6YTFHcWlMS3R3TmdUcGVyenJnNnRGRWVHL1g2QjRGczdkcWU1OWIvOXVK?=
 =?utf-8?B?elVqY3FOMlRIK1huQ3l0RWlLbDVuWHJDK3NzS0M0dzUwZERoZTd1N3lpOXVi?=
 =?utf-8?B?aHJ1aDRWb202TnRGMGdJZnBGNnB5RzRjQU8wbUUvUE1vU214NkpySXhtbDRB?=
 =?utf-8?B?eVJDandoVUJNUjlJSnF3QXB4d0JRMHJLdWV6eFluY3Q0WXNTOXlNdk9pSlov?=
 =?utf-8?B?R2FOZHVvaHpEd2g5WFYrR1czaVlMbTJXV1djYU5jMnJvZ3lLNk1sVEFqWjVX?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c238aa-82b9-4204-f3ac-08db6c18e630
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:17:20.2074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKfAnX/54RSS1GAiCAr9lY2eSDgttfV0f6UNlzXlQY98e6tVrK63q1kZ2ofL1+hblhqMqvcOvqd34qXGPYxKSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8002
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/5] drm/xe: Fix GMD_ID to revid
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-06-11 19:24:47-03:00)
>In order to calculate revid, let peek_gmdid() return the raw value of
>the register, then calculate arch, release and rev. Also rename the
>variables to make clear what are the assigned values.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Since we are touching this, we could as well rename GMD_ID_REVID to
GMD_ID_REVID_MASK just for consistency.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_pci.c       | 29 ++++++++++++++++-------------
> drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
> 2 files changed, 17 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index bd1f59b49928..06d9d21c7cd3 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -407,8 +407,7 @@ static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_=
offset)
>         ver =3D ioread32(map);
>         pci_iounmap(pdev, map);
>=20
>-        return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
>-                REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
>+        return ver;
> }
>=20
> /*
>@@ -442,13 +441,15 @@ static void handle_gmdid(struct xe_device *xe,
>                          u32 *graphics_revid,
>                          u32 *media_revid)
> {
>-        u32 ver;
>+        u32 verx100, gmdid;
>=20
>-        ver =3D peek_gmdid(xe, GMD_ID.addr);
>-        *graphics_revid =3D REG_FIELD_GET(GMD_ID_REVID, ver);
>+        gmdid =3D peek_gmdid(xe, GMD_ID.addr);
>+        verx100 =3D REG_FIELD_GET(GMD_ID_ARCH_MASK, gmdid) * 100 +
>+                  REG_FIELD_GET(GMD_ID_RELEASE_MASK, gmdid);
>+        *graphics_revid =3D REG_FIELD_GET(GMD_ID_REVID, gmdid);
>         for (int i =3D 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>-                if (ver =3D=3D graphics_ip_map[i].ver) {
>-                        xe->info.graphics_verx100 =3D ver;
>+                if (verx100 =3D=3D graphics_ip_map[i].verx100) {
>+                        xe->info.graphics_verx100 =3D verx100;
>                         *graphics =3D graphics_ip_map[i].ip;
>=20
>                         break;
>@@ -457,14 +458,16 @@ static void handle_gmdid(struct xe_device *xe,
>=20
>         if (!xe->info.graphics_verx100) {
>                 drm_err(&xe->drm, "Hardware reports unknown graphics vers=
ion %u.%02u\n",
>-                        ver / 100, ver % 100);
>+                        verx100 / 100, verx100 % 100);
>         }
>=20
>-        ver =3D peek_gmdid(xe, GMD_ID.addr + 0x380000);
>-        *media_revid =3D REG_FIELD_GET(GMD_ID_REVID, ver);
>+        gmdid =3D peek_gmdid(xe, GMD_ID.addr + 0x380000);
>+        verx100 =3D REG_FIELD_GET(GMD_ID_ARCH_MASK, gmdid) * 100 +
>+                  REG_FIELD_GET(GMD_ID_RELEASE_MASK, gmdid);
>+        *media_revid =3D REG_FIELD_GET(GMD_ID_REVID, gmdid);
>         for (int i =3D 0; i < ARRAY_SIZE(media_ip_map); i++) {
>-                if (ver =3D=3D media_ip_map[i].ver) {
>-                        xe->info.media_verx100 =3D ver;
>+                if (verx100 =3D=3D media_ip_map[i].verx100) {
>+                        xe->info.media_verx100 =3D verx100;
>                         *media =3D media_ip_map[i].ip;
>=20
>                         break;
>@@ -473,7 +476,7 @@ static void handle_gmdid(struct xe_device *xe,
>=20
>         if (!xe->info.media_verx100) {
>                 drm_err(&xe->drm, "Hardware reports unknown media version=
 %u.%02u\n",
>-                        ver / 100, ver % 100);
>+                        verx100 / 100, verx100 % 100);
>         }
> }
>=20
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci=
_types.h
>index ba31b933eb8e..70858836cc5b 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -37,7 +37,7 @@ struct xe_media_desc {
> };
>=20
> struct gmdid_map {
>-        unsigned int ver;
>+        unsigned int verx100;
>         const void *ip;
> };
>=20
>--=20
>2.40.1
>
