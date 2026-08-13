Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DCCC5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 06:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A7E10E0E1;
	Thu, 13 Aug 2026 06:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvqwLTcE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B18710E0E1
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786603827; x=1818139827;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z0LuCQoMJ8t0wdFJGS506OUA9elKXvrqiy1XNZAoqcQ=;
 b=nvqwLTcEa74bgbW2ZGtG87hUaS+PGR2jBA8TkFUTU4aIn/PXWK0ZFXlD
 BCcG4ya8qeDyI1XJUfUuDx7fGxpjuaOExDc04a6cS9TP1CCxFq85DrSI3
 ZbqshGLoHxWP+o/eR1gLjPFQrPsuWqITzN5MGN740Po/35DOyeefDLEBA
 Q35oxiTj7IJwJLYc+XUk8KpNmZYr7IftExwkhQ4XuvgkOsahqBDl10qE9
 x1a7uBkhZY25QHac99ojBUPJOfYgOxNoEnhLK5rseOm43KzTXi67tZL5b
 Jz1rsxa+Oo04GIJE6TxnR7LF5m2kFP5gNJo1O2S0FAW6UEW8Zx/Hq+Xss A==;
X-CSE-ConnectionGUID: HqG74QenRwySn04IIaf4oQ==
X-CSE-MsgGUID: R/8VZmmWTfG/TdbgWqPt4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="112713390"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="112713390"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 23:50:25 -0700
X-CSE-ConnectionGUID: L48YloEERA22mf0iC/QzBQ==
X-CSE-MsgGUID: IyFRpHrtQdeRX0uBv4nRfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="257637027"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 23:50:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 23:50:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 23:50:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 23:50:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFcPdb/KkCZiZ6cTfjNu/i+YqWFGcfvgiimqx6HDpjyYhR+mkZoceLeVsSgXkLcEUk/JB3mMlHnqbF8uS+bpbUiQw/9BGY7vLTWjhzxzqi2A9xGDj0Ifwz/Cqa6wM017/NoyUhkhE9BKdgxCeKE/v0CRrC8WYADFpTGPOuDgGP2b4fIZcHAWDxNmDbwQ4b4G0v2Ryo7iReE18kLK7rzudRPT0ac08rHbMGLFLZ809SRcKQPN5GMJQSv7geFEj90q3NsmMkeqaPXX9hyvGwl6FkTX8HKQb7QN1EG5bJfl5A3Zb+K5IdrgFYNd2fpmMqeLnKnUM5MIJhAA6qfPNmCytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9LZw/kgQjrDqm3UW2sstw+R1PP5U5fzu5yfne6nXbE=;
 b=lQWTK1sIV36d8jR2YE1UCuPfMneNTGkMWu21bEnhPlCbeaTzYFdrfbpK/hCJGXlqS/xMIH8HBbgvrxLW+qbdxYSbbpk4VaCeDw6UKponMZ2LanQRWu/VeW1q5bW9tYbf3XoHd3t+TtHOE2y8J/sPQVyue+Q9K2dndKoSpL6VcWbxaIGDErE4ZZ4x8VVe0tp67qCYc599X8N7LScFmf48jlh4uwmyFRdkn8jHQTkLLu3qlEWzhcMFllT5BJPgQhVWsKGyAXw607a/fT7+e6R86eR/kuDAMceGmoWVPXjrDgQUaTBmcNbPcKY0LHceHson+YMz20yqSNTAP1hsMdgBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA1PR11MB8255.namprd11.prod.outlook.com (2603:10b6:806:252::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Thu, 13 Aug
 2026 06:50:20 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 06:50:19 +0000
Message-ID: <7beccc51-6814-4680-bcbf-225580abe886@intel.com>
Date: Thu, 13 Aug 2026 12:20:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/32] drm/xe: Report all probe errors using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-20-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-20-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0026.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::9) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA1PR11MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e9cf59-cdd7-48c4-112c-08def90723cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qot41g5Cmk7U7J/DnlLGE8QCMbp7bhARfsI31mfsjGjCv5kqKXPjLd9XGw34heLBAbl4g2eUQbpD1gBdWEExgGwAg3ywxl0MHmuued6+dqY+r1b7OdV1UNwovrJzi6c8PsUjNK4MB8XaNFgSyP0Egau9t/BySb72mJFBnop6p3E4CA0pdoVagk7wM1Q+sQsrT35h9r3vvtldydKH+lqhFGxtaNKHbsCX0xqxK5PYU4lmJmKr3qFNsxd8DqSnMhkbWo2wdCjNahtIs3VGXQzlTGbBtB825gketoM8ScRPg1N4OOLv9tUFAF1m5ftK05Cj64nwdUyl3Xqgu1Aa50DdN3Nk6rl+tW/dIPAU4h3VSLvjIuD3Wx/MtBosibiDpfAmg0uflB1TCsrcpN1SdCcC1nXn0ymjHR8mi29K3oS8x5oGS+fevxsfewGTB0lo4qvAoctV282MFUzf8Yd1+n5pODKkTPy5WdwGA0GpSfT87BnI48Z9rxj27RYi7/kL659Se2TDiDEfyw8++a8KAJdCMAzHoQGNl9ai8ihbbJ1z//+F0YvNZel0Fqw6fQa5R5Ld77Xj97ZC0A3jBTZruDhHDHCgdw6v9BLtz9pvCfprwtHb89t1reNsbRh2pblopZ4sSKPM7/oo2sceHsthEqJrllE0uiPzNDVp63pVUvvU04U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUxXemxqZHhjTGJ2UWRBbzhJYUd4TFJYRnQ0aWpBcU1uOTBxaUNXSDBwSGJQ?=
 =?utf-8?B?R0IxUWVvR05Rb3JuMVRQekJPdWxWU25YaC9CWHJ3enVQYXRybVo1QmdFYXVT?=
 =?utf-8?B?TWI3TjhwSitiQlhJSUF3M0h2d2xpdkJuNGIyWm5uN1hBUlVQbTB5SHdvakt1?=
 =?utf-8?B?MjhNVzlMQnVPZlRZL3lMM1pySUFSZlBPWE1HdVF2RVdFZTMvd3RVN2h6c2VZ?=
 =?utf-8?B?OUFibXRpMS9VeDR6UWdZSWlhZGthbFlKOTJ1dmQ5c1ozSkozQ3dzQ1A3eHJ2?=
 =?utf-8?B?bFpBUXkzSmhBc21JdFh6NHdzUUdRZk5ZcXBLemRxYjlrSkZXY1ZyNlJZaGsr?=
 =?utf-8?B?aGQvZE1PbDZqOUhKVE5yakZ0ZTZ6MDNDbkV4MGN3VGlzenpNL1FRK2dCc0Zu?=
 =?utf-8?B?SUM2SWZUWGJuYWdkLzNGY0JWcmhkN3pTTHlOamdRdUV1Rk9QNXRldjVHYXZ2?=
 =?utf-8?B?NWk1ODZFWjhJT1F2eVIxL0RRdklURHZVRGZXbzNmTE5GZGpLTVRIaXBaaDVh?=
 =?utf-8?B?YmFMcHNjeEk5NkpRalJueHlScUxUQjFaL2VmMlRKQ3UrNlQwSzhQeVFoZVJW?=
 =?utf-8?B?MWdNNEE4VGNWSnhXQ2hOV3lTSGJTbmVwc3VUS2VodFhpdFEwUHUycjU5OFl0?=
 =?utf-8?B?Tzd1SExFNjdTYUNQenhrTEtzMnd4SEhsYnZKbWMvRkJWSElCWHpmd0hQdUM1?=
 =?utf-8?B?ZmdGc2dPTEhwR2ROZFQxZjh4dXFTcWE1cTNGd1dreUljOUFuSHJxWGpsc0JK?=
 =?utf-8?B?SXNUYmR2V0VSYVFwVVVoZjN4QVltT1gwWWVMaTNQNkJkcklQbmZpVWZLb0l1?=
 =?utf-8?B?bXE4MVIxSGMvbVNIKzFLOFdBR21KZ1lGUGFsTFhWZ3pIclFqR3BKaXZ1UUx4?=
 =?utf-8?B?ZjNzcSttTjZ5NXF2aTFuRXFIOUtkSjQxWnQvcGtlVWlKQkhXbExuTDVrYVcr?=
 =?utf-8?B?UENLaTluREpNV05FSmFoditPYWxXekxTQnJjdGlaZm5LaTJObDdHejBROVlv?=
 =?utf-8?B?MmlEUFNSODRzZFJnQlFneFZzenNlbU1pcXU4NFNPc0QyMlFQUnNjb3JiQUFs?=
 =?utf-8?B?aXZoQ2QyL01tMlc5L0ZoWkk2ZFY0TndXNDF5RUgwVkd2cHNJY3hobThCbTRx?=
 =?utf-8?B?dGtSZU9QZkZtcHlrUjJkMk5adzBBWUhyNzdvUHhkV2l2Q2QyQ0M1YjFja0ZX?=
 =?utf-8?B?V3RWT2t6REZpVmFxa1ZHUkMyMnorRWVLQkJ5M3RmNGl6ZkI2c0liY2tHT1la?=
 =?utf-8?B?M0VwekFiUkozMCttZDZoVGo1QWVBcVdKRGlHdytOeHVHSG8rdEtHdExYRlZ3?=
 =?utf-8?B?Nk9nVC8xdnh3SWVEYTRqSmtmT1pNYUZxQXNGemJGVThkYllpWm4vb2ZURllW?=
 =?utf-8?B?S3NyL0VFZFd6dFk3MldaUGtDdUR5a1UrTVg0NlgramIrakhWN2h3cjNsa3hE?=
 =?utf-8?B?cjJvQlBkQXBBZjZWenl6bU4zdGJtWXF2SW5oNU5OVGsybWZpTUhYSjJxSjNB?=
 =?utf-8?B?QUVObjkwdERrak5SM3RQbVhNZVNRSDgyUVh5SjBMYTNrS3U2NnUvSEF0cThI?=
 =?utf-8?B?OXRXb0c3bG5uN3htcWltV3J5VFNnK29TT2gzL3VyVkYvbXl1aVdjRmJVYjNp?=
 =?utf-8?B?c0ZoM2ZIb0ZidXY2NmIvTGpsdVU3Z2FuNW1vOS9OWnBkRGx6UzY5UzJUMG4z?=
 =?utf-8?B?UW1pOS9UZ3JCcmxnZ3dXaytLaHNiUTdscFNuVTNmV0xWc2hIaXhWbmg5UHly?=
 =?utf-8?B?R1liRDBreHcxaUI5VksrMDFWajJGT0lCMVd5RTNHV2VqeDBPYU92aVBydlBj?=
 =?utf-8?B?VUhwM1AxV1BXbkZHWlpLYlhHS25jU1pIUmloaVN5T2lFVVJaWjcybDdMWXJi?=
 =?utf-8?B?bklrSExpRGhJRzhOaWFMazNUV3E5elEwR3dOSVBhS2g5a1YvbHZxZm5PblVJ?=
 =?utf-8?B?QXlnTHVHNE41bndjL3IycC9xQytGeGdnNXRKQXJvWGxOOFlYbXAxYzZPVEtn?=
 =?utf-8?B?Ukk3aXlDRHpjc282Z25rWVhzNERtYVI2c3V2VUowM3RWVnhUMC9uc1RSc3Zt?=
 =?utf-8?B?dGVxMEpvN1Y5OElscnJrb0NFRjFjUDZ2UG00Szg2cy9CVUZGeGtGQzJmNEFQ?=
 =?utf-8?B?R3Faais2M0ZoaGJXeHhVLzlEUVdjUDRFaEdMVVJIZ0VVSUpyekYzZkxQK3VE?=
 =?utf-8?B?a0Q2YktMSjgwalNmRmttQjJrbHJ5OHd6cDZIUTNyNk9Uc1pJdkJnYm12VEZn?=
 =?utf-8?B?NnlYc1RZNEhpclJxTWZXNTN6SWt5cGQ4Q1BqZkNOVGhrd0wrdXk1TkkzNE11?=
 =?utf-8?B?Yll4THEyRFc1SVNjUDBGd3djRmxmdWp1Sk9NOXUxL1AwcFl0U3I4aGdCeU9D?=
 =?utf-8?Q?A7dLJm7CDveixK0U=3D?=
X-Exchange-RoutingPolicyChecked: mZ+fhYxFMomUtpAWq6syLJprzYc7DbSNvpb/UrdfLi2GTbQVamDRtD//d7muOF+Tgj2ezb2k4MIjYJpgrWN/sclPFIJslfJZ7O8WUNGTiO8g/sEJ2L+rHWo7NKYIafst02S8WuU5jREqM57xVhylU4k9TeOrnPVws2djd+k+2YNqg2pI+5e+nkbP1y6DfKKa4oFgiOTSQ/CGTG8ZcNmeM/CuE5svSzhqB57dyVC65mM67bVI4G26R53xKduclYNll1dcHhDYt/V/NfI0SDz7B8A6yBwPvSxFRey9CzpL75tUb/YpTu4Tyxfv389vzp4Ihzo/q7Vmt+eYHJn3abrOZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e9cf59-cdd7-48c4-112c-08def90723cd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:50:19.7537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfyKohZuZY6P074Cslt8zx7aRE6M25+AF8lxebnb/kZomg89VPF+QBAh6vZdPj/+/3cjZ42HwR7AP9fJxwAeMJTi2uvrddvXIuwz7Du8kQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8255
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


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> For completeness, we should catch and report all probe errors, not
> just the ones that have explicit error message. Split xe_pci_probe()
> function after a display check to avoid reporting -EPROBE_DEFER and
> use xe_log_err_fatal() helper to report all returned errors.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b19efef1c5cd..ab4da1d9a9f1 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1147,17 +1147,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>    * caller. Therefore there is no consequence on those specific callers when
>    * function error injection skips the whole function.
>    */

nit: Align xe_pci_probe comment message with latest changes.

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> +static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *desc);
>   static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   {
> -	struct xe_probed_info probed_info = {};
>   	const struct xe_device_desc *desc = (const void *)ent->driver_data;
> -	const struct xe_subplatform_desc *subplatform_desc;
> -	struct xe_device *xe;
> -	void *group;
>   	int err;
>   
> -	subplatform_desc = find_subplatform(desc, pdev->device);
> -
>   	xe_configfs_check_device(pdev);
>   
>   	if (desc->require_force_probe && !id_forced(pdev->device)) {
> @@ -1181,6 +1176,26 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (xe_display_driver_probe_defer(pdev))
>   		return -EPROBE_DEFER;
>   
> +	err = __xe_pci_probe(pdev, desc);
> +	if (err) {
> +		xe_log_err_fatal(pdev, PROBE, err, "driver loading failed for device '%04x'\n",
> +				 pdev->device);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *desc)
> +{
> +	const struct xe_subplatform_desc *subplatform_desc;
> +	struct xe_probed_info probed_info = {};
> +	struct xe_device *xe;
> +	void *group;
> +	int err;
> +
> +	subplatform_desc = find_subplatform(desc, pdev->device);
> +
>   	/* Group all devres so xe_pci_error_slot_reset() can release them as a unit. */
>   	group = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
>   	if (!group)
