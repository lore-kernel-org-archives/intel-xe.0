Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6519FCA0FE6
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 09:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3413D10E1DF;
	Fri,  1 Sep 2023 09:21:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629CC10E183;
 Fri,  1 Sep 2023 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693560096; x=1725096096;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iDLouPmpG++Xm5KuUse/+PTUGXbwbDupvjO50fbk8wE=;
 b=C5FmwvqxBs+XbDiQapONgQRpN3EFGn7+L8CYhBeL1kuGUc2FsKVXWaot
 0dNXyjVz7kVt5Y/3AFvIYf72cdNUVHu2QGidY9rCpaq8861ucXnUnnTcS
 7Ac3fGGvBiI5Qyt3JmLk9mjLmd8vS+lLlvaFrUOzul+8Z8NMy1nr0mLNj
 D36VioyLfPfErxY9aA3NxjC5eJ1No5RfnwnthRw0tM175P1AFpg2cpVA9
 6rblJ/+NQcFyVC0ebBdHUV6Nm+wylx3UqPmfRKutwhlAfxOzUiHj9d9ah
 fC8DLwfexkzL7VPKZI/CHhViWIZhSuoHj9vLW8Y05WP2+re0Rp1KjywPM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407170863"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="407170863"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805379323"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="805379323"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 02:21:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 02:21:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 02:21:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 02:21:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 02:21:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKBfH7GZWA+/SVwVY3UCS0lakAAp8FjDuqbD9qlmoyQXTQUCZUWz1L+gGgcYRL3vUcQ6F6ioKN+hy1OmEGUcm1z8CMiSXuSyswcoadSwgr4xqf8aD/pcxc7MVoXO4RASwbrdlxFaMUDyn8ZYQhyoUjS6wiX/VrHUl3InDWDDiVEBu/EJCttb5o/LAUC3zdIrsIknwq5V5Z+zv6v9W3yg+gdnMl+eGtcYtjvciTYa1/XSK06hToztaGlk7x/GlAAnRbzyGi9GElO1evaYkIUoHG7LMaEQI/B0CfqXWPwmpg5qALM8wS7Q1UGkbH+ZP+9u9Nw+Bm2DFTy4nFJpBMcRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDLouPmpG++Xm5KuUse/+PTUGXbwbDupvjO50fbk8wE=;
 b=KrFF473tMVLrXC6Irk2Ols0OM2sC4ZMICT2G451ZXNrRVnG+LZ9Enulo6WGWPSGg6c6cSP/nkF7VLFRbtT1JcxKZo4yluyMCSAhdBIBaAYKMbsjEZnJHf8EZeH5htze8RPrxfSkspvVl0E/9D4hVSjSEecASVOCPRcjEFrPio3VIuTtmDiHc0dSVFptNiaZMb8TMP4F2rTPE9I/BPlMTzz+9MOq5CPgazxL4WJneAfLsKhyA5cdxWaMjIa7VtdmQfKn175I+4tq+1WB25x08aI+vc8rw6htECOVsxDyDSZTMiBLHL49m+i1OTLlmhtkVTsgm0jVWFTQUJnyJ2t4bBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.27; Fri, 1 Sep
 2023 09:21:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.035; Fri, 1 Sep 2023
 09:21:21 +0000
Date: Fri, 1 Sep 2023 02:21:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <73mgfju4usrlbao3ejqf36joimrp722pgnydmxarf6hvg5gu5s@no2ox2hlqgpj>
X-Patchwork-Hint: comment
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-2-lucas.demarchi@intel.com>
 <ZPAzB95lw3vSqgan@bvivekan-mobl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZPAzB95lw3vSqgan@bvivekan-mobl>
X-ClientProxiedBy: MW4PR04CA0353.namprd04.prod.outlook.com
 (2603:10b6:303:8a::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: b184855d-1d91-4b47-559e-08dbaaccce5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f0RkmTr2wuofWfwPkjoqngP1k+5d2i5bzFrCMmOGjh0WAS0TtiaAThn39HbjAKlyyGmNyAXdGk6FNqXbJbCZ+kfXKyZlORniJ4eA+QJZPhD/qnI4A3Q6AW7jhp9kTZDSN6ftSA5OTUeP9vf8VRH/WufuTvmuHGJokxV9ZmSZXlnzBq5y6cXzFtIZ1V2kCiIskjRLqth8OinqdWw59oF119TQhDe4BuDfcoB4hKSciD9WraR+Vvrobt/s1NnXT/J7rmqOV3D17Oa4eVRw+2hgQRn70eQ3h34tRS9LPTQ7T2hcp7ptAyrBvqmzCby1T7Vxicc+6b1NIOO9IjRHYmFCvx0kOBMNQQEK7U3GXuTk5lihnkF8KGzH5jW7R6aZCvHPGGT62bk01AcmeGuu9lIik7VgUgzdCntgz7YcijXcqbMmj0DRUVRWRgTLToUSAkt2qZQ0tU3cc0UXEKyAZSQBZujNO3DTDjZkQQzEDhSowl2xq17VF9wKmI7cBfC7GsW2PnDSo78uXc9Ow1BfyvGh6kKvMRbH3CAarYoan5Ugz8fPt1fq7K84fUDIIaLDQtRs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(366004)(346002)(39860400002)(376002)(186009)(1800799009)(451199024)(41300700001)(316002)(33716001)(4744005)(2906002)(82960400001)(26005)(107886003)(38100700002)(450100002)(6636002)(5660300002)(8936002)(4326008)(6862004)(8676002)(478600001)(9686003)(6666004)(6512007)(86362001)(6506007)(6486002)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9rQxd71m0rLhMXQ457prjzLGRxLDoJQhA99RXnZP+ebmZU/cp/7dKWnFZKMU?=
 =?us-ascii?Q?D7k107dAyWsi/Wag1nBsNl9Qmap0t0x3LGik90LR3Zda6lTiJ9yIvkSaz4/Z?=
 =?us-ascii?Q?+//S7075SOFrnu9YOojW3fDjFOdrHqOn9aV0kTvGuYhNhcLPHmo27URY9m6Q?=
 =?us-ascii?Q?SZlREQRZBh/szCxVBpm7NibGkGhHGZBoiovMLHj9slRSnG8Eycno74a555Ws?=
 =?us-ascii?Q?OXWbjdFdpzr1uguzhxSRiThWdTgSBNAgqJ/dPDyr3K1hCF/qziEfpxwnNSFO?=
 =?us-ascii?Q?K1eM3zPJVOwAdU4AfvzDirfE4Aiq8Ty/2h/WnNLqSySUHw0SR1ke4vNMld1c?=
 =?us-ascii?Q?nj82gRrMgbDB/EExd4z1U8/PXzXo1G8IJA3iJuU//ep64j4bzRbm9jPzusXB?=
 =?us-ascii?Q?puquxtDLjIZIT6sXezLCpC8KRjk9q2Bmiy1qaB8MnQNXXXcvi4JOMdW1gh5z?=
 =?us-ascii?Q?OOuxLGrG7YDUBlFv5fu4aIN2QsuKqJfHw1G7t847iI9A37xzH0w81vhPaj6H?=
 =?us-ascii?Q?Qteshnzd7yS2hdPuR6/3SPRJloEDs10TJiZ8tOR7lDCTe9N3wMnZPXV3WIWx?=
 =?us-ascii?Q?cCxUNab5U1NN6DBIpf6fHjsqAEfq2r8s/Q7t7z4+DDEREumwH/QPb2Qr0sEo?=
 =?us-ascii?Q?WwqHrDmU3WsffRunmUF8XSQdSzsCD0dZYl4ilw1DmnvMR3gDqFlf4ZnUpQ8l?=
 =?us-ascii?Q?6Bnt3bxHygsONQ/i+G0rfZ0FbL60Bg5MFxwjIzS0jjVYKcrsy/q+mcvRXK8v?=
 =?us-ascii?Q?K45LCN+Pcgft+Iot5oYpTNSXgGlvmX2pJpPeOY1OHLZC3R9g138SNMmko74B?=
 =?us-ascii?Q?VYBwKxQzfSgKnJWADZ2Ltg+3JQDUPhwlF+jTDl7q9N0gg5nbC5/REZvqPkW2?=
 =?us-ascii?Q?lQlDSbj/u02DLab0mE/6KddhcuLTBg2hHXuAyLr2DszDBzOVMbSVQplljzRg?=
 =?us-ascii?Q?QCHZQZzryVYfjF3n/Ct1lgQ4LtC3OCdWltGTTigSScAh5cQcECTRYBztO16t?=
 =?us-ascii?Q?Y07AG5DZA8/SNA6662/4q0K+XsxqboTleW19vtscnlMsoWE1C6uV7Zxit1F3?=
 =?us-ascii?Q?TUfCPrYfxp6SNIAYde1A5f3aRPmfpjpCTrEpnRnlTp9RfVJ4/rxBZjNU3V67?=
 =?us-ascii?Q?J/lb7UZHKz6ttkRwmv8Y74fHY697lW/W9RkZqMA38KIjfT0dBW9B2s6+GZqv?=
 =?us-ascii?Q?jpmlGUTXKAsAKgp9BA765AQNkIEaTbk2hZuyR969a3ihz4iQDjVFMrKAYJKW?=
 =?us-ascii?Q?zFfaoY7EWAmvAA7eVst1N5+McIqfAujh/D1wDWTGEmVLzbam3/wdm2wOLEJF?=
 =?us-ascii?Q?UZ85PUJgSTVppxnsc8SgVZ0N6JlVsNKzFlFFEjAfbad8WwhFJvwCMZDsdEkB?=
 =?us-ascii?Q?kvzmesAhVw5ynodaufHhzTmhQVHmypj4lSbMSADkROv5a7sSCqFiOR7k1J0V?=
 =?us-ascii?Q?UWt1YuEsA9lXqlM8nDJq4xznOBFbh2C6cs5PTdtt1DSFA4ANqiDfEybvXV3a?=
 =?us-ascii?Q?S8ts4c8V+2FQ4cC7Q4NQEFlh37NK6OxRMs/ixKO8FLRq6KZ1RwJX/JszWRRC?=
 =?us-ascii?Q?GdbETUbgGTlbxF7JaWW/Qratf6MCLHPdz/NYp0PtDsNUtf1ftbc7PqemWhku?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b184855d-1d91-4b47-559e-08dbaaccce5f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 09:21:21.7010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bio82Uei3AfDlO6tzN+IE5MgvyehZhnXznWdMH3mltMevGayznTDxX5OHRFrSUZu1WLBkdLJL8zI3tIi/dDZnypZUoQlrYZACid0w4s25hE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH igt 1/4] lib: Add xe_pciids.h
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

+Rodrigo

On Thu, Aug 31, 2023 at 11:58:23AM +0530, Balasubramani Vivekanandan wrote:
>On 29.08.2023 07:11, Lucas De Marchi wrote:
>> With the introduction of Lunar Lake, igt won't be able to just re-use
>> i915_pciids.h for both drivers anymore since the support for LNL is only
>> coming with the xe module. Copy xe_pciids.h from the drm-xe-next branch
>> (up to commit b9c9020fc816 ("drm/xe/pvc: Use fast copy engines as
>> migrate engine on PVC") and start including it where needed. This brings
>> all the LNL PCI IDs.
>
>I couldn't find the commit hash b9c9020fc816. Is it lost due to rebase?
>In that case, does it make sense to use the commit hash or just keep the
>commit subject?

Rodrigo, did you tag the branch before force pushing? If so, can you
push a tag like the archive/* ones? This would allow people to see the
commit referenced, even if later we force push the branch.


Lucas De Marchi
