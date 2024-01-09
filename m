Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E86C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 14:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEB010E43F;
	Tue,  9 Jan 2024 14:55:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1295410E43F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 14:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704812126; x=1736348126;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eP7pOi0HGnxmquohCSLwht1lvT9qcDFSODKjvVoJaf4=;
 b=ElJAGcBjKxrm3W4Veh4VeC2X+DFttbxnUin5a8BdQMo7XYwFbDuCJ1V2
 tm/Ij1+Pa3DqM2oZhqLGuh925y3FU+AG3jM1cfHZFcqrFbeb8vcygPwJ7
 8KNVAhLAtbs2S3F8Pm+87YCpp2waoF1i+iL9Sadx7I/w5zuI9FOCuFZCo
 RjXdsrdZT5r1kYy0TR8UwxoDzwTLOeVE2SmnK/VM1fi6eG+4aoRBA34Oc
 3mxKMKfIvN4eLigi/HwElZ8bLU1y8YERfR0Pf/qPKXwlcFztEmrXE46HW
 t922JjpM7y9m69p8GMDVTnrS9rgb/333kYE48RCPBRqF6RIXF4ftg2VLy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5298291"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="5298291"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 06:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="758010727"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="758010727"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 06:55:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 06:55:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 06:55:25 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 06:55:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhaBrfl6Se1ASMqxZm3wZOlHNI1pWgiv2GEZiuX3aVQwoKFqg2vhaXgPSBVd9GSLsGGyVjaE4MKmO49gichVvKG+LO0Cx2/N02w/RG0DYDtiVEfbY8kuSnB1ri8TDZPxO9bC6Jmx6JJSnc9RjzmHGkxR3nxwaedKjhaAycJDR1cI0zdVVcMq/Z+To8kzgzDTpT/jOAMo/g/zVziwOkgF7SjFF27lvQork/a6D8JFgAmmylpvlHZ6wMVQxp4uiueRE2Qm36E9gQbQBvVekDtZbbLGsfeiw744mEv7a4h8ihgoKo+9GuhFI7knkp6njAgi4nLcV3w3d7FqDxszxaB0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdmLHDsl85qcv2tld8YHNE3Xd9GzRVGfH4ttbhufDV0=;
 b=GKYkSpxvOj1F+eujlls/BbdLGRRpGCg9hVE7CbQKALPdQtK29KzUd76fWwPvs1IRfxnxd8Nn66PdtzksqYEAwzWWTPR03bSZ7heguOyYKUmVOXZvADdWdnkanXNfneqSqFIeU8OIHW9Xi5QTsXeJ7VubajolxyGeQ074GvffnplWjGZCqXFbqdf1+R2kBbejnpgvO7XsUKDs2Z8jhxMENG3POyZ5jgDWCiksvqHzFvre5uWCHfzoSB1mo6jzr0NZ8Q9qTNogAWdiIO2qPVdV8HiE4vKTt/Qrn2tMveawRJzb6SsPomxFHEZPH/Bs6OEU5pZUg6DYbQtdeKKUfJhZ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6705.namprd11.prod.outlook.com (2603:10b6:510:1c4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 14:55:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 14:55:23 +0000
Date: Tue, 9 Jan 2024 08:55:20 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Annotate xe_ttm_stolen_mgr::mapping with
 __iomem
Message-ID: <jxxii4sqcxsmo5ary3ihanxzbrrr3i5jkwnllhoynsvf4q6ejq@ke4icmf4gnif>
References: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
 <20240109112405.108136-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240109112405.108136-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 2afbd53c-ddba-4189-9fd5-08dc112301aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vvlcFVrFeQCIYQw8jS+Ctks0DkJA0eAV/SYO103DmiWWqA0Dp7yY9lflic5yVfStHEvqYGwosfPKbMEJESeGX9INgO5mG+jkdBdlSLf/8Et91sNsm8Tp+C4BTE+pbha1cQZptuVNJ/8KGsnYQljQat9JprSl3MXjDhUYQauWK0s4n/NmYqmH+LB6Ea7SghOfV68vw8SY4oiAUK3iLibwX6ez9dCUjtpC3Xl5mAD6qQrR8whSxpEoK86Fm4rG01eIRTNEhlobQ6V9/I00ngiasy3nYcZT1OP+TNI+iQjBpv/1VHY5qTXhHsfQPATxuB1tuuGhyH9CbLPhjvlvpy6ZZhL3hB/yN0Nun9hEWY72lb0Y9x1hvqiVjojeSe3A9fuK7lyqbeVZhU28oWmxqfhP61JhPEBoolP3RFZMNmUDEeYJbRtis5KwNDXoJWvQwg+2Hs6Cu0YJeiYf4FQvA1ohyMeJdvJT5uHF+9YOZmDVtNbUK+aSMJ7wq6S6dF2LuPO1mEWwMMbfMw3CbFYYimux5jE7z2er6d56vu/4Hn7JY2k1p/L7e/yRgrtut+AMeaxk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(478600001)(6486002)(8676002)(8936002)(4326008)(66946007)(66476007)(66574015)(66556008)(6916009)(316002)(26005)(83380400001)(6512007)(9686003)(6506007)(5660300002)(2906002)(33716001)(41300700001)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?L+yjdBJjqZm3WhxyX4WjUNcA9RbNb6y2QBWDEnYNiJbvKoLFxLhhKCjOyr?=
 =?iso-8859-1?Q?/gJdi6JfzQej3c+Y0N0RyYhbL/HYg9D8Lm2B01EIqvJ50LP6zmq69cubHw?=
 =?iso-8859-1?Q?/a/uJZuK+kQTyT0FQ+LcoBuawdfSpSzhC4fRW1hYub1rfocCBdWDIpRDgv?=
 =?iso-8859-1?Q?vqfPEQSrwt94vt8kpZdUZYMvaVTkw+OD2AzlWDGLxfvE+blvaKHs83dEca?=
 =?iso-8859-1?Q?jYNtNa4YRVvJZPeUr4Gh4lxFX2pDy0jFkaRTBSypo+WiBHjBBIbvbmZQTJ?=
 =?iso-8859-1?Q?PyxDZwZP81tCEFBFNXCRJA+KunkEr6A0VrUo7ybkmC5SXYvl2ZZF8ASol5?=
 =?iso-8859-1?Q?SXcInxffTl36Cpzw/v9KIt/AfJfyM8xcoh47uiTC9GuUjh6ijb+EN2U13+?=
 =?iso-8859-1?Q?Bo+isZ+IZgs22rBET7mNL7jh5kiJtDd37/ojE7u8teitIsJp+QmWEaM/5K?=
 =?iso-8859-1?Q?ngxsSi11op9VJTMEFaOmAGKeK9kJOgd8Ij+GltA/u126kqZWDNxxaqSun1?=
 =?iso-8859-1?Q?pbfqrTOd6VaVyMG53m1MPIwNeLlC3N46+6jCaYYf/YT+9F5RioUK+K0YpX?=
 =?iso-8859-1?Q?2XsJD8t65BAcsY9LNrCK1CLIyf2deOjB+rtKDZPxn3UuDAQjF8atkz52N9?=
 =?iso-8859-1?Q?2z/F+bGvHdf2zWuNUYUY9DnpURdWJuH0NtkVu0uzCBkVgabotCczsNJU24?=
 =?iso-8859-1?Q?Wf08OS+LKrmN3tPWXrV6AGh4xl+XVywp3QYyAZzDBdp3kPR4zY/VdXujTO?=
 =?iso-8859-1?Q?gc2QDq6U90Ts9qYI/oRF4vDRZe8QyE/hvWKZ3WOmQsnkGb2riGfQylX4vc?=
 =?iso-8859-1?Q?3pNkioC+KO1QYNqjBb9JYJyCsiXBXXLvf6zA+UIuEmFoZ4pNOJLaZDf3Bj?=
 =?iso-8859-1?Q?8jH10xUk+zlVTW53082UqhPksC9GEFZzutG36ZWoq8q+ymKnwq27K7f4pf?=
 =?iso-8859-1?Q?E+Yw7yCB3uNdNHK6ufXiYKlsoCezjXWKBWH7WA7K1iz3O95U1kHNTY6aUm?=
 =?iso-8859-1?Q?Gtoq+oKRFmjeZL6ztpSrAr+G/baRamvB4D8WW1oKD9wN6aKBhQKea5Efrn?=
 =?iso-8859-1?Q?lawZQGSGpGg8nZYWwlC0f+QR5HlhjQSLH9ckOUI6a0E9Po+br2DVVk/sxZ?=
 =?iso-8859-1?Q?JnO5xigUrPiq7iLXDa2EpsRaR1DuTGTKx3T6V05SWF+8VLPCBvPkGCUx9R?=
 =?iso-8859-1?Q?9b2TGyV2YSLEfzs9SYiNIyWBq7mzKLepFF0eZIRpm+nB5+uLual3qLTpqb?=
 =?iso-8859-1?Q?3gr1bkZlGPRjsk1dx6DgYBFBkW1FHmRf3nBnniI7TXQ4ApjV2aa0saFeWv?=
 =?iso-8859-1?Q?v/EHem6R0uUzLidqIW/8JCZVnEgFDgsymbFI+5A2FgGekyo8gwZITeqj5f?=
 =?iso-8859-1?Q?CYPUzn+3g1VlxqAbE1/zgKPocfVGGAUY1CsztDLWtuM5155yaRTpgxGhv4?=
 =?iso-8859-1?Q?sv2PcbJxIGt3PJnxGRzhEEO/1mF5LaxIJ+TWaYigKt7lqiW6PiKFP/H/s3?=
 =?iso-8859-1?Q?4Tiht/i0Z7tXY/l9FAPnsA9shM4GmNy+WVP1VUPITa67nZTASYhZ8rBKPm?=
 =?iso-8859-1?Q?8h+oUTzuEe4HRIsKc190GJXgq7pVV5LveO486zIUATJgebvx0NsjfGGGtW?=
 =?iso-8859-1?Q?qSrCqOGMUnNvwJbxXXNCwL4iDeilksOAtuyl1S9kUj+llaHkSImTB0DQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afbd53c-ddba-4189-9fd5-08dc112301aa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 14:55:23.1449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OL/hXtRUFMpkzQ8qc9hOE08ffbrXKfS1jab+601y4NRGZkVm64Kp4XvrD4sNFxccPXmUjkAxauedVHPFYvyAaY0FxZYVKOGBiNBSE04nwzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 12:24:05PM +0100, Thomas Hellström wrote:
>The pointer points to IO memory, but the __iomem annotation was
>incorrectly placed. Annotate it correctly, update its usage accordingly
>and fix the corresponding sparse error.
>
>Fixes: d8b52a02cb40 ("drm/xe: Implement stolen memory.")
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>index d2b00d0bf1e2..e5d7d5e2bec1 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -31,7 +31,7 @@ struct xe_ttm_stolen_mgr {
> 	/* GPU base offset */
> 	resource_size_t stolen_base;
>
>-	void *__iomem mapping;
>+	void __iomem *mapping;
> };
>
> static inline struct xe_ttm_stolen_mgr *
>@@ -275,7 +275,7 @@ static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device *xe,
> 	drm_WARN_ON(&xe->drm, !(mem->placement & TTM_PL_FLAG_CONTIGUOUS));
>
> 	if (mem->placement & TTM_PL_FLAG_CONTIGUOUS && mgr->mapping)
>-		mem->bus.addr = (u8 *)mgr->mapping + mem->bus.offset;
>+		mem->bus.addr = (u8 __force *)mgr->mapping + mem->bus.offset;
>
> 	mem->bus.offset += mgr->io_base;
> 	mem->bus.is_iomem = true;
>-- 
>2.43.0
>
