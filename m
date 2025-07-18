Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A801C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 21:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B7110EA45;
	Fri, 18 Jul 2025 21:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZ59mlO7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCF510EA45
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 21:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752872581; x=1784408581;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=m4LgT1yJReiyKx/yJjmXmU98lwtcAW93u0Td9jI30b8=;
 b=nZ59mlO7D7Z2R7q0Dx14JNcfdu4q4oFMAi+nWLMaBSVtQbc2CUi6XPky
 QzOuIBIevIfCYQ8kidZut4AVGuiofBGGA1jxLvfKc4Nf3kYq37UHZO2qk
 r2Z2GbLD6KWkc9PPChCIk0HoW4baE9v9+zrEllpNwQpxq7QJd0KgfPniq
 6yNm1mtpy+kARyuoN1p8oh2o4Tow11g681oDRuI6fV68oZfw/+Kgmr22g
 OqB0hxzLcI+XfhFI4aUTjmPBcpCUHPNintrOBJ/k5Ff5oRyRKcOzJBMyU
 t2p/SfaroW32TrcrqbyDPLTgQZ4SU12zatASQOfjUiGdCqO7/S7bW5/8L Q==;
X-CSE-ConnectionGUID: oFSmpuWqSMWeUt9dydYqwQ==
X-CSE-MsgGUID: +frHtGgySQ6jtlFUzVACGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="66521846"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="66521846"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 14:02:51 -0700
X-CSE-ConnectionGUID: Y7bgDuH7R9KgQR9YvQIUng==
X-CSE-MsgGUID: 9bt4HTbyQzOamxLP5ARSvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="158306708"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 14:02:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 14:02:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 14:02:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 14:02:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMfxoQIj94uC4l7rJcqKx5KTYd4iNu4CK2zNopOboZ2A5DfgIxYkScUVFs9QENUIRqXCJWnkkYoLS9gB+iUsTa7xhl3yaRssD+v20bTGnTVyA8VKV9I1yUvQcP5py9NZcH6KIW+7V3c/BaPdt/OP9iU0le+JkMmjKQlwu+o5tJayxFOShXqSUbhDBr94rPTVZaykzgdbSp3gxVQ0wEHfmgXen+geRQn9d2udOtvL78PnEN7erS0PRAqVl3pyMWtbxTndDLuFLCB2d/KnQJiAVJKzL1WHQfEcIdDIstuGNPM2ZLIz0H35XuO0T2epdWyplqg6wd2sn8hbg9yFj4T8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdSjE/ar+HULrGPmkOBgcGKobQLwSC/xHlZo8cu+6vc=;
 b=oYi2hUqb+OrC1qir1a0HDNsf62g0Hp0LDLv87LzfOKBLJGctmjJPW1KguAQQNUKO6f9LGKlWqrgvNAixbq4lWOC7TimzE1meGSTdgeNU502aORVurBsW6b2Wryzc9KbV2j4PGedN4WBwTqe4xzZMmvuM01n17HZjpFbQCEz1DlG5r+168Wkey+/lL2g0h83XJI1PTpnsk7dC3uy6BmeBvxkg2Wmaocdb+kXXeP8fNIPCVuB7+uUxvarbheIZRULd8Sh1RWLppW+oM0NfnttPLLgWnOv753b7ufSoMMx4zFK+eeeZmu8qdGdBEzcnhTWIbhs8i2txdHEHMD2wPDnGaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5246.namprd11.prod.outlook.com (2603:10b6:5:389::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.27; Fri, 18 Jul
 2025 21:02:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 21:02:13 +0000
Date: Fri, 18 Jul 2025 18:02:04 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel
 VGA devices
Message-ID: <z2afycgzdbkxtd4cuhk55uzzbfp2ixkalcxzjrlg3zf5tpf67z@7zcomckvka2o>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-5-michal.wajdeczko@intel.com>
 <4giwyvxxjwwopctdrugqgnwjdytushpvumxd7lbmzobg2bamax@nuegb34lc4qi>
 <828bb2f9-e486-48bb-9d88-75c54a370640@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <828bb2f9-e486-48bb-9d88-75c54a370640@intel.com>
X-ClientProxiedBy: BYAPR06CA0053.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5246:EE_
X-MS-Office365-Filtering-Correlation-Id: 5846d9cd-4b25-4a46-d015-08ddc63e5e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WCDqRO6iFmlIF7yiRbZ2RFhyuZW0eO4DQDO4ka/ywGCX7/F9DAHA/dIdpm?=
 =?iso-8859-1?Q?EeSYKMvuI4h8TqkfoVUUsf2iThmwoNGsmFR++NEJWkPJ5QhHV1cMBIlEak?=
 =?iso-8859-1?Q?zJ8MNOyDzFR0T1xs1Dgx/Cgcl3robtUmwn81siqDtw7Togpfq+tZhi5qJO?=
 =?iso-8859-1?Q?YiwOGlU3nTh6SKTWKSdnXxnQIFYrgJBgAi+tfv5Qp1g6eCdDAGLihJPnzU?=
 =?iso-8859-1?Q?Iy/2Of0Kf0hW2wun8bzzf6LkhjGkBFyNsySEVVrfViQFv0dVI8zXzSbiJq?=
 =?iso-8859-1?Q?0Pi7saefxYjEXUhKHHZN3X8eEHLTmjWFZCMrcCkPtRG0fdJBMzfy1sg5k5?=
 =?iso-8859-1?Q?RjoKpOYMnLbu3kQ4KI5WDMqTYSfkAjt4X5p159Z/rXM43YelLpFipXKRUf?=
 =?iso-8859-1?Q?TwWk1YjamS0eZW91f297ROKacgHWBjsr+Q/gvRakeh5bzKRjnCgTOdq83Z?=
 =?iso-8859-1?Q?wkCEIcKOpfCZQFsxeCOxiZ9Pm1XFiidU6Ebhx/LshbCo61IaD4itMksgMO?=
 =?iso-8859-1?Q?bt0/8Qf4VQ5d2O8Zb0C2Paiy/TQ/NKM/9hW4BuWaQ1YNg+xiXMV9iNG2O0?=
 =?iso-8859-1?Q?sTqRh6BVYtM2MvEYaxFTODkfGuPrt+Us7uUPzyTTxkjkddPJQsxd0Ua7i7?=
 =?iso-8859-1?Q?V5ZwYfQPhrjUR7jsMdpzT/vC/Lk9lc2cNzHmnJZb4BoymsaKeIx9JKv042?=
 =?iso-8859-1?Q?yntgLM8/qGjersHz4fQ19fjyqOMVc9WylziGSuuI3VE6PdpHvQQnZeuoMT?=
 =?iso-8859-1?Q?0hWRO6mUIIrd3sI287ka05be+rpb9/0/JWiRurFt1GiWwzqBAjJDYlKKdQ?=
 =?iso-8859-1?Q?TasveOu+8qIpL4xyIvNqHNMUmM/7KUWhB9gdHCVS9yCNO6/d7+oL2MLMt/?=
 =?iso-8859-1?Q?cfg73a09TaAZd4eLAzh3DzV6YZMz5GtBAalgc1O1App+7gjHyAAyqzHa8r?=
 =?iso-8859-1?Q?VOpJa1Lux+2P5cNgTHJPbW5YeJKycRiNBdTnMA1QqtWowancg4dVwabnXm?=
 =?iso-8859-1?Q?7AeAuyl9ZBwYHAbYxzVgEI+LbwCc0bu2xjkita0jgsWGWYW/S9FtltCAqX?=
 =?iso-8859-1?Q?oYJVL/lC444rvZznQuBgj5YhasWSR0OhnR5KGwdvk9OhQGKDVxwzce/zYq?=
 =?iso-8859-1?Q?OFSQs0KN8MX45XwTSvYdNUceTJyeghr3JwKqxqFWOcjzlEbUtp/PBxeSTb?=
 =?iso-8859-1?Q?KQj5Ka6se4NwALUk95dg63qxHJFcTUtZQ/7QBzqUo2FUA/c/ss9SaUfOL5?=
 =?iso-8859-1?Q?Lu+G2zv1Wi7LgyH+cl4O/fKN4MnFdu96M8H/hr7q3S62iqpUTRNgQiSsPK?=
 =?iso-8859-1?Q?JtQFZS0UC0HPp6iJUlUchy4XhxAuj0DBQz6b6U34nhlW4Qsz6xOleoEdB6?=
 =?iso-8859-1?Q?vq6Ltjj1/2BMRHOQjbBRArzXIbTgVTEJQvSBCPDx4+KpTGIcEWqZ9Kzawg?=
 =?iso-8859-1?Q?Rlrg6ya5FTb/5z2wVkZPWCz1fOH0uBpCmNvSuyTxILTZlnPW3Xr8VPbPO6?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xqRijjgEjHDkILWIos3KhHR1a754gKc+C7OKb41PlEGl20i5r8Fln+jka1?=
 =?iso-8859-1?Q?dYB/5K8WxaNMsvQjGStA2QerIFh52qfGPzMqF6UXKWfGkbJdCHE6AsEdfE?=
 =?iso-8859-1?Q?8WLo+oZbiKeWrQANbRgkxNaA8F7/QY6jJv/EpO9M+IgOtaL+iWqNLjp2B7?=
 =?iso-8859-1?Q?a56EWwYZxvWASqhNuuFxG9pGMoe3T7Fizhc5Bpey96VDnamf2vFm4rNHLZ?=
 =?iso-8859-1?Q?iQr8emqMggabvP3wD8JDaGkFl6Nf0qGFs9YEoJxFQPKPs5nuyuuU9z8Ai4?=
 =?iso-8859-1?Q?VY57e/QhsLPD4rBQ9ie0pW9AgHrfgcE2ClOrnUQPqVixx76SW0uvDEJ7OI?=
 =?iso-8859-1?Q?Ufn7gt9y76/0Ai3n+lJCicax2hsr74wOJpzzrdKXiWZm5ZoZBGEZ+G+sBD?=
 =?iso-8859-1?Q?O1dXSVpPFEPIfx7Z89xrtSbBBAu6J646ORDyRs08nI/4e3l+AHvdTiSp96?=
 =?iso-8859-1?Q?nwFrPhAWJz/W0oQU9KZMbw7V8+tMsdplB9e4XJ3kPzL96FVCUg4uI9FJrc?=
 =?iso-8859-1?Q?SWfxle9MGwSXQSAZgp6TuO13EoAGOn9UdIuRFLadyZ874ufaLmsH9htWTi?=
 =?iso-8859-1?Q?XGmK87eb/rxi9W9TYlPUphY6cxDMgPo7H6ZIaHui7qF1k0xmY9twXMyxHL?=
 =?iso-8859-1?Q?F55ZC5NO0I9aNiroZ0UkuIF3tInBnGFIiH3bPcqTBCZd2TUf4gXyq7ExJH?=
 =?iso-8859-1?Q?hmRjwdgRCx7Zis5pDSmHjUtPVTXXplQPu2pLtLicjfKdyGtOLRjRzOudUV?=
 =?iso-8859-1?Q?/da3JfF9ikMsxiZ/rmlnORnhulyHZlUVCb85VZVrivRUQSflRRDfty0gmn?=
 =?iso-8859-1?Q?kOD/Qcwleug6J/5Yd6d8shJvJeAKu1wFzH5PE5V9VQA12BNC21E1XnrPXy?=
 =?iso-8859-1?Q?8wEOzo1VgsZz1CELTzKPXtC7MKCAJa1zoqadBO4ZHAtIZiK80EWeo9uciU?=
 =?iso-8859-1?Q?ImRXWsSs/42rtK/JRH4SMn0XIcDV94ovA2GJYUwEdxbMvLT048qtesgzTr?=
 =?iso-8859-1?Q?BbWM+2wRS9NPMzPgnCVj4Mo1hqyeFfmYsLz6kFqOFKVLm4vdaahwfrtIb5?=
 =?iso-8859-1?Q?9gu+ou2Qp0dQxmF5FSGbXh1Pq0MlNBIP++1ARRxv6snERz2Op3Yd9Fn1N/?=
 =?iso-8859-1?Q?f68QIf1cRF/5YxpuvfvH8wg1dBQBn1FpiDq7kHjrzAVOxrSZDfrl3vaN+v?=
 =?iso-8859-1?Q?Q0uKavhWHok7OzdRXyxYJy3hWZ/b9FmtQYr1omqMcyaCz4+zoO5CF110HQ?=
 =?iso-8859-1?Q?Q9e223wn+dJb09qBynkg0/u7VFUTten7hM9pmiXaKUNaOWIHMnwWhyRI4h?=
 =?iso-8859-1?Q?ik9i1/FNHdP8Dfb/mrKuoKEODso+c9QMj8KEekQ/+tuxpRlnw9GFbtrpHd?=
 =?iso-8859-1?Q?yQPJweUOmi62yrKA+FZv7HMy9t9Ol2MIvMm28X7MnZf2n+rUgEmGD+f0YS?=
 =?iso-8859-1?Q?YNM7TT+ox6NHkpxUwkzPNguKykNI/TIg2Xbu7ZPjtQPKvXkT7GoHTA9ZCF?=
 =?iso-8859-1?Q?XH5dwddvcNkn7csc96tIgPVuXc101Yfy7ni+Jn7kgaoCwbTgd0dSiaR+Lv?=
 =?iso-8859-1?Q?DCoWxxC1ZE4L/QkNqXtMYg1QaWlDsLoxqWS8R2dLLxyP6pywa2R1ymlmI5?=
 =?iso-8859-1?Q?rVnu4GhSquC7b8yG75fuN4fIjPDlSnBopfxsW3IE/dAMvIRNsdHx3tXA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5846d9cd-4b25-4a46-d015-08ddc63e5e9e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 21:02:13.7252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANKrZnIg8RgDueIMgVYpBxLes4ttRTYMQnXUCcwKVGBTBXG37DprN3RFItnJUX7ZZUC6Cufo22nEw7OkTEnXVv8RzEr1VoQCT9xvqD20H14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5246
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

On Thu, Jul 17, 2025 at 10:51:36PM +0200, Michal Wajdeczko wrote:
>
>
>On 17.07.2025 21:52, Lucas De Marchi wrote:
>> On Thu, Jul 17, 2025 at 08:48:24PM +0200, Michal Wajdeczko wrote:
>>> The Xe driver supports only Intel GPUs devices that all are PCI
>>> VGA class devices. Reject creation of configuration directories
>>> for PCI device addresses that are not Intel or VGA.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_configfs.c | 7 +++++++
>>> 1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/
>>> xe_configfs.c
>>> index 00bb4e412c12..1df8cce78f13 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>> @@ -260,6 +260,7 @@ static struct config_group
>>> *xe_config_make_device_group(struct config_group *gro
>>>     struct xe_config_device *dev;
>>>     struct pci_dev *pdev;
>>>     char canonical[16];
>>> +    bool match;
>>>     int ret;
>>>
>>>     ret = sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);
>>> @@ -275,8 +276,14 @@ static struct config_group
>>> *xe_config_make_device_group(struct config_group *gro
>>>     pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot,
>>> function));
>>>     if (!pdev)
>>>         return ERR_PTR(-ENODEV);
>>> +
>>> +    match = pci_is_vga(pdev) && pdev->vendor == PCI_VENDOR_ID_INTEL;
>>
>> although not officially supported by xe, we had devices in the past with
>> class 0x0380 and (I think) 0x302.
>
>I can look directly at pdev->class to check for all legacy classes

that should be ok.

>
>>
>> is the goal here to error early on typos that cause the config to not
>> "stick" and now error/warning to the user?
>
>they would stick, but what's the point to allow user adding config for
>the PCI devices that we will never be able to use?

when I mentioned that they "would not stick" I meant something along the
lines:

sudo mkdir 0000:0e:00.0 /sys/kernel/config/...

		 ^ typo here on a system that actually has the card as
		 03:00.0

The user would expect that configuration would be set on the device, but
it's not actually applying anything due to the typo.

My main concern is about maintaining these kind of checks in the long
run, when we enable new HW, having to adjust multiple places in the
different parts of the driver.

>
>IMO since we error early if given PCI device address is not present on
>current system, we should also try to error early if someone enters data
>using PCI address of not our device
>
>> Maybe we should rather have a
>> positive indication during bind that the user can grep for in the log?
>
>that could be added independently as a confirmation that driver noticed
>specific configuration was prepared for given device:
>
> [ ] xe 0000:00:02.0: [drm] found custom settings in configfs!

fair enough, it can be orthogonal to the check here. I'm ok adding this
and if we end up needing to adjust it later, we can decide if we drop it
or not.

thanks
Lucas De Marchi

>
>I guess individual params, if different than default, should be logged
>on the go, like something like this one from engines_allowed:
>
> [ ] xe 0000:00:02.0: [drm] GT1: vcs0 disabled via configfs
>
>>
>> Lucas De Marchi
>>
>>> +
>>>     pci_dev_put(pdev);
>>>
>>> +    if (!match)
>>> +        return ERR_PTR(-ENODEV);
>>> +
>>>     dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>>>     if (!dev)
>>>         return ERR_PTR(-ENOMEM);
>>> -- 
>>> 2.47.1
>>>
>
