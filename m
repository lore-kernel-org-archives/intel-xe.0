Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E62C47073
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 14:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678C410E40C;
	Tue,  9 Jan 2024 14:48:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E91010E40C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704811705; x=1736347705;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EDmXObwA8jRSi8QpZ1sVRx2/9dGnk7pbGHz/+JOTKyw=;
 b=BZBEC1cZC1VnAnpnjuaFZKGIuuJj7n7cwcVfdoM1wKQ90HfN6yiH5LPf
 W7UZv8YBqc8FVPj3b26DUzWNEFKXShnEbFNxY3hRboUzKfMV593ZC3TaJ
 lMppuFZPASBLxE619JFw1orQtU5QBd0gVTLLJay30Vn3GVI6S8LQ0LF+e
 p9462KjZBo20LeXhTy3VcAVKCUlDTx1gOhVgMfIx59lJgdbWh5y85I3xn
 UI0+a4Qp3s81zPr6uyMZcUWsAagkvJvHo4udwHuCN6M29I5ZvKaPFCCXQ
 SvxaNn0IHPk0vKymfyKafScdUdlw+QyFaiqGdRuzAPGI/1mJfP2cDx6u1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="19720248"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="19720248"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 06:48:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113111042"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="1113111042"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 06:48:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 06:48:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 06:48:24 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 06:48:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSUhZdR5cMX4Jr2BZWPMf5ih/f40JRfL/XqDpHofYthYE2oO7WA5vq2FmHwKaxu+R++khPRn/qteD+wtnbUHhfkW/H7v4fAIzoDdR9KfCRhvXeWC3nIpTzydo3A6TftK6dwQOIabOJwADtZagsQosNROMjvs7IHOLTaA5h5lyynJ1wYm05r1nJkERmof1MRg7KDX311RLPbabbpZHRIfB0gw2WO2cxJvl7y/nr/U54xRZ+5o2eafcGzaXFMxy66ilUPKq0yVoQTBIDkAl19pL8nPuTsRJKdGyvAW/1s691v3eWOwbRlpnIAbN6G+5POHQg9MKFsDyHyajgClz0Uniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byNuG4B7uVVfIAQRPicBh40EjF6SCFSSjU8A+qo2hjw=;
 b=LYnQ51+oa76jqyURlDMd3ibpfZUAykttFWNWsi+uhx7MlsVuggA3AjLBASpDtaGR77R+F9SllabQBTYd6UuUwN6NEihloXSyT/X01/VGHJGmfaQ3+4jxdlzwPjbe0PHW07Z+tg0GnuJ5Ye4unB5eUOTGVsX3uhKnjizTCH9gcsWFrNV/qBH/9p2QjGq7W9JAgyez5JQvlutPSNdm8OaeHXEvULr2uWHXS5HvEms0YfHEyz9QmSvz2Ti9lAWDPAPsqgobMJymnqf6f55tnPJfmYJX5xZZlnibM0abuo+BygpxkDTdc2++OJUHXDZ13HWeTueiwR//AqAO10vlT4q3IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7784.namprd11.prod.outlook.com (2603:10b6:8:e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 14:48:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 14:48:21 +0000
Date: Tue, 9 Jan 2024 08:48:19 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Use __iomem for the regs pointer
Message-ID: <uuye6n3jd7qatzhx33ajvz6uiqdgbstbkgseiymnxnkksdmlys@ms3evha5vl2p>
References: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
 <20240109112405.108136-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240109112405.108136-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0050.namprd17.prod.outlook.com
 (2603:10b6:a03:167::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 5234584e-c964-40e7-4070-08dc1122061d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iwCp93gPjdDWmznuZmsyu+XnAAjFA8Le+qv42AUaMVXZK2GRiRJv9klmMWIOqY4vMRM5GoWMVNYtOjiY2Tf8LDbkXgVZIm0bH9uX2inyXPXQsqPOjGrh15M0N+d8E3cCk/OkBS00IaOsrVczP+AxoGipEYhWY3uFB4hhT5Axqn4hB74w/dy7QbbUynca8vPx2KZw21+8U5nPGgjHxT6oyeEOp+zcINNt4RBCnveR5Oq9ogDP+wEf/cpLYFhtewl223eadsjZZMW2TOupSPbOmBuAziajs4WhcMhEeBF9IUzqJ80EZJIsrpqy1DCrQDt2gq72cEyv6N35NVeXfNb75JfqoV0nbQiAMQZ0pxH9YOAuA8UwO4SZ8PdY5O+hbfeE2SosbHwsKl7TvLzy7kLtkNwORMffXAGFAObJOJF27tBpBrDOGnRk+q7bprQKBto1PMC7Ggi9QRGsgI4WJzvia7d/1v99LDjW5Thru8+xoYFtWENsjastjc3xGRIhJWL6EGjfSwjUaf1uz2yEVNPzEc56JUYWCO6OGTB9e+KUqZpTHspyuDRZVuMre5nbVe7MqBmbzq+Oy1/vutqTqWv5EkjqbRncq/vhN81ooGWPUpMD1iIRRstiz7k4FT73Qjjb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(39860400002)(346002)(136003)(366004)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(5660300002)(8936002)(8676002)(26005)(4326008)(82960400001)(6916009)(478600001)(86362001)(6512007)(66556008)(9686003)(6506007)(66946007)(66476007)(33716001)(41300700001)(83380400001)(316002)(54906003)(6486002)(66574015)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pMcfzNSbUd8vTMyi6e+UY+AXmC+HBlsbolHiKwyy6GAZBA1PtHfDgv6GW1?=
 =?iso-8859-1?Q?i/xmyBrx95scG003Lu12bHb0V6CKxvw8MBMmp1LLuSvNL9mdRWD7Dg93nv?=
 =?iso-8859-1?Q?iyDy+GtO/mtZUdUT4cxcTF7DvnfCM/Zjk+b5cf8m2duptiNnRb6FBlOKIf?=
 =?iso-8859-1?Q?oAy0Jf9wHuakO2kOXDPeA102kohC0Gi/Mn6tYZGy3cp6f9xkqRdiNI3WNL?=
 =?iso-8859-1?Q?tHpBrvU4mJHCYQNJfz3ZUSx1CtjIRHxoEwFaWYKTOUE3zcPVBWiCyWfKxE?=
 =?iso-8859-1?Q?9q2BevDsjEMS4UpBBWccUnDa/cKvnV4bEmg5j8VHwwk1tR10L0hg1LBgyt?=
 =?iso-8859-1?Q?ZUMzE8URi2maZHX4NDd2qKq8Xp8ZvfXm+o+nCw885PTSF5Bnk6s6GkxPjQ?=
 =?iso-8859-1?Q?yOI1+HhhLN6yYHV5/ApzCFlQAyl4GiPFO7D5RstCxrB9PqpQmYNGQxrEiZ?=
 =?iso-8859-1?Q?TukYcHHnDi0bNtg8nrbd5SGOgVguV/p68abuhbCb2hT5UNsJcVyKAXqTO4?=
 =?iso-8859-1?Q?99wcE7JW1UUkVIA4pYKocfOWvGQ8tFZJ2d31P+ZXH8YcyEnznWMa/FUKR/?=
 =?iso-8859-1?Q?8w92hZH2fmkiNbuhMhCE8fKwF8rmlj9FlxW1RmcUDjktCUt6Nr1UIWRSD3?=
 =?iso-8859-1?Q?aFbwgnmMkAJhVddy/P7TlrWU5ZTK9IYr5aOA/Pgp4B8N1dRztKBBo6xK3t?=
 =?iso-8859-1?Q?C6TT1NI8dnoNRlab+x6L6rbsxLeuyrtafll0n6X8EJ6AD/K3XilnocQClR?=
 =?iso-8859-1?Q?bl1fjjp9oFiI2pLD8tFsYHx8CPtgTNsvG3GOZHBJd6WEeQ0x2ccNbBLj1j?=
 =?iso-8859-1?Q?TRQBOj5C5/XdkNXk12o+WcjwlSWRwgaC9/SOLsxph0OEuKQULDtNVJHFdL?=
 =?iso-8859-1?Q?DpRcotPkMP5DfKBR6d6WckOrETFz75g/r1J5EaMMWnZ5Kg4YD/vB7pd9nK?=
 =?iso-8859-1?Q?mX729equ8jG8FSevBTAhi1IP2EuiBIxtzhCBwpJOvzzHEjBvma1vuINgvC?=
 =?iso-8859-1?Q?BW1In4G1h8BuJLm8ccwTX5RbnHeCZixw9x88dJB/R5wOWogy3XgegeUmK4?=
 =?iso-8859-1?Q?51nwOAZpm+P0mGFYjqfEDFHHJ0w2srtrVilyarlfWrjn7rLwK+7pR6F+H3?=
 =?iso-8859-1?Q?tnUzQppkzSHJCcYlCBP8SCAzJ5brW2Zo4T+4lOXqFVQPB71qkMkF+6ygn5?=
 =?iso-8859-1?Q?cOOcVC37i7mVYhLFA0/QFXEmUTRUk75GYAjdgY6pdd1/VeS9pWZ+kFssMF?=
 =?iso-8859-1?Q?mSEvmSWyj6BHn5lOOHN4+ZVlwbto0vvk9wBfNtaqh5IvIGAmQg2hJbvqVQ?=
 =?iso-8859-1?Q?e+7HhW9SBk8bqJIULrLhxSv6ggxc/hUtck4MwcJNFIcIC1iy2lXp87Fm/r?=
 =?iso-8859-1?Q?ZcosfnuteFGNXNkInJW6Lh1iAhWrTgwIr/SAqvqWppIAx5SPmSj/7UC2+q?=
 =?iso-8859-1?Q?B9QUhSPBP7xGPV9n+/1H3zmUvOI3INV9qIl6ll7CGivqqEz62vWhd6ZodW?=
 =?iso-8859-1?Q?Xl6Ki1hBbHX8Rjl3AKiKVUg9nhJ+pDEvDqToYBge+L1oh0kS211tLYSmtT?=
 =?iso-8859-1?Q?bFPCt3JLb/tTzbFNvMHy7L5HcThsnxYHWIek28oalN+jOtz4tNQUPrKhv1?=
 =?iso-8859-1?Q?4/8ru142XdznROh1QHzfV7DYi6JkAbhNADbubG1bBvPaspdgMhboAEww?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5234584e-c964-40e7-4070-08dc1122061d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 14:48:21.1057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhgsX2z2mrHyDQmRpmhlzQR9iPb1wMrVICoTyhXHN0Bl1oAHc6wxsdwkjj9lisvxorD1EX4SoFw+CaEnoJpuAPZ6ySnfkqwLC7T957QAadM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7784
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
Cc: Moti Haimovski <mhaimovski@habana.ai>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 12:24:02PM +0100, Thomas Hellström wrote:
>The regs pointer points to IO memory. Annotate it properly and
>fix the corresponding sparse warning.
>
>Fixes: a4e2f3a299ea ("drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension")
>Cc: Koby Elbaz <kelbaz@habana.ai>
>Cc: Ofir Bitton <obitton@habana.ai>
>Cc: Moti Haimovski <mhaimovski@habana.ai>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mmio.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index f660cfb79f50..c8c5d74b6e90 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -303,7 +303,7 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
> 	u8 id, tile_count = xe->info.tile_count;
> 	struct xe_gt *gt = xe_root_mmio_gt(xe);
> 	struct xe_tile *tile;
>-	void *regs;
>+	void __iomem *regs;
> 	u32 mtcfg;
>
> 	if (tile_count == 1)
>-- 
>2.43.0
>
