Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A974CD1284
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 22:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2998510ECBA;
	Wed, 10 Apr 2024 22:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDXl6gZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3167410EA7E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 22:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712786840; x=1744322840;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=s3Gxje/IPKugV7xHE92rtMIsm+WBN7TpRyAXgDbuW7E=;
 b=NDXl6gZ7ZYgBtzD18SUkqlt/i9+WjYHJGsJza/B9238cQV00sppBbutt
 lakMxm9EKHGw1e84ozNmRKy+uKaiPMPRs+i0UakOk73jfC4aRjZlc3x/Q
 BiIjfS2sRffUuGvZUtrS7UDHCJ9RuIdDWnnae2Fscnpj8DTxugbbUZvw5
 nvcmt6T6gwA14M/SOUAr6vKCsGW+4tvzAk6ogzuUjSFz8UOwmnTPaKp8+
 C8E24Yu2g7wiAjqXu9kI5lwE2i80gi8Z+ak0F1Ww0hg/RzBs0qN2ZeDM6
 9Ka2Pu4gcgfvqzZ9miZ7j6kvma9ywhX//YkqewS3KSO8Gai60V4sq3gbn w==;
X-CSE-ConnectionGUID: 2kOF7agMTzuxYSYE+KgRVw==
X-CSE-MsgGUID: sjgkTpkES9qpjLIfkW1o8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18782588"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="18782588"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 15:07:19 -0700
X-CSE-ConnectionGUID: 8K9lnj1STxiWcO5czsQ9ug==
X-CSE-MsgGUID: siLBTF0GTuu6M8aXmYZ3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="51903446"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 15:07:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 15:07:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 15:07:18 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 15:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pl9zCFo5i1EkZfV8XCfexZennFKJwtmN2qoApeEdTyPN0NlNPowOlBgnPGT3hhRJclkJ7BLuNfHM6rfEauVcUDXEiDmN4zk/3gZD8hGWSQqtpKWd9vAmeDAqzqm7aIi8gxuomO7AhvmTKOnzzg6UxQLFdRY+khZ/UwaFcY90833PzEUVQAU3nDgZ0uoEeNfVX5XEbYbpDgBGlBBrD2fPIYlu+NSdF2IyoZQImJjbVDFiNKhcNlsQxvdqIjEqXfjGr33jJfEtf41UCrno6BCptsKqQIwKLbyBVa6HuuWcrzBam1QSA/OPQhssISGRn936fY7KR4TnjMgeo9pU6V+R7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87ox/8Op6yZLlrIjJZ33IW85mUpEfbIO0yjSbcsk5ig=;
 b=hz5sepbBxdqe84PY75u0tK6Po4uNvEnCI0UKEDcbCX2ALT+uo3SeLsocyk6al59QOWLhHVFLZjweElzA/uUbNmjnHXo/2GyUWJaUFmjo3fni8iN/xiqozPh4LmxQ4Mw8BilO0w+HzhYR94MPvLFG6kBf2xq1lh8q6B7nnh3Q0Ye84qFqS2lXxUz20hZNAmeASJ2vtDijIBrA5oiVzOynGzpwtz40FpmDgE7w9qaoS9gWPPfCbINKInH5SfFU5RnQqqT75en+OJySR3KAN24r8XlN/mEUlhCtPc/O13ULeeXJpayR5WW8wpec7Cnr/h8OXlvXTDufVr+C4pr6y5gO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7363.namprd11.prod.outlook.com (2603:10b6:930:86::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 22:07:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 22:07:16 +0000
Date: Wed, 10 Apr 2024 22:06:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 21/31] drm/xe/svm: Introduce svm migration function
Message-ID: <ZhcNUfRi3mjYxleM@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-22-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409201742.3042626-22-oak.zeng@intel.com>
X-ClientProxiedBy: BY5PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7363:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R9Q4O5nDBU4AvtC972Yp6Uatm0UKlvNdPsRQ2IfkJ4dRn968YdybqHo/5Haw5JPpIcz03zpjmtxNceWGf0nD7AjcT/2UayB24kNUGy4zySsqAwIBLxmPhjwmVpKrQWNG4BOnLkjwP5vgWV7L+gMR+ChLmkd01ZIYGYsPX6xjpwyo9yCWp/Ju5jUe2FYufNFqseJ1He07Xa7g3Kr1XVFNCgwqTgPVZvonjMiKmGEJ2lKCedqePtzUhlqlOPEkpW8jGXi9yywmeTQ5moUtcmyRcTKEfPfaKJ7PWEK25MNiQh06LtJ+896bV+aKkdVc/4ISTHTG6hullhUqTp2sLSd9wX74ZDte3sFtqtr3aX/Jcxf/mtC4KIDopIRN9kUdnPe0G+ti+T8PMZSn0k9QkPMRp4mXGssYSQjUjsBZlEmhZ1tKWz45ur38t4mjAxos1ry3YlUsOa15bKpYVj4P1+YRSrz6Oe3U+rijXa6GTnMbNOsykmJ4w0S9H5++dT3mFQ+hTuno4/fQBhpbTS/WDrNHAPomfBbXR1ieuzL+hHaFf5fa27ul/eFF7sDMdnm87HpkWTUhBwlOd2bnUvKzwoduIZ48etwm19G02xTZxQWxqwSQRmtDFwoLSVaLaSKWib6MFczGxLK5n68DHhziJ5CZEbl9vBdf5TJEEU5P4NWZyCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2lunFOH+wE5EgB7W8mHMYzZNjR3W8NCbyrghmL2Xw0VGrYKejBQeokScto?=
 =?iso-8859-1?Q?fYM6arULk/8ULtV5jCY/7ncVw2Wv6FFIF85KYPvYm3S47vozL9dE9O62NP?=
 =?iso-8859-1?Q?v1GUSqnSNwFIzgly/3S4Byrz4Zs4rfB1AKTwQmdx77uGQtxok3Z8s7INSB?=
 =?iso-8859-1?Q?5oGt44cUiWmrGGHDc5X0SIitJdfyvFLMlqODp9fbb2pZGl6J1oMl2vHmcj?=
 =?iso-8859-1?Q?E6Puj1g8UbhxKrLp9XvHmM/KM5YGMGmOLMKVpyFfLJuIPzjkaxsQvwr2sv?=
 =?iso-8859-1?Q?zXaZJccIUNwvYHaJyWt6k4wBmVYqvzO7sh2ZyeQsN7ts0cGIDBMNiLuEBi?=
 =?iso-8859-1?Q?OacUgEoNwS4SMTnLxQdsHIHtQnhrrlqGb+yArXhbq5gxDlf1lFgVCMcOWf?=
 =?iso-8859-1?Q?9m8JB3Y8oWHolCowLN24x6Ml/ciVrFjGJ2/g2Ljuc6YKBQUxdOvGU6xaWO?=
 =?iso-8859-1?Q?I8/UvA/sWt5HS7KJtrvae/UgCHS0R5Yo80Ly7CaQSo53ACmmjkxA+gY94b?=
 =?iso-8859-1?Q?iweSEQ+jPSoAGo86tKYcQ7ka1/pNy5IYjlcL69w0GcQWSIjjnMNwDo3KW8?=
 =?iso-8859-1?Q?8pQ7GeGf9NOY2jiSFlYAA6VslbgLTfRyOVGsLTnGULBV6C6JQEfmkEO9Oi?=
 =?iso-8859-1?Q?n62x/RYvn3blIxfcYCuF/1szbEG4ywWDYgBdVNckTHqvI3Tf5pRMmtdn+W?=
 =?iso-8859-1?Q?VyLo7KxgAsTszhfvLoXURhY3KeX0IiTiYOQOYli4hJg9To/s4GtZChkAwQ?=
 =?iso-8859-1?Q?NyMC5NjZIR5yYtVejRmwi/tXo4ZlWUdZNbDb0bJuYVDbWqbLHhtnelZwyh?=
 =?iso-8859-1?Q?pnU+M2puFUBrp1+Fsgs8P/FzYJmxV4taz8+MO1jS8bRjY/7OMLsgNR+NLT?=
 =?iso-8859-1?Q?leasZPP5JEVuYkINs8c0G3tsXmNqDheyj7wYfqZDDuqcafXVcI1nV4ATO0?=
 =?iso-8859-1?Q?WwsxfMjrFgobTorWa8G8JYIpqji3aixJ/8ezbmd+/iJoKOjUgIsR7NcrlU?=
 =?iso-8859-1?Q?nJwColR4c2e0PozIIJO5ybK1UCr+rQeGHKMeCXSdxi86m7cEDZP/XZ1crQ?=
 =?iso-8859-1?Q?TkTacoyrWHdkkPosP8nfWPViZKrs8bmMGWXjqS82G2n51vn+24bDWPT7OO?=
 =?iso-8859-1?Q?cXnPExXB7zGcqiMUErIoN7Qg1bomZoCmu8CxU/oew317zG1/5EDePqxZ+J?=
 =?iso-8859-1?Q?L2UjmTMwzj7LFMr1UzSuH+/rSDmAvwrjbdRKI+NVnUFj7mNv+Q5hzMTfJL?=
 =?iso-8859-1?Q?tuw5tue/Jxfeiw2+xIqpbRhKzK5y2RjPy05zA7Zsb/jfUxPcxGxrwONi/n?=
 =?iso-8859-1?Q?kOsAW23/hnQRBG06n0a7FB1CxPP88oyMbxXkAI5NW5QSpS9TmS0NyL+rbo?=
 =?iso-8859-1?Q?iZEQX9ZBYw/rItDrAGisApiOSNxhudJab3LQ66uwKdehhHvHpQO2oiUaIW?=
 =?iso-8859-1?Q?975gocP+Q+6l7wShDCPCsXU7EyioFGWAq3RiaL+zo2gsu5PsrNFVxld9lm?=
 =?iso-8859-1?Q?W4t8+vNNcZyKuhdPVqNMeCdMU8s+5J5WGNpNFGjJt+7E6i0bBj5+bwcnnm?=
 =?iso-8859-1?Q?Q+3XjEMm5U+I8E+2WlnfXDU+80Ota4AFlG0pbbItmusG+9KxKdZS5nZEtp?=
 =?iso-8859-1?Q?i421hjZksLA6qSb7peQAUxpGHDzcW/+cEvOdsQNoB3s9SU7hqRPQEeAQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e54d3e0b-7cd0-46a0-4878-08dc59aa9546
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 22:07:16.5008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8n6rqzHRd9rulKzYqZNqvfOUUogZRb+p5VhP2CY5uzuuA9AwAc6sCgbrie0qJwvZXKQjz/+rIDvjltn9TKNYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7363
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

On Tue, Apr 09, 2024 at 04:17:32PM -0400, Oak Zeng wrote:
> Introduce xe_migrate_pa function for data migration.
> This function is similar to xe_migrate_copy function
> but has different parameters. Instead of BO and ttm
> resource parameters, it has source and destination
> buffer's physical address as parameter. This function is
> intended to be used by svm sub-system which doesn't
> have BO and TTM concept.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 217 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h |   7 ++
>  2 files changed, 224 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 82b63bdb9c47..f1d53911253b 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -462,6 +462,37 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
>  	return cur->size >= size;
>  }
>  
> +/**
> + * pte_update_cmd_size() - calculate the batch buffer command size
> + * to update a flat page table.
> + *
> + * @size: The virtual address range size of the page table to update
> + *
> + * The page table to update is supposed to be a flat 1 level page
> + * table with all entries pointing to 4k pages.
> + *
> + * Return the number of dwords of the update command
> + */
> +static u32 pte_update_cmd_size(u64 size)
> +{
> +	u32 dword;
> +	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> +
> +	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> +	/*
> +	 * MI_STORE_DATA_IMM command is used to update page table. Each
> +	 * instruction can update maximumly 0x1ff pte entries. To update
> +	 * n (n <= 0x1ff) pte entries, we need:
> +	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
> +	 * 2 dword for the page table's physical location
> +	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
> +	 */
> +	dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> +	dword += entries * 2;
> +
> +	return dword;
> +}
> +
>  static u32 pte_update_size(struct xe_migrate *m,
>  			   bool is_vram,
>  			   struct ttm_resource *res,
> @@ -562,6 +593,48 @@ static void emit_pte(struct xe_migrate *m,
>  	}
>  }
>  
> +/**
> + * build_pt_update_batch_sram() - build batch buffer commands to update
> + * migration vm page table for system memory
> + *
> + * @m: The migration context
> + * @bb: The batch buffer which hold the page table update commands
> + * @pt_offset: The offset of page table to update, in byte
> + * @pa: device physical address you want the page table to point to
> + * @size: size of the virtual address space you want the page table to cover
> + */
> +static void build_pt_update_batch_sram(struct xe_migrate *m,
> +		     struct xe_bb *bb, u32 pt_offset,
> +		     u64 pa, u32 size)
> +{
> +	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> +	u32 ptes;
> +
> +	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> +	while (ptes) {
> +		u32 chunk = min(0x1ffU, ptes);
> +
> +		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> +		bb->cs[bb->len++] = pt_offset;
> +		bb->cs[bb->len++] = 0;
> +
> +		pt_offset += chunk * 8;
> +		ptes -= chunk;
> +
> +		while (chunk--) {
> +			u64 addr;
> +
> +			addr = pa & PAGE_MASK;
> +			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
> +								 addr, pat_index,
> +								 0, false, 0);
> +			bb->cs[bb->len++] = lower_32_bits(addr);
> +			bb->cs[bb->len++] = upper_32_bits(addr);
> +			pa += XE_PAGE_SIZE;
> +		}
> +	}
> +}
> +
>  #define EMIT_COPY_CCS_DW 5
>  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  			  u64 dst_ofs, bool dst_is_indirect,
> @@ -879,6 +952,150 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	return fence;
>  }
>  
> +/**
> + * xe_migrate_pa() - Migrate buffers with src and dst physical address
> + *
> + * @m: The migration context
> + * @src_pa: physical address of source, from GPU's point of view. This is a
> + * device physical address (dpa) when source is in vram. When source is in
> + * system memory, this is a dma mapped host physical address
> + * @src_is_vram: True if source buffer is in vram.
> + * @dst_pa: physical address of destination, from GPU's point of view. This is a
> + * device physical address (dpa) when source is in vram. When source is in
> + * system memory, this is a dma mapped host physical address
> + * @dst_is_vram: True if destination buffer is in vram.
> + * @size: The size of data to copy.
> + *
> + * Copy @size bytes of data from @src_pa to @dst_pa. The functionality
> + * and behavior of this function is similar to xe_migrate_copy function, but
> + * the interface is different. This function is a helper function supposed to
> + * be used by SVM subsytem. Since in SVM subsystem there is no buffer object
> + * and ttm, there is no src/dst bo as function input. Instead, we directly use
> + * src/dst's physical address as function input.
> + *
> + * Since the back store of any user malloc'ed or mmap'ed memory can be placed in
> + * system  memory, it can not be compressed. Thus this function doesn't need
> + * to consider copy CCS (compression control surface) data as xe_migrate_copy did.
> + *
> + * This function assumes the source buffer and destination buffer are all physically
> + * contiguous.
> + *
> + * We use gpu blitter to copy data. Source and destination are first mapped to
> + * migration vm which is a flat one level (L0) page table, then blitter is used to
> + * perform the copy.
> + *
> + * Return: Pointer to a dma_fence representing the last copy batch, or
> + * an error pointer on failure. If there is a failure, any copy operation
> + * started by the function call has been synced.
> + */
> +struct dma_fence *xe_migrate_pa(struct xe_migrate *m,
> +				  u64 src_pa,
> +				  bool src_is_vram,
> +				  u64 dst_pa,
> +				  bool dst_is_vram,
> +				  u64 size)

This assume both addresses are contiguous if size > 4k.

I don't think needs to be the case when one of the addresses a sram
(dma_addr) as we dynamically map in sram pages into PT entries. i.e only
VRAM addresses need to be contiguous.

I'd suggest this function take from array of dma_addr and 1 vram
address to maximize copy efficiency. Also add a direction variable too
(i.e. is vram the source or destination).

> +{
> +#define NUM_PT_PER_BLIT (MAX_PREEMPTDISABLE_TRANSFER / SZ_2M)
> +	struct xe_gt *gt = m->tile->primary_gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct dma_fence *fence = NULL;
> +	u64 src_L0_ofs, dst_L0_ofs;
> +	u64 round_update_size;
> +	/* A slot is a 4K page of page table, covers 2M virtual address*/
> +	u32 pt_slot;
> +	int err;
> +
> +	while (size) {

We might not need this loop either if we make the caller enforce the
chunking (i.e. cap size as 2 MB or whatever MAX_PREEMPTDISABLE_TRANSFER
is).

> +		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
> +		struct xe_sched_job *job;
> +		struct xe_bb *bb;
> +		u32 update_idx;
> +
> +		/* Maximumly copy MAX_PREEMPTDISABLE_TRANSFER bytes. Why?*/
> +		round_update_size = min_t(u64, size, MAX_PREEMPTDISABLE_TRANSFER);
> +
> +		/* src pte update*/
> +		if (!src_is_vram)
> +			batch_size += pte_update_cmd_size(round_update_size);
> +		/* dst pte update*/
> +		if (!dst_is_vram)
> +			batch_size += pte_update_cmd_size(round_update_size);
> +
> +		/* Copy command size*/
> +		batch_size += EMIT_COPY_DW;
> +
> +		bb = xe_bb_new(gt, batch_size, true);
> +		if (IS_ERR(bb)) {
> +			err = PTR_ERR(bb);
> +			goto err_sync;
> +		}
> +
> +		if (!src_is_vram) {
> +			pt_slot = 0;
> +			build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> +					src_pa, round_update_size);
> +			src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
> +		}
> +		else
> +			src_L0_ofs = xe_migrate_vram_ofs(xe, src_pa);
> +
> +		if (!dst_is_vram) {
> +			pt_slot = NUM_PT_PER_BLIT;
> +			build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> +					dst_pa, round_update_size);
> +			dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
> +		}
> +		else
> +			dst_L0_ofs = xe_migrate_vram_ofs(xe, dst_pa);
> +
> +
> +		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> +		update_idx = bb->len;
> +
> +		emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, round_update_size,
> +			  XE_PAGE_SIZE);
> +
> +		mutex_lock(&m->job_mutex);
> +		job = xe_bb_create_migration_job(m->q, bb,
> +						 xe_migrate_batch_base(m, true),
> +						 update_idx);
> +		if (IS_ERR(job)) {
> +			err = PTR_ERR(job);
> +			goto err;
> +		}
> +
> +		xe_sched_job_add_migrate_flush(job, 0);
> +		xe_sched_job_arm(job);
> +		dma_fence_put(fence);
> +		fence = dma_fence_get(&job->drm.s_fence->finished);
> +		xe_sched_job_push(job);
> +		dma_fence_put(m->fence);
> +		m->fence = dma_fence_get(fence);
> +
> +		mutex_unlock(&m->job_mutex);
> +
> +		xe_bb_free(bb, fence);
> +		size -= round_update_size;
> +		src_pa += round_update_size;
> +		dst_pa += round_update_size;
> +		continue;
> +
> +err:
> +		mutex_unlock(&m->job_mutex);
> +		xe_bb_free(bb, NULL);
> +
> +err_sync:
> +		/* Sync partial copy if any. FIXME: under job_mutex? */
> +		if (fence) {
> +			dma_fence_wait(fence, false);
> +			dma_fence_put(fence);
> +		}
> +
> +		return ERR_PTR(err);
> +	}
> +
> +	return fence;
> +}
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 701bb27349b0..98b480244265 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -101,6 +101,13 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
>  
> +struct dma_fence *xe_migrate_pa(struct xe_migrate *m,
> +				  u64 src_pa,
> +				  bool src_is_vram,
> +				  u64 dst_pa,
> +				  bool dst_is_vram,
> +				  u64 size);
> +

An option we be export xe_migrate_from_vram / xe_migrate_to_vram and
then internally call the function I suggest above with the correct
direction agrument too.

Matt

>  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  				   struct xe_bo *bo,
>  				   struct ttm_resource *dst);
> -- 
> 2.26.3
> 
