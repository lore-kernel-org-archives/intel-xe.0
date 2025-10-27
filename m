Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6D3CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 17:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF97892ED;
	Mon, 27 Oct 2025 17:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkQQXFLh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C247910E506
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 17:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761585120; x=1793121120;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OYK9IveIUqCht2B9kg14CZ4q6xarFFIMf3FUcsohc+E=;
 b=hkQQXFLh1QaJKBQ51ObtHgzLOZSa9TQHfKFwSaCEQCz9RgcOfZVF6u4u
 WMn9x9yv+Z74m0Ye2m1LjfkP8Xs1cTZLYxLV1hIMpvfUuTQWdFcaIlKAZ
 XvgdYNrdH8hilk8Lybg7rCpJxVCbBOVWnyhwxSPufPtRocn7NTNjbD0el
 rxIXjYAZLRmwV0dKetGZGanLStvdRKtw7+EsuvQg+LU30ZwNwMms4hxKP
 S3el+ruLlmmeyTHMtdOuA1X21oWdUXHRSlxvQ18e0PJ2qaN8aVmTGBBcd
 I3DqPYItbnmT3HNZJkKz//tig/hx48m8Y/Rwl/1Qh8YLjXPhBUkwvL8E5 w==;
X-CSE-ConnectionGUID: lBbKY+V2Qcufg5wn8xbmmg==
X-CSE-MsgGUID: qcBs1ozYQ4yLM8EFsiQeLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89144027"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="89144027"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:11:59 -0700
X-CSE-ConnectionGUID: 4YHteHMoTR2c4vzcPbmCrQ==
X-CSE-MsgGUID: EJWHCxvOSoO2P4WMxn6UsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184722175"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:12:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:11:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 10:11:55 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8HzTlaZywr2KKynzr9Sl+WMr2cLFyZln+YKw/IXdg8XhmSyjV39SIIipmfmAkJexHtPg0o1KDQg2SMO/hZyya8ZsOZtRqXIw8tGoaCO4zTd5oSlRnNNogCefb0qr2hhEF0GcPSdfT4LNcTFvmb7P80MaHsEPWROXb7jId10Rm4Z0jtRHsAPzyhqrDMR3lt7tmdxoOO+wkb/fk9s87KkilDgybhXoasdaG1dIWJ6GEiCQUWXu3AAscjld+dZ07L6JT0WPmu9XWbVmVu8aZ0GZBrjkTj1upgKHhQYFQBkZ6jUGsIYBjLkJkQtBZNm55JE5OHycAvOjaFC8K8rJwYoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JN6kw1fgXPTV8BAdpuHp7TVzpqUoxrpIheOIJgjjWTQ=;
 b=dlKe6HlpgZvnK/SJQu01w2KNX/vXXzUjZfVJ3tBY7+UR48VpkMsyYrWnJc8xboPaBP2cDWgQLCdaGFXXtX6hmAd01k++/f5VMu2nXO8bRmOG0TxTIxlfVzzbUGE6tTnRaYTENgAsN6grkPsfeQPp7VXWOws1OFC0Mi0AZLHfzPJpvEjpWNqpDCbm6VB11NYc4A51gqURVbMOtDN+k6aO5hinvZoqYJf1eBObaZN8IfZzoDY+cbqBhXv0b4apo7y14/05tvtX12UweDoyzoeDHwwn7ewQcRtIgNtmSCRAC4jOccyigAtWHUEvKbFPA7pClM32jjf7UF22fmB4ZxFv6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7800.namprd11.prod.outlook.com (2603:10b6:930:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Mon, 27 Oct
 2025 17:11:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:11:30 +0000
Date: Mon, 27 Oct 2025 12:11:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 01/14] drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
Message-ID: <oz7hgzvtaw4qlhgbftbkblbchlgpx4uaf7pg5ua3rmj2625vuh@umpamfhzsmdh>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251020182414.576-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: db6854cc-c3af-46b0-eada-08de157bdeb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ruxJqPS2RdIoSZQ0OQa1wFqbT7bh4yC1H1hwGUYjbeQnQaZ4Y6QafbNlWsY4?=
 =?us-ascii?Q?0thbFCMlMf9bEFzz0OB276+llWY/8QZn5xJDIsfWQAQz4RFq5WZFHRQdx/Ao?=
 =?us-ascii?Q?lyRsUTnschP8TmEH90USs3fR2Sa0HkRvljHHZdnDTuq/gXv8GYk8ghH2atyy?=
 =?us-ascii?Q?78V7JjMPLNnXSVOUkn9X08fYzgPUC2j/3Vc2DizlsN7CR0iwoPxoCHVNdUn9?=
 =?us-ascii?Q?lEsQM/UfjIimLA4Mpliic6Y5A9NiGy4qgHaGt8dUxFh9FJZVI01Ure16aNBk?=
 =?us-ascii?Q?9A2bBv1Xq1bNKlMvyJL+rNVW+H7M1Obc4e6ScmFhvA3V6exvZ/dyQ0aLi5eh?=
 =?us-ascii?Q?BLxlSxfjGmRFaVIENrIvMN6FkGBgaP/MSPz3rups6jyDpyXLPW8By9qm7HGL?=
 =?us-ascii?Q?yroWRzybXkeZvuxSrUHMUNTmQ6PLuYfb9z5JYJ6368IADzxqLkZUDuqEJzi/?=
 =?us-ascii?Q?IYSWGhlIRr06YPsfwkhTCwSpCPg2auBiCG3QuUPb5+JAx9LfNdpAV7u/vgup?=
 =?us-ascii?Q?1C5kJjApUXKdnBWFfXnNyfsJv5XDARiy+2U4GmYF8QKgQlPh2V6f7lok3D31?=
 =?us-ascii?Q?/XqWo9HLn70mkd2nSn/L03THIXNxfZC+FMd468dpsFjWodKU3a0ADNs4Hkmm?=
 =?us-ascii?Q?6nHgsnZvvO1csQSmwSgpzPdIwZkJPbki+pe0G1c7ieHyTa2/X/bL42HFcxcu?=
 =?us-ascii?Q?ttZz4LkNtY9zp+ukT+3gRor2HLNoW91oO/STHvIUMdfkp4Rql1tJ1dyHo2WP?=
 =?us-ascii?Q?3V0+S6c4IhFFGPiw01uA/oYqwCOyxahr1N86+7UTSIks1HaWg/uHZPwXjUXK?=
 =?us-ascii?Q?wEWHdMWb+R8c6RLnLfoP6f+vmi/VYPn3yD8UR4ZKMFuzGVVZ1DtYz47fCjo4?=
 =?us-ascii?Q?xylIIBBb5mSfE8MfA4/FNTTKR0yUIjl5nke5K4iaCtYf/d3v2SKYshvLTKEV?=
 =?us-ascii?Q?JQmpmAGbwg/G7q13eXgGf5m0OmL4++6FUMkhQENbggsheJ2y5sfXk3KNf4bb?=
 =?us-ascii?Q?JJX+ZTch58Is13c9piAvwLAPp0qL5AH6TYIk/jf3sSoJkhVXFUewVUGHRkcF?=
 =?us-ascii?Q?WBeFk7OowueCNj+K0V/yfuABluJiLXAB5vrXuXY5a9lMjfRbvUe5FXy/bsyH?=
 =?us-ascii?Q?LDe/3rVLktBBQP5PHxWfbMNXRoDYWvW9/M98tlQO86t3zfrJ2at4yEibnQpi?=
 =?us-ascii?Q?e1nyH1gfSf0pj6DuLNrCb58NzGrG7NgMVhiKnNb/3cDfBh3f2mY/0pjYd/2c?=
 =?us-ascii?Q?6dDVh09NAgqldgvij+P1um895LYZ9sQICDR+yuGF8UDSJLEfORzTqXw4vgwF?=
 =?us-ascii?Q?PK5YOxMee6cYqm06XeHWEf1Rsaor0+HSNU04qHcItpt6f82BEJQP3p5Zzhsj?=
 =?us-ascii?Q?e1ix5oMUiTmZL3cX55li/VZ83Ad/WvX0w5DDeXhF0wG4aJb/ZTSwkFw9cbsY?=
 =?us-ascii?Q?M3iI6+Qy+YQaGvHqgy+cw4ic7Oi+jkuqseCoSkVANo0FxcE+7e52b8yEVvIi?=
 =?us-ascii?Q?A8PJWZC/ELexqH+Sm++mmqzdqfw7FAyMFm3e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k4oeBj6cZ3Dyv/flSshxw9k3Avm7aqEl+3yjjwept/ed6zrQd66uFw4bJqE/?=
 =?us-ascii?Q?7RBUskxX3FkJRLfoHOIztWW7XO8OE4LnWkf9FzaO+oravqFeZiRZgtekoBvA?=
 =?us-ascii?Q?NQcBiQA2U1Nj7KUZjgOJLVZ0cjXXMg0DjgekNtsPfDOtdBXUbzNFIoyVG7cg?=
 =?us-ascii?Q?tpSH7bhCeYa4zJy8q67zLbI0lkYsH2LlL3UL+sMAsJa/IMjTjaNklmnDzI91?=
 =?us-ascii?Q?vZs/7Si01WYsK8QRpL22bIOt5p+pim0/VY5tm6YBp6H/mxlp/ely0T/X/tJ4?=
 =?us-ascii?Q?QWwQOD7s23LqWyqvkZFwq0eoD1ialMfCc7FEDUPaHRLIxzddf2Zh0nP3vwW1?=
 =?us-ascii?Q?+amXiXWHpqzoykws0JbZcDcfKGUfkj9irf2RS8Ex9LKk9MaBJTSaJFeJJF9/?=
 =?us-ascii?Q?/dtwh2zXmZsfagaFCLt/t70f5vw+gif8adZtvZrb70extG9bx1icLwtjxGXe?=
 =?us-ascii?Q?f7UAkhvZgRkv6lndvdfEWAxLlnb7Qgy2qVnzi5RF/5LxNTxxGp/Am8mnNVC0?=
 =?us-ascii?Q?TWkltYnWWAigUnlGEA0oMumcxK68lo2NaKZ7PLGd20j9rJol99qpm2sFAhta?=
 =?us-ascii?Q?J6xkx24LuDOSpy5I0m92Xm+grlOMmah5zlBL+xDTuBXBWQuUe+XInUYCg2gF?=
 =?us-ascii?Q?93NwYUaTs5XcKULOuaopXNlXixG4gO4Qz10XfLG3iwJpPWPMSEDBUssGKLnj?=
 =?us-ascii?Q?6Khf1lqLHLTOAD8TxRKZFkLbwxHbdbp2sMoGAfjfhTp5dgY/NYXjaWIuymml?=
 =?us-ascii?Q?F5peH48MFu2bno4qH/GaSMk1krYlJPeufSwk/pCQC750BAYw4p3lFK74XDd2?=
 =?us-ascii?Q?pviwUeaiputYni7chFX8YZyyA/6O1GxrBkEyIPAQugKKWdCmnM7+skmcOyuo?=
 =?us-ascii?Q?y26u8StNRHJdTGnvFNuVf85GrS1vE0o43YnjwCMjdQo9+IvKMBX2ZXnYwAz2?=
 =?us-ascii?Q?rHX+AEoguwJCC9F+Blx7jBm1BJo3w7lMPEm3jd5WpvF5jl8RgJSRO/PRg9i0?=
 =?us-ascii?Q?1thmV2ygLKPRilyXo3UbBMght5YvOwfrAqBFD6vg15f93DGwVU/oH/SIqUfo?=
 =?us-ascii?Q?ex8VtyMxqdnuiA3JCeMdE280aKze9sCTOPeDZWharCd9QOWBW9E7IJfvjr4L?=
 =?us-ascii?Q?0GDtKT2Gu08m7IdkygCyIw9uCsJthT7sX3CiFtFunZAYvC84GVwWfQzDJTjH?=
 =?us-ascii?Q?lfj8U5Cftnrq7qUQAiJ+f8Z0492CMbHNGK6LICroR3cC9G4xl4yOzo1/dVdt?=
 =?us-ascii?Q?KrdVMiU8L0e0iuUztNq3XOzbPfUsR8EnZyoaVHYYsm3BdXS+J6mM5q9Fur6O?=
 =?us-ascii?Q?PDCdxRdT/FWuTdnETXEdiZ64sQwI0M5uiTVE7yLt+jjKNoI1sLngd+IWIM6I?=
 =?us-ascii?Q?Bg5oYyp+5hMu2GPXGDGABMCl4+XssL/SgQyThrcYlpzmahjKtY/7t5ssApxR?=
 =?us-ascii?Q?1I+KP8uI7XpmJZfmY3a+56cTE5ofe0RskjhoN+jnYLRmiLA8q4xAYyYeS4Jz?=
 =?us-ascii?Q?qH0Jj4xBN8d3DQzygS32a4Q47tXeJ3kMyTfIHM6JPhdCSnFHRM07o0dCW9O3?=
 =?us-ascii?Q?indXkpC6Lqyf0lGDtoehhMyVQcrx9cs5WhYZmp0rr+NN4JbFzdhfkpmOdbU9?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db6854cc-c3af-46b0-eada-08de157bdeb5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:11:30.2093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OL07wxpLgvTEt9Ehu3G0mx1JWXHnee8LnQGAJVrwB8XaZShoK5PKcUZ1hZXiIrQDRxxhRghd1lYXMEQv6661bbcJAcDn+nhV8aJN2CgVjMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7800
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

On Mon, Oct 20, 2025 at 08:24:01PM +0200, Michal Wajdeczko wrote:
>+static ssize_t xe_sriov_vf_attr_show(struct kobject *kobj, struct attribute *attr, char *buf)
>+{
>+	struct xe_sriov_vf_attr *vattr = to_xe_sriov_vf_attr(attr);
>+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
>+	struct xe_device *xe = vkobj->xe;
>+	unsigned int vfid = vkobj->vfid;
>+
>+	xe_sriov_pf_assert_vfid(xe, vfid);
>+
>+	if (!vattr->show) {

nit: I don't like hiding this programmer error behind a dbg. If the perm
was set to read, the attribute was supposed to be defined with a show
method.

>+static const struct kobj_type xe_sriov_dev_ktype = {
>+	.release = release_xe_sriov_kobj,
>+	.sysfs_ops = &xe_sriov_dev_sysfs_ops,

(general comment, feel free to ignore): I wonder if we could inline the
ops definition since it was not supposed to be used outside.

>+	.default_groups = xe_sriov_dev_attr_groups,
>+};
>+
>+static const struct kobj_type xe_sriov_vf_ktype = {
>+	.release = release_xe_sriov_kobj,
>+	.sysfs_ops = &xe_sriov_vf_sysfs_ops,
>+	.default_groups = xe_sriov_vf_attr_groups,
>+};
>+
>+static int pf_sysfs_error(struct xe_device *xe, int err, const char *what)
>+{
>+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
>+		xe_sriov_dbg(xe, "Failed to setup sysfs %s (%pe)\n", what, ERR_PTR(err));
>+	return err;
>+}
>+
>+static void action_put_kobject(void *arg)
>+{
>+	struct kobject *kobj = arg;
>+
>+	kobject_put(kobj);
>+}
>+
>+static int pf_setup_root(struct xe_device *xe)
>+{
>+	struct kobject *parent = &xe->drm.dev->kobj;
>+	struct kobject *root;
>+	int err;
>+
>+	root = new_xe_sriov_kobj(xe, PFID);

Slight preference to follow the _create() name convention in xe, so this
would be:

	root = xe_sriov_kobj_create(xe, PFID);

but won't block on it.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks,
Lucas De Marchi
