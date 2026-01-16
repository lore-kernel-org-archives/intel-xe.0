Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F230D4A5E4
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 01:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B433E10E10F;
	Fri, 16 Jan 2026 01:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9R1LrSo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D8010E10F
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 01:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768528369; x=1800064369;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1DvmtCaYMHe9f/8rl9mVKpVvU7NGpkkGEmsaq4/ikUM=;
 b=G9R1LrSoTvEG70V1hY3jwdmZQCCiWKWyjGqXZdVJNsP5Ah9qPQ75z+5A
 Sx5W9PtcTWytfD1AWt5Gfggnq8v6QEdiRJorLv+9wLH/sMUmaPqWCVxQp
 l8TkH768wjU/z/BH71wGYMB4Ki7oQtumx+QDeBC7QMn7EID9xW2sZpzBP
 cJsBDjpJXjf9jl4DVAkBqk3/t1W39QL40olX/ra/ejRvqOLi/jS9EnXmZ
 KrKT/aeEOsb2lrZMuI8YrplcWhbHPt1XhSW5XZVWNz1k3VJMhYIIn+6KC
 R8vWKAMQEoaX+tD1o8PNCpTYgHBXceIxbRZWQUmBNjPduI5qe+ol9cbM+ Q==;
X-CSE-ConnectionGUID: kd/eizLdRim+RSeh+0iYoA==
X-CSE-MsgGUID: PgiVqhEHSFyllUXRTXUr8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73689343"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="73689343"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 17:52:49 -0800
X-CSE-ConnectionGUID: LreYMT0WRmq5NIk8h1/40A==
X-CSE-MsgGUID: kz4xDdMsQtWRJH3Xlc/azw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="205528595"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 17:52:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 17:52:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 17:52:47 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 17:52:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxpgNcaRf4c2kAMMob9B2+5YZ7W60v0Ws2FHhBU7Ugw9bCMmNPMTPICMwN886dVT5KvmkHxi8vDnQDV5mt8M5lMXDcsn58G0PECm2Ur9XXsar8jygFPulfRw5Y/Af3vltM8V3hd4p5ZH5k1L/MhG+I/+NaO1prujZdNQkoidSIongor2F+OYZvZYx1Ti4FH7+fAd7av8brsPdfM7hzLVK3rVpqFskwouTTbt1R29JEx0I9iXr+hZGsR9fDi9hB89+feUQZ57tcpsl6is5frUzEGH77e8JFctLG6dsrO/33PUn1NyQj3/AXSvl61e/fs7Br8UOhHY7l0XSZ0OIiclSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zf8dswNdZBBxuAXLpUzV+YJizHu3nwySRYkxd3iwMOs=;
 b=JL19Uuxj+cFXGL1lU5OETpmxDATB2kT5BFvIfDBMFuKaglB8rtDb91DExxXOmnyj8VXRvKSxBQi+OqZ21CEI6HQr7iG0g3f7JIGQB9axq/EDoYX06p78ABN/M/3dYNfLwiNdLed7GiXlams/LfJHXGNfyorBtDHAupWmP0QVg5XTmWVCJe78qfqygskXa1Qqhj6SqJZ+mVw0L8nQqRG37HErcO24aXTvlDFKTPStPQ6UQRVbY/zZsM9pFm+lwIdPrwenzQapdhvAjuwQU77e3uI5unEAaRpwU456k5V4o5TqPPXwnu34lTHFfEe3yDcKlRYNCOUYhfX06PoXSkopbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 01:52:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 16 Jan 2026
 01:52:45 +0000
Date: Thu, 15 Jan 2026 17:52:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 00/12] Context based TLB invalidations
Message-ID: <aWmZ606/bmio0jty@lstrano-desk.jf.intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
 <5f976f6fa03d6e508849593a936281394735af23.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f976f6fa03d6e508849593a936281394735af23.camel@intel.com>
X-ClientProxiedBy: BY3PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:217::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 75632c22-8c68-424f-8264-08de54a1f1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?i0C91N2/HAiWLllj8Fn+xB6h1/RstyA2kY2IFeEYbUVx/ff+XfH5sAUJ0c?=
 =?iso-8859-1?Q?5j8zVl9VVchIgGQULkGlgYVv0/KO/ZiSF+M9ZltoYIhOj4LdcV2ku6qj/T?=
 =?iso-8859-1?Q?UI2RYuFVIqfouP22lpEVQJ5Hb+zSqLGclEI1w4rBkIS/rE7iSkkZTwPF9Y?=
 =?iso-8859-1?Q?7xAiTvEg0/hX7NXyhl2ElFxUaopB2tRLCAVf3KSJFQOs3ySozLnNaw+THi?=
 =?iso-8859-1?Q?A9E7wa/33XZhQ1neQ/VJ2g2Z8Lqtr6xWw/swsRL+HZoE8qOeAmXzdW9yt6?=
 =?iso-8859-1?Q?vS7FIdS5NWtbtaoL5aelw6P2Rodk1qmvE7jiboHRlCHPWMv4kFZjIMY9wM?=
 =?iso-8859-1?Q?PFicQME1i8LNV4bTc5ID8uWzEBmjtlmcYBrzvZ9jqhzXzXksK/A2xrfdQJ?=
 =?iso-8859-1?Q?luE73EdjHvzbaZFarP9yirwcBcwunEPGEGPdahRvTBxWnMTSeY0W8uToCv?=
 =?iso-8859-1?Q?a5va2KOXO4NdfHdfkI9c3NAOVMWO/84KdQ3wPU9ZHVCSOdbQrtRHl8vfLV?=
 =?iso-8859-1?Q?O4tef0ANYAvl+2A95PZ3Z+lr72d6Y1Yw+NgDpjkW5n2f2UbrjYPVDxiCn0?=
 =?iso-8859-1?Q?nSTNZ6EcPc0yRuYYVIJOBCP4BPlOq0vY+uYJets5/BBQGinZjc38x2fDLS?=
 =?iso-8859-1?Q?r5aSRNwSMaQ9Iffr2c4PHa/WDM0TrjowFVT2az5AHSoa16MdCGvv436/El?=
 =?iso-8859-1?Q?LJlbokNfjB8LIp+fv+2EfaYLBNm7I42B5R7d6h8PJWpRkHDwHfRrp85rik?=
 =?iso-8859-1?Q?kbD7I43kos2pFThKh9ItvlfUZZzSDNYbOvs2w/bB8i1eh0zA/ZSKoOfA9N?=
 =?iso-8859-1?Q?J28vg3F5kBn3sWtJIQE74GJMQ4DNrCgkNJihSeAwOhvHaoF6kGFhN1S9ko?=
 =?iso-8859-1?Q?27gEqa5dYhNWde6isf/52nSF6PjEqgYPTrK+gf76pd0CAHz1FtWgg/5kIj?=
 =?iso-8859-1?Q?hfzcrh2BTWC1oY9a7ipvko/vAptKkMDYutNwCMjDs5v+S6aUvdyw+Kt/GA?=
 =?iso-8859-1?Q?Hx9IXGtOAylKzHXQDIUlWBXb0XZLAnxcLITkOaG1JqJTCMdlI02rBSRlUu?=
 =?iso-8859-1?Q?M5dG9Y9FMtFcsyg2IF2lNe1lzCjRBPb1idV5n2EMwVbr/TaqzdsT38QRBq?=
 =?iso-8859-1?Q?fa6eXXQSW36GAp1ZiQvW9vnpSYhydP6cR2eztiN+Jpq3DFDZzVix3OoTmV?=
 =?iso-8859-1?Q?cKDPqaES1IlHuVZC+9n54RLrMsyb7hHupjIgefDnmgJ75cc9GtXTEkP++V?=
 =?iso-8859-1?Q?/tPZ4uZPRV+eURHAJP6Aba2tvJX1Kjisk8HGEC13z6XTsuxKX8hQJSfZuO?=
 =?iso-8859-1?Q?EmI/e1WYTziYNFTjsRboF77EG/h1yN2yWDgM74fNk9t2I+Tm2wJDE1/LJP?=
 =?iso-8859-1?Q?4mopzEIx1U7Ix+w168lsxSxG79gJHoQwiWNZL+xqMBAV7evf/53FcfdW7N?=
 =?iso-8859-1?Q?MeDdpxuvDkkx4yWkx/y+OuGEvPc78R1S7Wy8jVqfkQyNV9GfCxbJuSAPYj?=
 =?iso-8859-1?Q?CQMSOdruDMoOSAZMHEAOOBnV9a07sQy8wV+UyFzd5J/haN1b6g9NkPuslR?=
 =?iso-8859-1?Q?+iiw98V+sPgOmWBwwPr9nxMwUKww?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?en2SPNE+d+0agSmwceGcD8cfnueunbGmAWUBDTqxV4XW2+jElJLq/LmDiD?=
 =?iso-8859-1?Q?F7sGTXeJGQzNH49GLHMjAiKdWtAGophalEVhlTF/0ixadugZZII+f09bRZ?=
 =?iso-8859-1?Q?mMrC2MnVNB7usNfrBJDl+pE0lUgFeickgVZ1fTWut+jdX05ZbXO+b+8aGk?=
 =?iso-8859-1?Q?WP9FFLGkQrBFitf+J5yl6+RiZUYofN5U6F5gf3I/WB8E7AkU8UlealwIX3?=
 =?iso-8859-1?Q?C85c1qb4oDiWu0F5jaJkQ/3yOoU5uQT5ioKIgrxOFdhQGUf+eK0+jWwfii?=
 =?iso-8859-1?Q?bDGbKDaAM/p6QZkpR3F9Di80IS7NVfpc2gcX8cbHmlKHy04lYNls5DYvX5?=
 =?iso-8859-1?Q?pqpfaVI8hhtoYZU1XgvdXOOHuZQFPA47cpoJr6SbNIBgaYVrUMUyQmKIDj?=
 =?iso-8859-1?Q?3OA9O48tTvO67ceC24UgcHqDh5USoNYYS1Wzrqhc3FE3Yh/s44NHSmKwnD?=
 =?iso-8859-1?Q?UxnYZlhlLnH8Els5d7AEVmuQ41OCaFDqIN+Zvn4mtpNPNeeqWbN/ig6QlQ?=
 =?iso-8859-1?Q?MGlt0ITIxYx/LZtrTrZRwRDDv0hA06I5gE7dww7ksL8qLlWrq9aRWNdm/M?=
 =?iso-8859-1?Q?NW1V71j1g4iWpxiTaRFGyLBqQ8XbLbsXf9riGVxfMKKSlQP2iNDuNiZ2bC?=
 =?iso-8859-1?Q?xp5aM7xJJxfmaio5FkINL1HtR/Nk/K1S1Y0Od84N/MF5iTBZxWyGHg/PKM?=
 =?iso-8859-1?Q?HeQJVZXKLY7OFXIZSDzZ26nnLC46wiVM2JY4XqAwMyxJuQsxAJnGJ1Dd5W?=
 =?iso-8859-1?Q?4m1xbVEQ66d7X56MbWmU1qagp1vo4MjMIytc6yVzuAdtujeyo7+s/z2Rhg?=
 =?iso-8859-1?Q?n0XuW9pX3RMAAR2svdqFSK1FNer4lH1OJKMoUjSV0P15JElEnW2J/yvsRU?=
 =?iso-8859-1?Q?XUq1Pu23rMdEm3h7j01YUzhnub0XkaCrY0qCEfedNP/Bzzy8RaEOsbm62H?=
 =?iso-8859-1?Q?4PIh7CpqDGBocfToLu/jTSkhkM0wm85lvp+59ghQMi4zrK3xz8gsIFHkSO?=
 =?iso-8859-1?Q?7HfdHFkxiRW5lCh4Prr+52eeC+84nDkLUgrQKcgnv4nXRVADTuGRKLhYMY?=
 =?iso-8859-1?Q?rJO2oBsYpEvO02xxQ3yni56OGojHosxZiHBLA95ZdocY1j1ET7Txipwjqi?=
 =?iso-8859-1?Q?L8TqK75R/P7c/JaFyZSv54yK9xkF3KHAiK0GRZyZCCTi5ahRiT7WUuZqH3?=
 =?iso-8859-1?Q?wzmCiNJXO6/Kx5CmAO2EQaaCOCBtzk8jmnsdQW6hXZOG1IqsaX8CB+IMfD?=
 =?iso-8859-1?Q?1gn1iMao2QXd0dX38kYWJYLK+px9gj8W/ontd22O1N7y/xfPkrXyub0/P3?=
 =?iso-8859-1?Q?lC1pv52gSIdLqE+tC5fNmYpI1uGXqSLPzzaXGxwDbuR23QRb3PYQLg6aO3?=
 =?iso-8859-1?Q?A3f8qPLdUuzs6H1WncYoH1Fvr7eyFICqEAvinHYQwjUEwrZaiOxcrI56zI?=
 =?iso-8859-1?Q?I8eEIelDWDPzKUX1Z3OyUC16GoxeSTefoiseW1NVMLq8kaIN1TioAFHAE7?=
 =?iso-8859-1?Q?v67QvmR4hOwHJbthSdQnhKz+IeRLZuprZ1iSVXCkkynGWYIimqcbjBTZfH?=
 =?iso-8859-1?Q?RS0hRgrPHutM+2SRWT02+tcy9bhyJDAlmz2Uth3laSePDRZ2i+hF+tbO/j?=
 =?iso-8859-1?Q?RUgCaUucpGqyKLtJdq5NMLjYMaMe1YOtHgIFEnoyZtlp9x01OxUQQMMM/o?=
 =?iso-8859-1?Q?q3E9GHCwCDPeNCfddgo1qyTUefk1jKJg2WxW8X8zr8d06jCBQKOb1JWrXg?=
 =?iso-8859-1?Q?gB2geEiyM+Ghn/+x7J1EltbthtQDhO62oMJzVv1kOFXQ7m/IDQaEPy23Of?=
 =?iso-8859-1?Q?8CE5qwAU+pDey/+vyAMzoHwa/r9gwl8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75632c22-8c68-424f-8264-08de54a1f1c8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 01:52:45.8310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYjtdHuJGcUtEny6qnzTySvcG9+vM22OICQpG/98xZiNbEkpT6Uze6+dE8fQ9PpNNo5USXGgwd1G4iSds25AtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
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

On Thu, Jan 15, 2026 at 05:25:56PM -0700, Summers, Stuart wrote:
> Ok at least today, this definitely is going to need to be included with
> [1]. Without that, I'm seeing DMAR faults and various other issues. But
> with [1], I haven't seen any issues yet around the
> registration/deregistration, so I think the ref count model here is
> sound (as discussed inline of course as well).
> 
> So:
> Tested-by: Stuart Summers <stuart.summers@intel.com>

Thanks.

> 
> The only concern I have at this point is around the ring invalidations.

I have one bug to fix around multi-q too.

> Maybe we can discuss more in that review, but I'm a little hessitant to
> put a full R-B on this series unless we also include that other one or
> fixes that you had suggested (which needs more debug still).
> 

I'm not sure ring invalidations is strickly related. I agree would
should reach on conclusion on what needs to be done there though.

I'm fairly behind at the moment. I think for ring invalidations it is
unfortunately going probably be at least week before I have bandwidth
to think about those :(.

Matt

> Thanks,
> Stuart
> 
> [1]: https://patchwork.freedesktop.org/series/160057/
> 
> On Mon, 2026-01-12 at 18:52 -0800, Matthew Brost wrote:
> > Add support for context based TLB invalidations.
> > 
> > Matt
> > 
> > Matthew Brost (12):
> >   drm/xe: Add normalize_invalidation_range
> >   drm/xe: Make usm.asid_to_vm allocation use GFP_NOWAIT
> >   drm/xe: Add has_ctx_tlb_inval to device info
> >   drm/xe: Add xe_device_asid_to_vm helper
> >   drm/xe: Add vm to exec queues association
> >   drm/xe: Taint TLB invalidation seqno lock with GFP_KERNEL
> >   drm/xe: Rename send_tlb_inval_ppgtt to send_tlb_inval_asid_ppgtt
> >   drm/xe: Add send_tlb_inval_ppgtt helper
> >   drm/xe: Add xe_tlb_inval_idle helper
> >   drm/xe: Add exec queue active vfunc
> >   drm/xe: Add context-based invalidation to GuC TLB invalidation
> > backend
> >   drm/xe: Enable context TLB invalidations for CI
> > 
> >  drivers/gpu/drm/xe/xe_device.c           |  25 +++
> >  drivers/gpu/drm/xe/xe_device.h           |  11 +-
> >  drivers/gpu/drm/xe/xe_device_types.h     |   9 +
> >  drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 +
> >  drivers/gpu/drm/xe/xe_execlist.c         |   7 +
> >  drivers/gpu/drm/xe/xe_guc_submit.c       |   6 +
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c    | 238 ++++++++++++++++++---
> > --
> >  drivers/gpu/drm/xe/xe_pci.c              |   2 +
> >  drivers/gpu/drm/xe/xe_pci_types.h        |   1 +
> >  drivers/gpu/drm/xe/xe_tlb_inval.c        |  33 ++++
> >  drivers/gpu/drm/xe/xe_tlb_inval.h        |   2 +
> >  drivers/gpu/drm/xe/xe_vm.c               |  64 +++++-
> >  drivers/gpu/drm/xe/xe_vm.h               |   3 +
> >  drivers/gpu/drm/xe/xe_vm_types.h         |  16 ++
> >  15 files changed, 375 insertions(+), 54 deletions(-)
> > 
> 
