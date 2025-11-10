Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C3FCCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 15:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECDE10E3EA;
	Mon, 10 Nov 2025 15:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHilZPmf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5442F10E3EA
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762787093; x=1794323093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CM04U/EMjXurXC1AMzmojaiQ9vPHDJpawr8xean36YA=;
 b=jHilZPmf8CDYdt6XgEmzqvT+4SrSsKqDBKyNLoBt+5XT3En1bEKycans
 9wt0nCcLf+GxS3JeH27YwY8eTtYePU7wnvog9QIG3mCRpqVgZAKoRdCd7
 6SlHAGV2vh9Z9sxEfRpxBGdeJWL0aJhpkuwZNkgyCt08CgTMOyW6bvHYm
 Fr/2kvN4u5DH0WR/0KSop1fxJ6sEf2sJjjgiD0zEoLik8/jPEPDJ8UTqp
 ReMM781sNwYHzl/lslbJCNvK2POgFI3NV/k31R2qR6Vif6hqOQR1ke4kR
 9xUfzVMUc3AvNkF9qRabeWQSQnFukqBOLPlNocJcM/zoNhOOMojYdqL9c A==;
X-CSE-ConnectionGUID: RjYG3VNmRuGUiwKofw7LZQ==
X-CSE-MsgGUID: J+R334SpQ3KtPUrdOcyiRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68479931"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="68479931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 07:04:53 -0800
X-CSE-ConnectionGUID: UmD+gBVdSfOQLt7m0LuTrA==
X-CSE-MsgGUID: NDfxSQ/uRPSIrSf50uHwBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188439028"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 07:04:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 07:04:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 07:04:52 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 07:04:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVf4rFc9PjLpdafmfrrnxwvWtm4NBzGMR8zV1sf62zc45bii0od9NNLyqyL7L7e1/uHLlQZXTYPfc07wA8Sufpxy61XDeTxDAmj6swKR+FFojP0CD3Fm+CZyuBrSXTxo/isD7izvVn0fGwaZ0hYB22r1+Y8ATcyxkK+UhPst8988gDp/MWPIt+ILD4lst4ppTseVyN85DXWyfGtnNjL2tfRR/PfJmQcaXaS8elrd0Up8L0P7hRz0PN849yB1YQ47tP+V6Gpg6/oXFwMJxOj5Jel1Pf5GJ7WNkK7tAQcrdQ64evNGIywZ4fL/1aSI0GBIB4f+8jFH8L2yGPkQyn2rdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgmB1A3zr7nx//qHQgU+IqFnbiR80kjywifU72d3Ads=;
 b=pmvYCBnshw9ZYeayQsyQSvUqSZWnosWkEbW8GR8F1JvUTW7fBbBtLgRwWzHVtFbf/xd4+Ux8QASTAHBoDwh/YJKrZOWDhO7h0dwIB0R4J5kaaBS+uKDTFIZbK2RDGcES/1StpqJsrSALgVtvg9nItRyGIR+mGbloybJD5GmqA40oSyupZKO/d+/6aq9W6VH5dWVONk+QMSizyuX0hDg0UzlgDRX+gj71tZ/3jy50UETKnsL+dcW5XuWXb8yGSacLJIv4gzpEebGdzPVxNDkpCGwBS2wzfu7k6mT+DsrqsktMae/tjMjMlIKqMnmon7YwrpQuLLaxlhOw5iluzOJsvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:04:50 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 15:04:50 +0000
Date: Mon, 10 Nov 2025 10:04:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Fix MTL vm_max_level
Message-ID: <aRH_DmVQcMjJoNLK@intel.com>
References: <20251108040634.6376-2-rodrigo.vivi@intel.com>
 <ngvudjhai4u2ccrlaacv5dbvudbpvqkwrm66yeyjmhzevrt34v@j4qzkvtqsx4m>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ngvudjhai4u2ccrlaacv5dbvudbpvqkwrm66yeyjmhzevrt34v@j4qzkvtqsx4m>
X-ClientProxiedBy: BY5PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:180::48) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: f29072d8-c724-45b4-a239-08de206a7e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PDY3qkMN9Y7VAD2HIpnr64M9u2padbz7Fma5Q7ULKAMCPyhOVsgulu5ihWpu?=
 =?us-ascii?Q?TNqIP1NaNeIbvN4GubLHsE26gd6+TZqXf4JKMa44gFGGIWfzicFM5fecd4hP?=
 =?us-ascii?Q?GvCRBBaEcBm9Hkx1ugFKWGWCKdncfAxNVI+jSECirJNJd6QkfPe7WqukqjVU?=
 =?us-ascii?Q?NfFMT3s6TQsqpvri5hj17QZyXBG9rKtMGuxuxmMHoFA4sJQvR4dj9AFomR6F?=
 =?us-ascii?Q?DDL9D2gjKIii7M3NKS5zLuiqF+F93eNhVFzMexXYsJxLVLrQUpclu8yEHh/T?=
 =?us-ascii?Q?MnUQH0c4tj1TwdhDHW9piefzjOCEUV6P3/bmXL3w7JWqBa8GrYIKpFNTPSrq?=
 =?us-ascii?Q?O5UAssP2JAhhaLvLXDinJGIUHDdJhFxlUAf4+hqNEph0XNieQSuXZgrQ5Jx2?=
 =?us-ascii?Q?zOndqF/rmSFywG1xk8iQl2NP6h2wuaz9rauCSVeOx6JevPzevlPY+WOjOx8h?=
 =?us-ascii?Q?l3J8rRiuIfIrapNFnn8z2QG06gNGDBrXP/lYPmaurqHhWGfEE+GJ0RaKwXe2?=
 =?us-ascii?Q?0lis3hY2e5GiQhRsaoEW8XH30KPVEI/MwsJza3ifH9fNiFm32QVb+VKbCJbS?=
 =?us-ascii?Q?DyqZ2pwSljqFnf6NdI7xrgDATRJzFsbaCIgdvzshdhhLw2F2VnF8ZADNIjo4?=
 =?us-ascii?Q?EMSNnJIk4mOiipoHDN/h3rh+Pzwcv9oBlbZAFoEEPpMuX09+/b8XYyPfluB+?=
 =?us-ascii?Q?JTp/+7TIJIKcbI5mC/TJSFlZPqfe5RhICbaBRw2FH6vPY0z+LVSDLh4Tp58K?=
 =?us-ascii?Q?xHo6GbIXxFVUJ3VGntux2FRUhqCbVlx9oafXpZjAORfCNIc9Y0DB52Pgbs/m?=
 =?us-ascii?Q?5EGQ1FKlWs5/hBDQFdFfZZO//u4du3ad2EOwvgXkpjagEeGN8VcL2ikUIlHU?=
 =?us-ascii?Q?wn/FhvMt45+3J0Xr3NYQYhIUMIo/1llHvF2H1Hz5OyKw0/7E1EMMAfWNJb6d?=
 =?us-ascii?Q?9WebOIjqNKwlPqZ6e2C5pmoqy7a3n6IDZRFns+1IaWR8+a/aDk+lagOpcgGP?=
 =?us-ascii?Q?7LQH3CVJfwJ3SBAa0TxCdPjU0p7DaGoqMHUwenEAwdxyxorLjCfzqzL6icKA?=
 =?us-ascii?Q?Pk2tu1KOoxNX81q1UwGZQSXlXNrk/eORE/2MrzEf6C0sApPai74mpOg4ch+E?=
 =?us-ascii?Q?eRucmYvF8prhWI1bdBGaPXXTNEn5pCyle9JolTArVTWXd8RKKegN2TQldDrS?=
 =?us-ascii?Q?IEMGvZmiq5DDg8hn8lEW+5EYrNeDeUy0p9uywVR6U5vFyOcFZr7OsiQn3PgR?=
 =?us-ascii?Q?TgC7960YNJmXHRtw4/2NacBFOAQPydL2s2C1Wuz298jNHP+BXq2tLZPZBJ+F?=
 =?us-ascii?Q?MuM+mOEuwacD9rNu+2RRyWF81aG0lfrMd7hkzbVyx6+PUz6+w1CrElRhYpfa?=
 =?us-ascii?Q?gWJ4xQkC01dLLMjHUc9AcjEs/CSTIC8sq2sZVmBeKiQg7Te/tME1f54nw89E?=
 =?us-ascii?Q?WFKtIAB1vchMaa3rdJYdjvzadTGoWQba?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dq5sFEY7CvSqlb8ngwE6hMEl/J5Q+YxR6Av0lZkONQQd9CWz7LphUrDkc16B?=
 =?us-ascii?Q?9cpAVY6Y5HRoTuV/7AFb6PlQdr7YuXmjJnuJDG+Pw7rZRbI6VvNvhS+ZxEe3?=
 =?us-ascii?Q?u9BSWVeeMnjVS0ZuL59RHF2QCVUai1nzTDuLEmalOV25mQ4Klc+1b64xlOcA?=
 =?us-ascii?Q?BGvX6ovyiyL2Y4NIQLKcJ8+6omn2y0cPsj3g5fsjmCGzjDXY3cz0tvhMmlA6?=
 =?us-ascii?Q?ycvWAavxQy0NEz/5Jiz3HSgC1unLbctBFhnJ6dahf/xASJ6/+rHJVhsoOEkv?=
 =?us-ascii?Q?pytV8sMkvqfsQXtioOMvEoouiCJ1cUipO15Ovntggj+NBBcXfDVGW4wRRM+I?=
 =?us-ascii?Q?hr0jvjB8oP58PSR8cP6Rb88ia1vhBqKcODv3zF8NrF6wu9nRX95it/Ft88Mw?=
 =?us-ascii?Q?wD64IGaJy68fVqKD6kaBnx4IrhQj7eev9VbEAiOkj1wAejjzfwOlXfTjZPEo?=
 =?us-ascii?Q?5jgGWLGOCJCMf/fNTfHgPnzlwUjs9uc/MZUKlyjNkAzVOgU8i9y34cQ0jEEj?=
 =?us-ascii?Q?8TpCr0ExwRqA+CWa5q9ucMrQdV52YO/G5V2f+IMYBWf8vkPL/bNa1YpJZvHQ?=
 =?us-ascii?Q?R4CW6+ViGIXshse6yjwt9UEcPQtT9zgA/GduCHU42ms9ZKD/dtyiQqxpn13w?=
 =?us-ascii?Q?MjSTe7tG9SBssglIw82hxgk47OLof27Oh6DrfXbT+F58iOqNHAZqzy0+MxDC?=
 =?us-ascii?Q?GYu3BQEcTSDABfJsBxwvYpq1cyFrY1je0/mo8RB0cA38OqeDAGjXVhrJyVD6?=
 =?us-ascii?Q?asRK3iz8dC3JJNBMcn6flP9cQp8ifEub+wCHmzl+husu4lK8VZ9Jpg4pTsCN?=
 =?us-ascii?Q?Zv0641o1fwGWW4kMmJprnhvJOKplGcJYOv9vUC2LRxlzLze6Kfd4P0d/wqPk?=
 =?us-ascii?Q?aviJlTiPRcz2VXpJDxkYoOYgL0MuAl+VnLd271/dth+pCil5gLSBDRxnquWG?=
 =?us-ascii?Q?o0+GpCkOPMUctVHM2+tGodQzKyeu9A8PEvRGYb5g/ar8C8EaIQTqHnd+OLoc?=
 =?us-ascii?Q?v3zMtSaFVC8FIHj6lTm3xKlDrtFiq9148WApnynEy1bndyxB/Nvmf0rk5qHI?=
 =?us-ascii?Q?eYZOKDqcekM+beTns0g339zDpOFcJvUGK8hhENjqjtNAxs6wRSRk4c+aZSHX?=
 =?us-ascii?Q?u8sPIj2bn3Z3dPglXaNofjuluEklVCbVZ5z9QO39aVXMuSjL82F/30E7pcGe?=
 =?us-ascii?Q?vdhJxBdmPRKttwLL8k/1ZGPH4wBooB80HrXkzOKNuDAoO8p3TTz623RWLD8g?=
 =?us-ascii?Q?1+PTVTG5NDRukTaa9wf3PSk8/DTI7P9ndvY+TSdtpCY1l5qUL31rtr0+DYYo?=
 =?us-ascii?Q?vFVjaQqREkrrrhyNLKH1LIr0FobWZEYUqh29x4S/fXzzULU/kMf6dJ3KnCxn?=
 =?us-ascii?Q?7ESSSth98vECfiuHLI/SFkOqmk7K8r594yiSv9bfiC6f0jgesiwPs8Jzu45h?=
 =?us-ascii?Q?PJJcUxliVZqu7b7e1mXsIxaK+NN4snoQD22UBRGq9QCRG2hk/dWpQNXuQQcd?=
 =?us-ascii?Q?tjvEHcKaanP2b1APIwhX8aGwTg7jLqcMcrBsMLwW0NoMmhYN2clbGpipl31L?=
 =?us-ascii?Q?YPlef16b0bN/i8rgogwx3pbfluD/UwQETN1IVg3m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f29072d8-c724-45b4-a239-08de206a7e8d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:04:49.8555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7vbTLBDTLIVe0VPYb9JZfIIEn7zzqNh1Q9JKK0bm6OUIQNUV5CP8N3UQs64IyKuH9Vt/mNuxHikzmfKzFs72Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
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

On Mon, Nov 10, 2025 at 08:44:52AM -0600, Lucas De Marchi wrote:
> On Fri, Nov 07, 2025 at 11:06:35PM -0500, Rodrigo Vivi wrote:
> > MTL was broken after the vm_max_level movement. Get it back to a
> > working value.
> > 
> > [   37.722413] xe 0000:00:02.0: [drm] Tile0: GT0: VM job timed out on non-killed execqueue
> > [   37.722465] WARNING: CPU: 0 PID: 12 at drivers/gpu/drm/xe/xe_guc_submit.c:1379 guc_exec_queue_timedout_job+0x2f3/0xe00 [xe]
> > [   37.722559] Modules linked in: xt_REDIRECT nft_compat nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables qrtr sunrpc bnep snd_ctl_led snd_soc_s\
> > of_sdw snd_soc_intel_hda_dsp_common snd_soc_sdw_utils snd_sof_probes snd_soc_rt712_sdca regmap_sdw_mbq snd_hda_codec_intelhdmi regmap_sdw snd_soc_dmic snd_hda_intel snd_sof_pci_intel_mtl iwlmvm snd_sof_intel_hda_generic soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda_mlink\
> > snd_sof_intel_hda snd_hda_codec_hdmi soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp binfmt_misc snd_sof mac80211 vfat snd_sof_utils fat snd_hda_ext_core snd_hda_codec snd_hda_core snd_intel_dspcfg snd_intel_sdw_acpi snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation snd_soc_acpi snd_hwdep \
> > crc8 soundwire_bus libarc4 snd_soc_sdca snd_soc_core
> > [   37.722584]  snd_compress ac97_bus uvcvideo snd_pcm_dmaengine iwlwifi snd_seq uvc videobuf2_vmalloc snd_seq_device videobuf2_memops videobuf2_v4l2 snd_pcm processor_thermal_device_pci videobuf2_common processor_thermal_device btusb intel_uncore_frequency processor_thermal_wt_hint intel_uncore_frequency_common platform_temp\
> > erature_control videodev btmtk spi_nor processor_thermal_soc_slider x86_pkg_temp_thermal btrtl snd_timer iTCO_wdt processor_thermal_rfim intel_powerclamp btbcm intel_pmc_bxt snd intel_rapl_msr processor_thermal_rapl coretemp iTCO_vendor_support mei_gsc_proxy btintel intel_rapl_common rapl intel_cstate cfg80211 bluetooth mc in\
> > tel_pmc_core mtd soundcore acer_wmi mei_me intel_uncore processor_thermal_wt_req i2c_i801 spi_intel_pci pmt_telemetry platform_profile mei processor_thermal_power_floor spi_intel i2c_smbus pmt_discovery igen6_edac pcspkr rfkill wmi_bmof idma64 processor_thermal_mbox intel_hid pmt_class int3403_thermal int3400_thermal joydev i\
> > nt340x_thermal_zone acpi_pad sparse_keymap
> > [   37.722611]  intel_pmc_ssram_telemetry acpi_thermal_rel acer_wireless loop nfnetlink zram lz4hc_compress lz4_compress dm_crypt xe drm_ttm_helper drm_suballoc_helper gpu_sched drm_gpuvm drm_exec drm_gpusvm_helper i915 nvme i2c_algo_bit nvme_core drm_buddy ucsi_acpi ttm typec_ucsi typec nvme_keyring nvme_auth hkdf drm_displa\
> > y_helper hid_multitouch polyval_clmulni thunderbolt intel_vpu ghash_clmulni_intel cec vmd i2c_hid_acpi video intel_vsec i2c_hid wmi pinctrl_meteorlake serio_raw i2c_dev fuse
> > [   37.722638] CPU: 0 UID: 0 PID: 12 Comm: kworker/u88:0 Not tainted 6.18.0-rc2+ #37 PREEMPT(voluntary)
> > [   37.722641] Hardware name: Acer Swift SFG14-72/Coral_MTH, BIOS V1.01 11/06/2023
> > [   37.722643] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
> > [   37.722649] RIP: 0010:guc_exec_queue_timedout_job+0x2f3/0xe00 [xe]
> > [   37.722722] Code: 4c 24 10 44 89 44 24 08 e8 5a 95 f1 d4 44 8b 44 24 08 8b 4c 24 10 48 c7 c7 00 b7 25 c1 48 8b 54 24 18 48 89 c6 e8 4d 59 37 d4 <0f> 0b 80 3c 24 00 0f 85 55 03 00 00 49 8b 47 58 a8 01 75 1a 49 8b
> > [   37.722723] RSP: 0018:ffffd468000f7d80 EFLAGS: 00010246
> > [   37.722725] RAX: 0000000000000000 RBX: ffff8e3d4e215c00 RCX: 0000000000000027
> > [   37.722726] RDX: ffff8e40ae61cfc8 RSI: 0000000000000001 RDI: ffff8e40ae61cfc0
> > [   37.722727] RBP: 00000000fffffffb R08: 0000000000000000 R09: ffffd468000f7c20
> > [   37.722727] R10: ffff8e40c09fffa8 R11: 00000000fffbffff R12: ffff8e3d44c00028
> > [   37.722728] R13: ffff8e3d807d4000 R14: ffff8e3d807d4018 R15: ffff8e3d95c9d600
> > [   37.722729] FS:  0000000000000000(0000) GS:ffff8e4116110000(0000) knlGS:0000000000000000
> > [   37.722729] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   37.722730] CR2: 00007ff1f3e02720 CR3: 0000000113c8d005 CR4: 0000000000f70ef0
> > [   37.722731] PKRU: 55555554
> > [   37.722731] Call Trace:
> > [   37.722734]  <TASK>
> > [   37.722735]  ? __pfx_autoremove_wake_function+0x10/0x10
> > [   37.722740]  drm_sched_job_timedout+0x81/0x170 [gpu_sched]
> > 
> > Fixes: 50292f9af8ec ("drm/xe: Move 'vm_max_level' flag back to platform descriptor")
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > 
> > This was a very painful bisect today that took me the entire day. :(
> > The -rc1 was not working for me due to the disk-encrypt so I had
> > to get an -rc2 reverting everything and run a reverse bisect on the
> > reverts until I found this commit:
> > 
> > 50292f9af8ec ("drm/xe: Move 'vm_max_level' flag back to platform descriptor")
> > 
> > I reviewed it and I was convinced that MTL is xelpg and that '4' was also
> > the right value for that. But then I boot old working kernel on my MTL and
> > I  could see '3' there from the debugfs/info.
> > 
> > So, this patch here fixed it for me.
> > 
> > Looking to the CI page for the drm-xe-next I'm now wondering if we have
> > more busted platforms there.
> 
> we don't have MTL in CI. I'd expect some eventual regressions like this
> to happen on not-officially-supported platforms due to that.
> 
> This matches what we had in v6.17:
> 
> 	#define XE_HP_FEATURES \
> 		.has_range_tlb_invalidation = true, \
> 		.va_bits = 48, \
> 		.vm_max_level = 3
> 
> 
> 	static const struct xe_graphics_desc graphics_xelpg = {
> 		.hw_engine_mask =
> 			BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
> 			BIT(XE_HW_ENGINE_CCS0),
> 
> 		XE_HP_FEATURES,
> 	};
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> > 
> > Also perhaps even some mismatch in the GT version with the platforms? :/
> > 
> > Thoughts?
> 
> I went back to check and... from the xe1 platforms, the only with
> max_vm_level=4 we should have is PVC. And that looks correct now.

It all makes sense now, thanks for checking and for the review.
pushed

> 
> thanks
> Lucas De Marchi
> 
> > 
> > Please help me to get this figured out and fix before 6.18!
> > 
> > Thanks,
> > Rodrigo.
> > 
> > drivers/gpu/drm/xe/xe_pci.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 1959de3f7a27..cd03b4b3ebdb 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -333,7 +333,7 @@ static const struct xe_device_desc mtl_desc = {
> > 	.has_pxp = true,
> > 	.max_gt_per_tile = 2,
> > 	.va_bits = 48,
> > -	.vm_max_level = 4,
> > +	.vm_max_level = 3,
> > };
> > 
> > static const struct xe_device_desc lnl_desc = {
> > -- 
> > 2.51.1
> > 
