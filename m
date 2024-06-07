Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F6DC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 17:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6738610ECDF;
	Fri,  7 Jun 2024 17:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHFd5nx0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A2710ECDF
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717782316; x=1749318316;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fAERDkzpouF5hw7YguMs8UsXT6zqKsS53FzWEa2ig5U=;
 b=FHFd5nx03a3Np3AW8D6dibcyG8O5WK0D535mXHd7pX+m/yU+OtXIKsED
 DzAIUZgpJQHQVUg3fhAUWSGX+MzgJmtl6ZCy5ZGc9ZchOEVoD/mKa8c9S
 KZ2SgzOcQFNz/XZNi4M44M7kUBw8I4mCHfeXVnh/h6ZSTvwgHskrRveFi
 PY/7U5D5dDXlMGjd6BDAeoP1vWb+2IXvzP4K7bWGJmUtzhs72wOhW+lA4
 bdO5/m2AMi3SzCS2GmgN5QlVJ7Jx7zhmBSSE3mt0EoiUc0cN8nDoWgzbY
 ZhdNrfEgdzzxybzmPYgBul4aQHwUnT0heAwmWU8ZPWHETmAVPX1gHj75f A==;
X-CSE-ConnectionGUID: 8k3qOER+QOOS7zlfTxNW8w==
X-CSE-MsgGUID: 6Y5Xdl7TTbqRRZbx+7AJVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14751226"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14751226"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 10:45:15 -0700
X-CSE-ConnectionGUID: e7taekFZT+6+eJQ/Q3SquA==
X-CSE-MsgGUID: diMiTrmHSlSKJu/FRPNX9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="69560793"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 10:45:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 10:45:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 10:45:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 10:45:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/7JVv46OXVIlZGeypU+B2T3Rz73psrP6ylaYCe0O/FJngwMXpQhVpmuExgmZLM5tYvmt5lh/9dXK3VWTwb5+XwgikAdSmbR2KZEUUyjMfq3wBOdMGL8IY2ICF/bW7sd9Ix+v9mfVT2Xj6GIzZVv/9CEL7TVmGnGZ3UPaUanbEQ073VINrw/+R1IvEk0GACNLEbVZK6riHas8GRo19mj6V7EbEzS7L6+NbAZZZIBANNjEZE1grwA0mL5jQca4a8Pe33z1ajwLXG+MwZ9kdvt6buBzj1mivgOsxsX5GBiWsuZTjaBb+sda3018/hU4oOzoretKaOluiYyhonNqf2Bag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIU0QUpWzZva7bsCxXYCJrmdK/kKoWkGLC7JYD75Gu4=;
 b=fKFkCo1Dmxy5MUoteMugLK6j7VWvsMA3PT6hLGJcYY8w7mIlq42qSD5EDH6rMo0PrtjCIN+PC7pL4PcFOPR7QrEyEsJD8SOrNEfAmiwQn6GvkJIJkgtkPejOmHIDfPFZtkE7dpsVS0AdldIl7l9arMuEpnYGvCzPWygh5u/QvWkgcBBDBlH5qCc191j6rwq+vL1i7IEp9mI/OinuLo9sERM+1w1xr0arebmlPpFp86KVUHVVSn2EtoukJyB8aTGMQqI1IGqLmg42ib7ZEKPDaFdxSx0/zeT7bpFfTdjACIieLN/+bdlOce/i5CVP5QuDf7a+ECPo/VcXNAecgB491w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4686.namprd11.prod.outlook.com (2603:10b6:806:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 17:45:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.036; Fri, 7 Jun 2024
 17:45:12 +0000
Date: Fri, 7 Jun 2024 12:45:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <ashutosh.dixit@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/hwmon: Remove xe_hwmon_process_reg
Message-ID: <2vidvodng6hykwe7bsdf32ew7glhkptmh4k466ylkiucmsxyd7@gvfthfkbzcpw>
References: <20240523182540.2777895-1-karthik.poosa@intel.com>
 <20240523182540.2777895-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240523182540.2777895-2-karthik.poosa@intel.com>
X-ClientProxiedBy: MW2PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:907:1::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4686:EE_
X-MS-Office365-Filtering-Correlation-Id: 297ecbe8-e723-4273-9fde-08dc87199503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6YJXDlI8bOckZzxAU7OAi55p55c4HfX3XcIAKlqNiVKTdLY4YknSOJ5LhK?=
 =?iso-8859-1?Q?NLxGkgkquKcKlLWdskyjPqr1pUm4KFrhqzFIjG3r+TCk9JPBQVF6LrNW3Z?=
 =?iso-8859-1?Q?l46FWCJ9nrFZWxhoiz9xACASa5jknn2E/LXMZtOnjqRGKuCJWMmsZjy0C5?=
 =?iso-8859-1?Q?3x0BgXzGZDaam7YLqaFc5ezqD/lUEZPRiioWtA3EXwSHNszGTx/RyutY1+?=
 =?iso-8859-1?Q?DxUIy5zqYfve5/zs+HlH9H1yHgbh1SJA5QVxMlcC50HAf0SJ8I0gRmIlh1?=
 =?iso-8859-1?Q?Eitj+33fyQ3w46Z6oqIKIZy+fICeO56mmlUKxhBjWqK9nH20ZtpzOII0tK?=
 =?iso-8859-1?Q?efNQecZ0gEQk0zzJssFXeqRhQdZ9HxyFcby0VptRN6tt3ALRChTtP5hPye?=
 =?iso-8859-1?Q?+NWyQx+/ODK2DU/Xf8OWlMbhw758vVou2mgjbSo52d7LYgUFwBkruYQuYV?=
 =?iso-8859-1?Q?OBgG8cWUuFRSd1geAN2sF62NtdZF6G1WiV+cc/sOUjButPA92ITIlUVaP2?=
 =?iso-8859-1?Q?JxTsJY9bNbOE3HejFGrXGrwGdxfSUVkWgj1PuK7HTQ8xCLs3RUpybF/ecB?=
 =?iso-8859-1?Q?JVo8+acdUC5syMzznCrlK8ORjFg3l2d1/9mbZk/iyPVNuuWL6StWb1R7Vz?=
 =?iso-8859-1?Q?tQIfa8M60AjaMzbg2fkMZXMakZmL0ikjqpEZnoOXmXNE0NySJlZd7h9oeI?=
 =?iso-8859-1?Q?bgONQt+Vkzu2SEZ5Las1706znJ7Ao9APZjadS0WWB+FOP/t7Qc0JALcGfv?=
 =?iso-8859-1?Q?Uf2GnVG+zzGEiM52V0lgHV9zLT1ShBB5ERqFDlUmxaqDdXmJzYsrnvTITy?=
 =?iso-8859-1?Q?WwYe/qfKdqEfC3s3VKgTfh6vh8Tjs2oosxYnAgEKOz1hBRVra4rlfjv6cE?=
 =?iso-8859-1?Q?VMUuWpysM/JRiNloBd6BstIz4Ns24qD3JNaZbPYu2smy+5CMYzZTlYnVCd?=
 =?iso-8859-1?Q?KJ0De5BBxx1Qb9uKP5UMb+BCpy/h69jczkiADxCXLHiILFhD9V2qxCPNNm?=
 =?iso-8859-1?Q?8OtD9RfeQZIPILf5cbWsQyCsia4Y2jKctYQHkcmyQELhMprdY7JhFEDsy+?=
 =?iso-8859-1?Q?eYzrkOlWrYY+oFAXHEgZTxe0y4ltUkte0Th9mYkt9qRxqIFbtE9iZv7grH?=
 =?iso-8859-1?Q?Xb8RE1qdoTCSi6PvcJ0oxfky61wHr5SHr9VVu9TFuWR2l2wsRV+YVal6Fd?=
 =?iso-8859-1?Q?Vk1kv/OOAR5nNgFTpVUwzGNJXxY5NZs+wmV0NlBgfyzuKYqxfaqmFeB8TT?=
 =?iso-8859-1?Q?3W95QNwszPxUZMLXaRfwovWgPMMqkuA78vNE2cPheUC7TFAxF+QhddFVfd?=
 =?iso-8859-1?Q?tR/bR/9kUZWzw+WnV3d3kVlLz/78SoRg6nndQuyZsBClhYCnNq//FECshi?=
 =?iso-8859-1?Q?kSZd0J77ES?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5NMt1Be1thfv1/DOoNVPG/GKn91ks0GGpiNC/oXuxkl9RwJq6vgt3u/aXn?=
 =?iso-8859-1?Q?1m0BKbs3P03J7FLFd22YYH74wisd9RTv+gFfnNF8k4jQjdgjujT1zgDtKQ?=
 =?iso-8859-1?Q?LxJGrM5UCnXV0DPVNigPjmliUjG2Tni3zkPkmkwfZrCIRm7VXU66KiNmtE?=
 =?iso-8859-1?Q?u8iRD9rlML8HXDoGolmSPnJTrcVZ1kKbK5H/7zFNXG1zcl7eQgS0NYCzSS?=
 =?iso-8859-1?Q?MU8MBy9CqkdN7hZyS1yST+b8Aa8cbqDa4ERyi/PxQcCWnCnAOLVd9zlahI?=
 =?iso-8859-1?Q?IEhbSdKjxJZoCPE/xR8zfK6RgRmDRh9F5tci3njSJ+EN6ThLq6GjrHouHj?=
 =?iso-8859-1?Q?m8Udg5d/49Qxa0hPgXTbtvbRnQR42xbEywuYETnbdk9QDarCENt9zeUEL+?=
 =?iso-8859-1?Q?G7uu2Jua1KUrY2O8I2zS2PUPyD2hHny5/eI/GMdJ6JxZXyEo6FPoMNW6uO?=
 =?iso-8859-1?Q?gbW8N7vFoy5MbCond3vrWcJHgYicnRcKTQjlenWjhGt4hilBXsAbD3Dzic?=
 =?iso-8859-1?Q?iz4DpS5PCjkgvjwA/Fb3UbKdVnGX6sv6h8t+0/ub5Ii55VS0eMmWftr/tZ?=
 =?iso-8859-1?Q?YRzlGNs7uA+Lx71OaJaCW6Fc+k4w+J91pqx7bMToWB2QRC62dkUQG/Re0w?=
 =?iso-8859-1?Q?Y+gjwr5LCfy5go3Zeb2QsTpUouvEYxTSoGyr55tjIdl8JjZRvoMGfzVzb5?=
 =?iso-8859-1?Q?MZBQJH3RWkSOM83mg8HI4x7HHom/IhzgN8YARq2hYL0IzvPaL/5gvpjtmb?=
 =?iso-8859-1?Q?M9LYI39qLeSMEm4V3pJHZ8k61NgNi91bzBYFxfwbUGnBb++gd25kQeLNgY?=
 =?iso-8859-1?Q?YhHeV+SB+YZr71Demy9PQRmfwRgM9qIzlAJHuFMTRBWENACp1QKFw6uPHs?=
 =?iso-8859-1?Q?JxdgoURoQaTfd69PUcGpFUC9PG8EdyfHfRxc/cIj3G6o5oTUfqusRqedIl?=
 =?iso-8859-1?Q?ekyzzcehETou21K3i68Oc9R9elnwMfSOxQY+sO2puAcVWJnKVFkj0zFfg6?=
 =?iso-8859-1?Q?ws0zG+FynkhATAd3HgQC7SJbr5FRsHLA6eqsI7XJ5SBhro6Y/8bgVNodvo?=
 =?iso-8859-1?Q?UNmF1mUmH+fivOhyXHcwMnbb6QUee1LaLE9AxTGkkB9NNuyExMgbcNLMiH?=
 =?iso-8859-1?Q?DgdrOG57Y4INa57og0JlVGW9Np5EiOlkMzy8QbHRAZ3+38mdQEVRlsldiB?=
 =?iso-8859-1?Q?BtJsgTt5KCcLbc/OktuDtQiZKjEgOp9BpqlLybAy2uGQJn1f+2AlaFh2nF?=
 =?iso-8859-1?Q?nAxY0yZLTQ+vx+45/RQt5Qh8Be/AAl/OHk+gCxt2WpojTfAt6cfRSM0iLg?=
 =?iso-8859-1?Q?QIV21ckXcIyxsJKaE74QoqGVk+L1O8gmnNywkIkwYs4FfZkkCmcNw9HBTs?=
 =?iso-8859-1?Q?vmB2NqC8zjyEwlxI+WUQzVHlnVXoD+veS2sHnC7A+PaSh5yn0UH0dW5YmE?=
 =?iso-8859-1?Q?WYVdQm0B1/cae5Q7iqKOCGVbqwNA/TJrpJBTRzbcvNxZj34LSrFNXeivWD?=
 =?iso-8859-1?Q?pk2guO4fe+Z6R1RRHbPv6Wxy/Cr3elyJjBrkpoTFWWRzi2/sHAC1CrQoyc?=
 =?iso-8859-1?Q?yUCRUPGHhMOHtSoEZr1HGAMQbqHHoUqXJ5oK9mUtR/t4vHFfi1+LcpOiET?=
 =?iso-8859-1?Q?k368zqssf/1Ed6VnoIxKtVPVXoowq4ns5lx5pgqZc3yHrMsHFssTzaJg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 297ecbe8-e723-4273-9fde-08dc87199503
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 17:45:12.6430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsWw7eekdWT+Y7dOb+iSiFDNeC9fwHUUNk39YBfIm2fI7ZXgNNV4Jv2dCEtQRHcyf7Z2ZrQ2NpPXKBSNlfvWVg9c74YZkLLPgOuK/dJ+Oho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4686
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

On Thu, May 23, 2024 at 11:55:40PM GMT, Karthik Poosa wrote:
>Remove xe_hwmon_process_reg as it is a umbrella function which can be
>avoided (Lucas).
>
>v2: Improve commit message (Badal).
>
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Badal Nilawar <badal.nilawar@intel.com>
>---
> drivers/gpu/drm/xe/xe_hwmon.c | 80 ++++++++++++++---------------------
> 1 file changed, 31 insertions(+), 49 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>index dca275117232..4d8ee9cac068 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>@@ -121,34 +121,6 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
> 	return XE_REG(0);
> }
>
>-static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>-				 enum xe_hwmon_reg_operation operation, u64 *value,
>-				 u32 clr, u32 set, int channel)
>-{
>-	struct xe_reg reg;
>-
>-	reg = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>-
>-	if (!xe_reg_is_valid(reg))
>-		return;
>-
>-	switch (operation) {
>-	case REG_READ32:
>-		*value = xe_mmio_read32(hwmon->gt, reg);
>-		break;
>-	case REG_RMW32:
>-		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
>-		break;
>-	case REG_READ64:
>-		*value = xe_mmio_read64_2x32(hwmon->gt, reg);
>-		break;
>-	default:
>-		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
>-			 operation);
>-		break;
>-	}
>-}
>-
> #define PL1_DISABLE 0
>
> /*
>@@ -160,10 +132,21 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
> static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *value)
> {
> 	u64 reg_val, min, max;
>+	struct xe_device *xe = gt_to_xe(hwmon->gt);
>+	struct xe_reg rapl_limit, pkg_power_sku;
>+
>+	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>+	pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>+
>+	if (!xe_reg_is_valid(pkg_power_sku)) {

shouldn´t you also check validity of REG_PKG_RAPL_LIMIT?

>+		drm_warn(&xe->drm, "pkg_power_sku invalid\n");
>+		*value = 0;
>+		return;
>+	}
>
> 	mutex_lock(&hwmon->hwmon_lock);
>
>-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0, channel);
>+	reg_val = xe_mmio_read32(hwmon->gt, rapl_limit);
> 	/* Check if PL1 limit is disabled */
> 	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
> 		*value = PL1_DISABLE;
>@@ -173,7 +156,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
> 	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
> 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>
>-	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0, channel);
>+	reg_val = xe_mmio_read64_2x32(hwmon->gt, pkg_power_sku);
> 	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
> 	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> 	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
>@@ -189,16 +172,16 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
> {
> 	int ret = 0;
> 	u64 reg_val;
>+	struct xe_reg rapl_limit;
>+
>+	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>
> 	mutex_lock(&hwmon->hwmon_lock);
>
> 	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> 	if (value == PL1_DISABLE) {
>-		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
>-				     PKG_PWR_LIM_1_EN, 0, channel);
>-		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val,
>-				     PKG_PWR_LIM_1_EN, 0, channel);
>-
>+		reg_val = xe_mmio_rmw32(hwmon->gt, rapl_limit, PKG_PWR_LIM_1_EN, 0);
>+		reg_val = xe_mmio_read32(hwmon->gt, rapl_limit);
> 		if (reg_val & PKG_PWR_LIM_1_EN) {
> 			ret = -EOPNOTSUPP;
> 			goto unlock;
>@@ -208,9 +191,8 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
> 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> 	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
>+	reg_val = xe_mmio_rmw32(hwmon->gt, rapl_limit, PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
>
>-	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
>-			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
> unlock:
> 	mutex_unlock(&hwmon->hwmon_lock);
> 	return ret;
>@@ -220,7 +202,8 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, l
> {
> 	u64 reg_val;
>
>-	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0, channel);
>+	/* REG_PKG_POWER_SKU validity is checked in visible, we need not check again here */
>+	reg_val = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel));

what do you mean by "is checked in visible"? Is this about the visible()
op?  Maybe a better comment would be:

	/*
	 * This sysfs file won't be visible if REG_PKG_POWER_SKU is
	 * invalid so the check can be skipped. See <function name doing
	 * the check>
	 */

in any case, I think it's clearer to move the get_reg() outside and have
something like:

	struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
	u64 reg_val;

	reg_val = xe_mmio_read32(hwmon->gt, reg);
	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);

rest looks good and those things above are more nits than anything.
If you are going to change, then respin once more. In any case:


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi
