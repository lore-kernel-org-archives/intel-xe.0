Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C260AC7EE23
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 16:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D4310E1CB;
	Mon,  5 Jun 2023 16:40:37 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10ED210E1CB
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685983235; x=1717519235;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pkPVBzFCvSV+jwGFwNCix3ZZ6JepG7tAucyBb2/9ykw=;
 b=nfrdFbncDJZa4hdtgIW+FN4fZOpHcNw5lxIZk/xWzMisqC6JlW5QD0X/
 uavakIhIUBo0FJoGzYrtmzkmMGaDsLap7gbUVhhUW1Kzta7glsg7SP8Im
 VbtAMawytu9HNRD1zC0shPKFS3dNVwYTWv4J6bYgsrCQGzsQfzlxGivFB
 hASmhxoy7jyw9+iAZfswRPBVUsVUSD9REfzkAILkIpOr5QJLpQ3VJ6DnV
 gkOgAWgUuPTCn9e0HfnpVfw08QkjdeRcJB4+d0DLCsRD+B6Uua0xxxDzy
 Mic2w3aLHwMAO4AZfwsofuNla1NygrNorWZllk9LWMohH0AGtcDD1k5Ma A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="419961516"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="419961516"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 09:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="832871434"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="832871434"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2023 09:40:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 09:40:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 09:40:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 09:40:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEHSCJ9ZbhW40jVp18zblpm3neM6OgrjvvFZd3b8z4i2TGcNGjeFYRZqxXSM3HT5z95KnhTJrYZUd4K4w++rvPz7jyVsBXsSxp+MLDbBjyAFRNv5HIuVCiDXKMclUYZFtssfWb63lcWtPKXF1l8ZN/JzpNhU5U+35tN2x9wzLqUSDXz7VHy5Az3a+1PW0Zca8YCuvCreV/c1N7kVnplS3DLiYRo8veKmuQYfDgtn5q6VIlHP7Z3OLsTM8Gan0eivHesumZ3+iYwNyFmOw7AOd2U4M9adugXqVDYCkzgWqZ67T07dnY97hPyWhBE1XouV1X9bwTFoSmfyfy/TJc/RtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dX1Tg2/at4/UD1dBdn4bG2Ll+MIlYdQ7RF5hYXJ9Xnc=;
 b=A+27gzD7IpTFpyerk4dzRy5IzJukMa5sha1zMNvqqL1SQMKmby92XyeizfEsPIJ9sJJ2LL+CRcivTPNFWdWaGiDUXQuu9VXb601fL7+ov25mMDofT0Im8HsmBd/Apeo30iDO/V/4X0TsV77HTNK98smFZI4OaWKFS+x/3emAluyqqXR9Vie4awmPUKWYaPT8QyTQ77axZUcO+tgCh5hbifuwItSItRaFBr2YOEJStCWjBgmuBuqoNL6nwft+ZGIcQgyJqN1NX4q8heuvCcdn/D5prmU14NaKY0FOXt8ECWReocAriNskAk5BYG/5Qeqs7aCc18zcJzKtsawWVulg4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 16:40:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 16:40:31 +0000
Date: Mon, 5 Jun 2023 09:40:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Message-ID: <jfljng2ueacz4z3ppupaiwoyyvad3klaqpigxsrjoswbzwfqfi@e2zur54udxtz>
X-Patchwork-Hint: comment
References: <20230605161705.3680031-1-michael.j.ruhl@intel.com>
 <20230605161705.3680031-2-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230605161705.3680031-2-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV2PR11MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: dfffae5a-57ce-42e3-4759-08db65e393c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Js7pFHR/6zyPkOaTrYvaldJcwMPMYqB6q6MFT3+qWZoI1tt1JDUX8xcHKahvL9oAQ+rIbIsoMwXD/jtAB6mf7rWP+RXi+KiceHhcqZAVgYyQ0AIpjI72eDqZ1VkhRYlslEJgJZpUjPRYRGQvs9EKApybrMrW6scV4alj2sNUXWXYrYwF0fNcg6+QbY9qFFcyfAt0WaU8RxB9UPEBLuux09LggVk08IFqwQnY9JaOqkpTyFWpWJCfbAJtLqDlpmtPHd3iHSZye7CsdLODh3aG/ZmRdP6qEHnXHR77NB8wEd1bk7DFPtm/0fstCFHVvX8xThrfzd3fU+Sb7fV21Uu8+j4ZrVjE9NXYt3Rtx0/6Dj3MWwnm8FQfDpkpsZZxh4pe9NoK0s6huOLk8gaddvSpkjPYmbKAW3VIvTH48N/B2PhX07UrvUv7spXNZ3mFFvCDbN1e9tWXjpjON9fWdMsnMG4yf0K0tJKAZQoe6fFhuxC63AfevxlPDFW78dpAFiXNO6rSuL7R+C981wTP3Kz8uJzI+Xh0OJazV91bUhjh8lPbH+d909ZngBkkcALQIuYc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(66476007)(66946007)(2906002)(478600001)(316002)(6636002)(8936002)(8676002)(4326008)(6862004)(41300700001)(66556008)(5660300002)(6486002)(6512007)(6506007)(26005)(9686003)(107886003)(38100700002)(82960400001)(33716001)(186003)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cB/IUY/ZD0w8Z9gubDxhnYCWeF7+l8XA7yyuvYwoLvIN+sZuEX+3CQtfkqo9?=
 =?us-ascii?Q?CNLmJK1BgEj0B+twPnNBhwSKXiBf2xxfCrTGdwTzZBUUx4/bOHk+uk8Hvidm?=
 =?us-ascii?Q?LhIBpXYC1sIT9HFORusqS3sURUxSvtWawUEOqX4wEXkOXOO037GwcdWcrrqu?=
 =?us-ascii?Q?zOIiwWdmgzr/CEFilBsa3F8fQ23bE8iAai4BDNTGWT0reJdyqC7hCaEHrGZk?=
 =?us-ascii?Q?EfDPPX9+NdmbfkuedNaUCgo/6kM6IJvjxYbGsZGmBnydkd8uWUxZQIa3WfR/?=
 =?us-ascii?Q?SYVQ3SFMKE6oEoRnVmgegOabmmqtod7RAxgzGijFmeYZU83s1mafjC1xrkYW?=
 =?us-ascii?Q?3nZvfdaAHi/0UBp57Ju12UII2dN2yt2IMDpZ9qSCHTJoVYMudLUm/0JE7Wjt?=
 =?us-ascii?Q?YJlxm6iADOe8wmxaEpB54EvdhAFmRhgeWavCgj91tGyffSMV0swVVCjQvufN?=
 =?us-ascii?Q?t4NOpc3AvynpvkXpp9Odj8Ycjb/3/N1Srz3VDxrFxFiTDBKTfMqcyKuiPojp?=
 =?us-ascii?Q?EzNGASoLQzO6vuujeYUi/1T/gvuCljckf3IErzavUHOv5GGcd9t1VlU/vbbj?=
 =?us-ascii?Q?RchrwXazBXe9i0/8Wm2CFTY8bA+XwRkVMU3M6F6YtpbGj3AVWb9ZUhOIDY0m?=
 =?us-ascii?Q?vJusHjP7v3702LGx5NnfxyhNB6yUnU37Kd7De6AxcycfIOKTKWoPyPcIdFrg?=
 =?us-ascii?Q?yrNN2HfxvwVfBpnO/9/1Xa7gDmCevJQQqlxg7IYb6PrUJLX1og0MXprCImhm?=
 =?us-ascii?Q?+vaPiyt1xXpwc/lQU6fpT7QTbBqKyws5euPlUKpRfF3PGEDbEzkGoPz5WYV5?=
 =?us-ascii?Q?CIeH6tp7lkPSgaNRdz7z2di7+uk6ooFMExgtQnbrNwT84FxIPnt/5O6W3TeG?=
 =?us-ascii?Q?/J9Ih6aVKqCnLjc6BHyEOXyDPysibc/i4/En8R+JYeY73nFPcotol53avPNm?=
 =?us-ascii?Q?pwqWIQS/WDZ8yowOsoJ1mnyicEvxvFLz9sK6aCsoMbV28AxyMJk31v5itKvT?=
 =?us-ascii?Q?P0RNShnmZZgW5cLvaJcT6xQbpUV04Q7BGMkK/ZMKBcr6forZ4LZeRNEQAvL6?=
 =?us-ascii?Q?Mx6XODsQYMindOOFT3rgz9pi/je9YSGpVyirfTLoYKKiGsE5Jx9JxHI2jn73?=
 =?us-ascii?Q?M8I/pNW9JdwbCyx3NTnAVLxBZFIhuMAGNYyx6obVtyJRDkwXY7e/SkyF58Fb?=
 =?us-ascii?Q?AiF8RqCB+kmvtj1sg+gBBd1veId633tG+MsirT5wW9KD72L6JLBaIC/L1sj4?=
 =?us-ascii?Q?1qhhwH2qkuLPmZ9tPuZ3qSUMlj6gZqRymcdYcpkTScLyQDWdgj4LbexBi+/2?=
 =?us-ascii?Q?rfvWbkcwwXb+ftBFDiBbWRSPg8lBwHQqSK5/f+tZpt2SFy5EpYL+HRZ2DB7m?=
 =?us-ascii?Q?o2Jmnojtnu6pEPYIq6ilszjJlRQ07/jjchLBpfjuIS+DHffXI7G7fNsjXpJa?=
 =?us-ascii?Q?E3unsXry2uRBCoPoZ4NHTkcPATBbK5gl4uxwYnxwfoHRxQyd99fxDrwof4HH?=
 =?us-ascii?Q?3cCMCr8rR5cP5jvUqnWzj2nxTH6nU9E3K86HQf4axl7JWqRJCXpJQRzMx52r?=
 =?us-ascii?Q?i2DfkSSPmDy7hwYUWk/QyfHYurylxOpfW2GyjDnPvpVyfNotsmj0yYezkbTr?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfffae5a-57ce-42e3-4759-08db65e393c5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 16:40:31.5891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBBJt3+2/yc878lgtp6ksT0lYFoEkZ2EYAG8WOIrUDs879RmtnBHNrVxCezP6z/Jl46dB4s36MnoHaYnzQC0UavxLnwiPnU+4OSzO+Vna38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6069
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: REBAR resize should be best
 effort
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
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 12:17:05PM -0400, Michael J. Ruhl wrote:
>The resizing of the PCI BAR is a best effort feature.  If it is
>not available, it should not fail the driver probe.
>
>Rework the resize to not exit on failure.
>

I think this deserves a

Fixes: <commit that regressed this>
>Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>


with this patch, xe module load works again for me on one of my test
systems, thanks.


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mmio.c | 28 +++++++++++-----------------
> 1 file changed, 11 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 475b14fe4356..f7a7f996b37f 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -47,7 +47,7 @@ static int xe_set_dma_info(struct xe_device *xe)
> 	return err;
> }
>
>-static int
>+static void
> _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>@@ -61,18 +61,17 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> 	if (ret) {
> 		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
> 			 resno, 1 << bar_size, ERR_PTR(ret));
>-		return ret;
>+		return;
> 	}
>
> 	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
>-	return ret;
> }
>
> /*
>  * if force_vram_bar_size is set, attempt to set to the requested size
>  * else set to maximum possible size
>  */
>-static int xe_resize_vram_bar(struct xe_device *xe)
>+static void xe_resize_vram_bar(struct xe_device *xe)
> {
> 	u64 force_vram_bar_size = xe_force_vram_bar_size;
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>@@ -83,14 +82,13 @@ static int xe_resize_vram_bar(struct xe_device *xe)
> 	u32 bar_size_mask;
> 	u32 pci_cmd;
> 	int i;
>-	int ret;
>
> 	/* gather some relevant info */
> 	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> 	bar_size_mask = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
>
> 	if (!bar_size_mask)
>-		return 0;
>+		return;
>
> 	/* set to a specific size? */
> 	if (force_vram_bar_size) {
>@@ -104,22 +102,22 @@ static int xe_resize_vram_bar(struct xe_device *xe)
> 			drm_info(&xe->drm,
> 				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
> 				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
>-			return 0;
>+			return;
> 		}
>
> 		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
>
> 		if (rebar_size == current_size)
>-			return 0;
>+			return;
> 	} else {
> 		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
>
> 		/* only resize if larger than current */
> 		if (rebar_size <= current_size)
>-			return 0;
>+			return;
> 	}
>
>-	drm_info(&xe->drm, "Resizing bar from %lluMiB -> %lluMiB\n",
>+	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
> 		 (u64)current_size >> 20, (u64)rebar_size >> 20);
>
> 	while (root->parent)
>@@ -133,17 +131,16 @@ static int xe_resize_vram_bar(struct xe_device *xe)
>
> 	if (!root_res) {
> 		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
>-		return -1;
>+		return;
> 	}
>
> 	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
> 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
>
>-	ret = _resize_bar(xe, GEN12_LMEM_BAR, rebar_size);
>+	_resize_bar(xe, GEN12_LMEM_BAR, rebar_size);
>
> 	pci_assign_unassigned_bus_resources(pdev->bus);
> 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
>-	return ret;
> }
>
> static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
>@@ -163,16 +160,13 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
> static int xe_determine_lmem_bar_size(struct xe_device *xe)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>-	int err;
>
> 	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
> 		drm_err(&xe->drm, "pci resource is not valid\n");
> 		return -ENXIO;
> 	}
>
>-	err = xe_resize_vram_bar(xe);
>-	if (err)
>-		return err;
>+	xe_resize_vram_bar(xe);
>
> 	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> 	xe->mem.vram.io_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>-- 
>2.39.2
>
