Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7084DCA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 11:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D9810F02A;
	Mon, 12 Oct 2026 11:46:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1220310EC67
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 11:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791805585; x=1823341585;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=czTw3BstpHSWxwl22i0/lsenNM9Gh/1+DJSc4Mmt+E4=;
 b=Owke6whFSxOUMS6w7Hj0HQLqQ/1Dwr0cIfPBPeSZcggWGILxq3wPtH1Y
 the7ihqteSVd1VGm4piOMKMdoYvfwBdXlcC0XcUKoDEDch/Qyp31c/du4
 lFWqbFuZh6PlQP8sRGxM/H7mwoFKWbqDk8tqeS67817rUTg/eiHLWhAeQ
 9SapvCQOJFVciQjCDBr6eLEWo88AUlRavu8tGicZUod6U+s+gjINkCuFd
 BI7G95Lrc00Xf2DuI5E1ZoRyICL3+jMMcHEAQyywz6nSOlf32RfBF1PTj
 M29elG3KKaevtC4li5gJpqAODqyERltjEvSC5e/k7u0QLCtkW3x/vCDZK g==;
X-CSE-ConnectionGUID: OXczxLeNThCArKEdhHBNaw==
X-CSE-MsgGUID: pAvE9nbSSNK5jPdpK6I9vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="609887"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; d="scan'208,217";a="609887"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:46:24 -0700
X-CSE-ConnectionGUID: 6Tq/KhMrT/SJRyoRa3S9Sg==
X-CSE-MsgGUID: BhLX/+1aRumpo7xoMrkz6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; d="scan'208,217";a="843622"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:46:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:46:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 04:46:24 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:46:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWk4cqgfELncLcWJ+66nAMfBop0WvlHzaFXpWqTAsSs0l5ObpnG9uRfg9VK3ksIPzjsY4rjWaPwTCWwAo+fNqHAV9nnIzLf3sXdk6YmAPsxr6EMdSfD0cYemtpsYDq5SJzYXxDoKGv88gaFtbxRKbftEt7Fx6aVPzB80Q7CxHxnR/daDgmFiCYf0PUiPQK1HjLx/suEC1Udi4Km6AumhWjmW8yhBbKcWyyOKeDtsC4J5TVHy64rlsfobPNmEB3sBbOoO0/mqQRlUISn57hBXxnmhWw8OTcjsxEQxJshdnTdNuVQEkviYsZic7C9fRVL/ZDar89fxYrVNkh3XrXnu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TESV+ADoiDRN3B7gyMlS9bWkYZWWn1nQbQOpJSNLb7Y=;
 b=Ze44iuYmk65IgizJwVPl5ciacwiBlrj5iW/9b/GsVYQ1mRgmBkJpJcuBTZP6oo+TRCHG/hoihwGhcN1huywpywPYpxWndLCWyiUFzWbv1Of1i8OVF51X+iu7WAGFCl5qCilYGwPsWVDWKSvIY8EGeHG9VCcGXmi5YI7gJ9poL85lR68xHKKXfZqsEoj7u3gRYW46vjxlPiI6UZFH30+ixPtU2JGoGGvJ6mJrin5zIjzKKEJdB525i36KFuz45XdFTPuAcgiYqIw+ppBnq//1UJPmg6eSJudL5656xt/WNZu5UTq4AsHb2AWGPXwKRNEUa3wzVW/mi0xnAsSU/MI0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 by CH3PR11MB8561.namprd11.prod.outlook.com (2603:10b6:610:1ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 11:46:21 +0000
Received: from PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b]) by PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:46:21 +0000
Content-Type: multipart/alternative;
 boundary="------------mmMZw9v00zk00s2kF02CWe2j"
Message-ID: <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
Date: Mon, 12 Oct 2026 17:16:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich <dakr@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: MA5P287CA0250.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::9) To PH7PR11MB7145.namprd11.prod.outlook.com
 (2603:10b6:510:1ec::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7145:EE_|CH3PR11MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 5041e0d3-ceb1-4e71-bf5b-08df28566f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|8096899003|10067099003|261009220027099003|261009223327099003|261009221227099003|261009221727099003|261009223027099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: VV3raHDVBEBjKqPyDqjRYYfLoCbrGHQ914RWjbLsoZWtfsi2bkmUHdOcobLgQjSaG78xSrn3EvLDHpHr8ITl1b2vVfV3hwqDrlSHu3+9Ue//QbjYJIRymP6tFKpk0tj8qjQ6mV7rFHYs1ZXmM1rlIdXq2BrkxMQx3LyNgMkdsDV2qgU9UD9xN/LzTNGwvSK1abGA04cN2zfmmtcYroGH55eW7/ZwF7mmPEXnD5g6CFCu9XavaS4AI2kYvvaGBoCB6FNLIusul1yCFJ5OVFDV0643P2zyE2qCJhQHNl9bKPSbHcZPFo97eFOjfLfqSPE0N2YU+YhZsOBLs8oKz1uRN+WQ0e7S6tEf8pnjC1FpXTMi3rtO+fXq0GO65ETr3tFV/9MvlSvOos72HIPICJQ8ktUmrCX3qxgZcxduQcsQn57RWP9im5pHo0DPatiFgB1nBE7jepU4PO/Td37W0Jck7Ugy+AfkmBkErqaG3e6F/+BxZPrKkaOz3PaDtocuf/GWhePHtP0dyqaDmgreZ5kJWENzfuYyEcFDD8EYBGm8f92qoqy6vBkEVe0fSw8QUxJljA2xa7DcyxE5WFvKSwOgbY8MICtzabmZfuTm83HrcAcSjBu1/+VMoJ0iHYC9BTPaCo70p+R4/g6nJs40IpIrUJQQmo0O7yn6Qw5qWZfq6KI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7145.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(8096899003)(10067099003)(261009220027099003)(261009223327099003)(261009221227099003)(261009221727099003)(261009223027099003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0wwYXpaRnl4TGhuS1dEaFVJQnZCcHJiaGkxUUVjOXQwMkJnTVFXYXVIcGp0?=
 =?utf-8?B?MmNBRVFONDNQcVkraTFPSWZFSVNLTU0xcXFNaGFZMGoyMG1kbkJIR1dzeGRE?=
 =?utf-8?B?Y3gwMUpUUkdJbGJvaUpFOC8xMGtnQTFXMmw0SUtBdmE5L0M1YTFmdWdmNWM4?=
 =?utf-8?B?UHYwOHNENUgweFJPRzZMbmtTRCtBVlhTclhBQzNZQU9jUXo5MVloZXg5bi9m?=
 =?utf-8?B?eW5EbkZEZHM4Y3drM1lHWGlnaThvaWV1czJhemhYRkVhSlZxQWVuU3U4SnUz?=
 =?utf-8?B?c1BQNXl6Y0VPR1duRE1ZNVZabXhkRHBxRGlyVlFnem4vajNNZTBuRmlWVGtV?=
 =?utf-8?B?ZXk5RXR4SjBUT2k4RXFpSjJvY3ZoVStUTzNnK1dwMkl2c1VjZkYwZm9VSXVx?=
 =?utf-8?B?dDIvbWNpQkp0cStmd2l0Rk92aVdWUFBPQllzVWpick1BcEpMYW5xRXdqbm1T?=
 =?utf-8?B?K0JidnR2bllOT1RMYnRjY2xhQjhGQmN2ZEJOZmxaSHNuMU1MbVoza0l4eTNM?=
 =?utf-8?B?VHYyMUd2OGdMb2wwMmswWG1LeFZoNndodXg3M3drMXNvTHZrOThYc3BsSDdo?=
 =?utf-8?B?dG4vaXNZR3IwcEg0T3kyK0l2eUpTS05Ma1FxK2tlRWVBaEVnQVdSb09raU5B?=
 =?utf-8?B?QXl2TmhWbVFEMzNlSWJIT1Y4aEVBL3VZUFA2OVZ6UGlDeGVlaTVYSTNmWFY0?=
 =?utf-8?B?RmoyVjFmUTJpM2xSSVJ6S1lyNzYvSUV0OVhrb3hvcDNMZHU3NXoyZ3hZYk16?=
 =?utf-8?B?ZlNhUUxGUWhMakF2bVBNcTl4S1NnQUovOEVmYWRSTGFoVUpSNSs4SWlneG9w?=
 =?utf-8?B?ajNuUTg1YnY4RWxWZkxvNm11c1ZHQTVlNFA0MGVieGJ0eXplNnpQcnJtSkpB?=
 =?utf-8?B?eWltemt6SzFtTy9Nbi9iRjNINm5DbXNOWWZuOFBWWDNhczBIcjNPL1ZvYUJ6?=
 =?utf-8?B?cDhGR1IvbUJaWkgzK0FYRk9sVzU3dzlZUVc2Q0pXWHdycVVVU0grZkVyT3h5?=
 =?utf-8?B?RGt2S2JtODdsemZ3aE0wTFVBc3E2cFF0RGdlTjNZamJLWGVadU9XbWd4dlI3?=
 =?utf-8?B?RC9GVFd2WDhCaUtPcWRXQmpjR2NZWkVZWWFBOE5CQjYyRU9DcUFpcmhrbUhO?=
 =?utf-8?B?N2ZQZE1IWTlIQ1U3eU9rdHJpeDNiYXdHenFuM2dXSnRYZ1JnSG9vdGVKU0J1?=
 =?utf-8?B?SzRFVXY0R3Rsa3NDY29QOFU4SDA1WHJwaGcvZktmNHVyZ29iWlhJdUtaUGZV?=
 =?utf-8?B?d3pyekRqRExOWFROZ0FKREVhdTFnY0JTN0lWMXJZeEVWZlpPcitBMnZQdWFW?=
 =?utf-8?B?Zml2OUxRRVJwTjJOTWdmNUpINU9hMUxzV1Y2TmJYN01ycmZNMTFMYVltQTYv?=
 =?utf-8?B?UDI0dkRBR2I1TnFyUnhLY01ocDF6Y3ZEcU9scFlTMG83MnJqMkorRzI3YW9k?=
 =?utf-8?B?SGNVWnRYaFFqYnBhQlFLZSs5NHZ1UGFlZjBEMHhiRUhjY2ZRUXp0NGRkTmFt?=
 =?utf-8?B?SnFyMGtPRUpzam5XcWVGbFpRQ3V5TzlIMHQrY1cwTDRHaHVvTHlpbjdpZ0pR?=
 =?utf-8?B?MUpvQmZDdUFHcU1maVYwYzFvUnU5dzRBbEk2bklwTUpKTWNwR0RQbUF5TzBq?=
 =?utf-8?B?S1QxNjdSR2lsYW9CSWhKSnhBR2NuWnJKVzN1UU1GWXdUNjF0MTZTOGVOMi93?=
 =?utf-8?B?NHRxTjR0OUhWOWdaNnhGTTRqSWRGT3d5eDNpK092Q29zQldzZDJ3VzNQZkJn?=
 =?utf-8?B?MElLTUZBTVA0a1dmd0NDWlVNQ1hwS0JIYTlXQlBUVm9Ub2N5OG9Vd3MxVkRE?=
 =?utf-8?B?NEVWbnMwYTg3Tk5Ucm81cGJqc09UY0RVUGZLaTM2SDlKU00ybUxFWWQ3ajVk?=
 =?utf-8?B?aW5ZYVhiZnJCdEl2V25ib1VGdjlVMDlyUjNRSjBUVHp1UHM2dWRrd1laWVh1?=
 =?utf-8?B?TVdxWEd4b2hCUVhwNEg2c1NpK2pKNnFaeEc5ODNvZU5NU0N4R1g2cnFkL1FO?=
 =?utf-8?B?RUw4enliMkJOSUtkSE1HT3dQUU5Gblh5VnBETGRjVVY3NmVBdDF4NnlOSGg4?=
 =?utf-8?B?R2R6OFBpNHh5cGt6eTVWbkp5RnFaT1A1M3BsWHd2bEIwSEVPR0xCci9BOWM3?=
 =?utf-8?B?dkVVYk1UQ3hPbWxvdmtVWUpQWUtvTU9seXdDSW44RndyWnFQNmtITGw3SzFm?=
 =?utf-8?B?YmM2ME1qSzA3dE83Z1B0QlE2ZHRyT3ZDMDF2WHNzVXgyWU9XWDNIUTdpUW1s?=
 =?utf-8?B?YlVYT3MvVjFhQUhhbmtkZms4ZExjQS9zR0tUYkNWdzVoNDU4RVFEK1BZNDZq?=
 =?utf-8?B?dzZGOEYxT0VFQ0dxdkJTNGxRV3B1S3lTRUNSWTFBZTZqN2NnSytnQT09?=
X-Exchange-RoutingPolicyChecked: QKNYvTHRF/5YqXY2jWPnDwA1mzn2vuBmXK9ACHvXnS3YXz32yy4xK2YhI7YX5s1+PuwZa3KwJXC6V4Ocq5CoCgDCIABekfvE2o1YS5yM4ECKUXSKzLvdNLg5d3pdDoBrvdyzQ27oZ8MQQliu8ic/cejTHOHs/rtvHlK6kZEwV7Df8mnlxdVqI+7LtHItzvbvs5jM54gGlCSFelZL5qQgksF9UhzQsG0z0nVLsd7zx3tnMxC4z5b/ipy8CB1xD8DW0+Iofo5M45LL98p+LSxw3pVTKi63AGJCaJUuW5PToMHU4kuXIgeUhZt4mTxD/Z69qdC+R9GyvS08rvI+aROG+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5041e0d3-ceb1-4e71-bf5b-08df28566f66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:46:21.4428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/BI6iUjJR9pbyG6SAvLJ+31XDbzLI2YGzldiV5iX8Jk2mleUVt2OeSwIwdSdVWQiC48Nm070aivXY2r17gh+adAMxSE88Gb6hA8/T6eJlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8561
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

--------------mmMZw9v00zk00s2kF02CWe2j
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bala,

I was investigating this issue earlier in sometime and found the root 
cause in software _node_notify_remove().

It is a kind of ownership bug in driver/base/swnode.c 
sofware_node_notify_remove(). when a manged swnode is mirrored onto a

second device(which is exactly what i2c-core does for the adapter's own 
struct device), the old code does an extra 
set_secondary_fwnode()/swnode_put()

for every device that tears down, not just the true owner. this is a 
double-release/UAF risk. The following fix solves the issue without 
changing i2c adapter registration flow.

The following code patch is suggested/provided to @heikki: waiting for 
his inputs on the same.

Fixes: 151f6ff78cdf ("software node: Provide replacement for device_add_properties()")
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Nareshkumar Gollakoti<naresh.kumar.g@intel.com>
---
  drivers/base/swnode.c | 18 +++++++++++++++---
  1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 84a77ffa3dc4..2efcf12b4c21 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1190,6 +1190,7 @@ void software_node_notify(struct device *dev)
  void software_node_notify_remove(struct device *dev)
  {
  	struct swnode *swnode;
+	bool owns_managed_fwnode;
  
  	swnode = dev_to_swnode(dev);
  	if (!swnode)
@@ -1198,6 +1199,16 @@ void software_node_notify_remove(struct device *dev)
  	sysfs_remove_link(&swnode->kobj, dev_name(dev));
  	sysfs_remove_link(&dev->kobj, "software_node");
  
+	/*
+	 * A managed node can end up mirrored onto more than one device (e.g.
+	 * a bus core copying the fwnode onto a child device, as i2c-core does
+	 * for an adapter's own struct device). Only the device that actually
+	 * owns the fwnode releases the creation reference and detaches it;
+	 * every other device only releases the reference software_node_notify()
+	 * took for it.
+	 */
+	owns_managed_fwnode = swnode->managed && swnode->fwnode.dev == dev;
+
  	/*
  	 * Drop the device pointer mirrored onto a secondary software node in
  	 * software_node_notify(). For a primary software node the core owns
@@ -1206,12 +1217,13 @@ void software_node_notify_remove(struct device *dev)
  	if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.dev == dev)
  		swnode->fwnode.dev = NULL;
  
+	if (owns_managed_fwnode)
+		set_secondary_fwnode(dev, NULL);
+
  	swnode_put(swnode);
  
-	if (swnode->managed) {
-		set_secondary_fwnode(dev, NULL);
+	if (owns_managed_fwnode)
  		swnode_put(swnode);
-	}
  }


Given that,

Is this rework still needed once the core fix landed?


Thanks,

Naresh

On 10/9/2026 10:12 PM, Balasubramani Vivekanandan wrote:
> The kernel crashes when unloading the xe driver on CRI:
>
>   Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73
>   RIP: 0010:platform_device_release+0x80/0x90
>   Call Trace:
>    device_release+0x44/0xa0
>    kobject_put+0x9b/0x250
>    put_device+0x13/0x30
>    platform_device_unregister+0x29/0x40
>    xe_i2c_remove+0x80/0xa0 [xe]
>    devm_action_release+0x16/0x30
>    release_nodes+0x3d/0x140
>    devres_release_all+0x96/0xd0
>
> This started after commit 0f485f88656af ("drm/xe/i2c: use
> device_create_managed_software_node()"), which attaches a managed
> software node to a platform device created with platform_device_alloc().
>
> Comment above the device_create_managed_software_node function cautions
> that the software node created by it should not be shared or reused as
> the lifetime of the node is linked to the device.
>
> But the DesignWare i2c driver which creates an adapter device as a child
> of the platform device reuses the software node as its fwnode.
> (device_set_node() in i2c_dw_probe()).
>
> During module unbind, when the adapter device is deleted, it drops the
> reference count for the software node and frees the software node.
> Later when the platform device is removed, it tries to dereference the
> software node pointer and results in use-after-free.
>
> Instead of managed software node use a static struct software_node
> passed through platform_device_info.swnode to
> platform_device_register_full().
> But we have a blocker which doesn't allow to use
> platform_device_register_full() simply.
>
> Currently the driver is using the two step alloc/add sequence while
> creating the platform device so that i2c->pdev is set before
> platform_device_add(), because xe_i2c_notifier() needs i2c->dev and it
> can run before platform_device_register_full() returns.
>
> We can fix it by removing the dependency on i2c->dev in
> xe_i2c_notifier(). It is using it to match against the right adapter.
> Instead of using the device, use its parent to match.
>
> Fixes: 0f485f88656af ("drm/xe/i2c: use device_create_managed_software_node()")
> Cc: Bartosz Golaszewski<bartosz.golaszewski@oss.qualcomm.com>
> Cc: Danilo Krummrich<dakr@kernel.org>
> Cc: Heikki Krogerus<heikki.krogerus@linux.intel.com>
> Signed-off-by: Balasubramani Vivekanandan<balasubramani.vivekanandan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_i2c.c | 45 +++++++++++++------------------------
>   1 file changed, 15 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index b82caaff80d7b..c54a2375f07ef 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -55,6 +55,10 @@ static const struct property_entry xe_i2c_adapter_properties[] = {
>   	{ }
>   };
>   
> +static const struct software_node xe_i2c_adapter_node = {
> +	.properties = xe_i2c_adapter_properties,
> +};
> +
>   static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
>   {
>   	u32 *val = ep;
> @@ -98,7 +102,7 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
>   	struct device *dev = data;
>   
>   	if (action == BUS_NOTIFY_ADD_DEVICE &&
> -	    adapter && dev->parent == &i2c->pdev->dev) {
> +	    adapter && dev->parent && dev->parent->parent == i2c->drm_dev) {
>   		i2c->adapter = adapter;
>   		schedule_work(&i2c->work);
>   		return NOTIFY_OK;
> @@ -110,41 +114,22 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
>   static int xe_i2c_register_adapter(struct xe_i2c *i2c)
>   {
>   	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
> +	struct platform_device_info info = {
> +		.parent = i2c->drm_dev,
> +		.name = adapter_name,
> +		.swnode = &xe_i2c_adapter_node,
> +	};
>   	struct platform_device *pdev;
> -	int ret;
> -	u32 id;
> -
> -	id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
> -
> -	/*
> -	 * Not using platform_device_register_full() here because we don't have
> -	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> -	 * uses that handle, but it may be called before
> -	 * platform_device_register_full() is done.
> -	 */
> -	pdev = platform_device_alloc(adapter_name, id);
> -	if (!pdev)
> -		return -ENOMEM;
>   
> -	ret = device_create_managed_software_node(&pdev->dev,
> -						  xe_i2c_adapter_properties,
> -						  NULL);
> -	if (ret)
> -		goto err_pdev_put;
> +	info.id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
>   
> -	pdev->dev.parent = i2c->drm_dev;
> -	i2c->pdev = pdev;
> +	pdev = platform_device_register_full(&info);
> +	if (IS_ERR(pdev))
> +		return PTR_ERR(pdev);
>   
> -	ret = platform_device_add(pdev);
> -	if (ret)
> -		goto err_pdev_put;
> +	i2c->pdev = pdev;
>   
>   	return 0;
> -
> -err_pdev_put:
> -	platform_device_put(pdev);
> -
> -	return ret;
>   }
>   
>   static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
--------------mmMZw9v00zk00s2kF02CWe2j
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Bala,</p>
    <p>I was investigating this issue earlier in sometime and found the
      root cause in software _node_notify_remove().</p>
    <p>It is a kind of ownership bug in driver/base/swnode.c
      sofware_node_notify_remove(). when a manged swnode is mirrored
      onto a</p>
    <p>second device(which is exactly what i2c-core does for the
      adapter's own struct device), the old code does an extra&nbsp;<span style="background:white" lang="en-IN">set_secondary_fwnode()/swnode_put()</span><span style="background:white" lang="en-US">&nbsp;</span></p>
    <p><span style="background:white" lang="en-US">for every device that
        tears down, not just the true owner. this is a
        double-release/UAF risk. The following fix solves the issue
        without changing i2c adapter registration flow.</span></p>
    <p>The following code patch is suggested/provided to @heikki:
      waiting for his inputs on the same.</p>
    <pre style="color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; overflow-wrap: break-word; white-space: pre-wrap;">Fixes: 151f6ff78cdf (&quot;software node: Provide replacement for device_add_properties()&quot;)
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Nareshkumar Gollakoti <a class="moz-txt-link-rfc2396E" href="mailto:naresh.kumar.g@intel.com">&lt;naresh.kumar.g@intel.com&gt;</a>
---
 drivers/base/swnode.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 84a77ffa3dc4..2efcf12b4c21 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1190,6 +1190,7 @@ void software_node_notify(struct device *dev)
 void software_node_notify_remove(struct device *dev)
 {
 	struct swnode *swnode;
+	bool owns_managed_fwnode;
 
 	swnode = dev_to_swnode(dev);
 	if (!swnode)
@@ -1198,6 +1199,16 @@ void software_node_notify_remove(struct device *dev)
 	sysfs_remove_link(&amp;swnode-&gt;kobj, dev_name(dev));
 	sysfs_remove_link(&amp;dev-&gt;kobj, &quot;software_node&quot;);
 
+	/*
+	 * A managed node can end up mirrored onto more than one device (e.g.
+	 * a bus core copying the fwnode onto a child device, as i2c-core does
+	 * for an adapter's own struct device). Only the device that actually
+	 * owns the fwnode releases the creation reference and detaches it;
+	 * every other device only releases the reference software_node_notify()
+	 * took for it.
+	 */
+	owns_managed_fwnode = swnode-&gt;managed &amp;&amp; swnode-&gt;fwnode.dev == dev;
+
 	/*
 	 * Drop the device pointer mirrored onto a secondary software node in
 	 * software_node_notify(). For a primary software node the core owns
@@ -1206,12 +1217,13 @@ void software_node_notify_remove(struct device *dev)
 	if (!device_match_fwnode(dev, &amp;swnode-&gt;fwnode) &amp;&amp; swnode-&gt;fwnode.dev == dev)
 		swnode-&gt;fwnode.dev = NULL;
 
+	if (owns_managed_fwnode)
+		set_secondary_fwnode(dev, NULL);
+
 	swnode_put(swnode);
 
-	if (swnode-&gt;managed) {
-		set_secondary_fwnode(dev, NULL);
+	if (owns_managed_fwnode)
 		swnode_put(swnode);
-	}
 }</pre>
    <p><br>
    </p>
    <p>Given that,</p>
    <p>Is this rework still needed once the core fix landed?</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Naresh</p>
    <div class="moz-cite-prefix">On 10/9/2026 10:12 PM, Balasubramani
      Vivekanandan wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261009164241.923756-2-balasubramani.vivekanandan@intel.com">
      <pre wrap="" class="moz-quote-pre">The kernel crashes when unloading the xe driver on CRI:

 Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73
 RIP: 0010:platform_device_release+0x80/0x90
 Call Trace:
  device_release+0x44/0xa0
  kobject_put+0x9b/0x250
  put_device+0x13/0x30
  platform_device_unregister+0x29/0x40
  xe_i2c_remove+0x80/0xa0 [xe]
  devm_action_release+0x16/0x30
  release_nodes+0x3d/0x140
  devres_release_all+0x96/0xd0

This started after commit 0f485f88656af (&quot;drm/xe/i2c: use
device_create_managed_software_node()&quot;), which attaches a managed
software node to a platform device created with platform_device_alloc().

Comment above the device_create_managed_software_node function cautions
that the software node created by it should not be shared or reused as
the lifetime of the node is linked to the device.

But the DesignWare i2c driver which creates an adapter device as a child
of the platform device reuses the software node as its fwnode.
(device_set_node() in i2c_dw_probe()).

During module unbind, when the adapter device is deleted, it drops the
reference count for the software node and frees the software node.
Later when the platform device is removed, it tries to dereference the
software node pointer and results in use-after-free.

Instead of managed software node use a static struct software_node
passed through platform_device_info.swnode to
platform_device_register_full().
But we have a blocker which doesn't allow to use
platform_device_register_full() simply.

Currently the driver is using the two step alloc/add sequence while
creating the platform device so that i2c-&gt;pdev is set before
platform_device_add(), because xe_i2c_notifier() needs i2c-&gt;dev and it
can run before platform_device_register_full() returns.

We can fix it by removing the dependency on i2c-&gt;dev in
xe_i2c_notifier(). It is using it to match against the right adapter.
Instead of using the device, use its parent to match.

Fixes: 0f485f88656af (&quot;drm/xe/i2c: use device_create_managed_software_node()&quot;)
Cc: Bartosz Golaszewski <a class="moz-txt-link-rfc2396E" href="mailto:bartosz.golaszewski@oss.qualcomm.com">&lt;bartosz.golaszewski@oss.qualcomm.com&gt;</a>
Cc: Danilo Krummrich <a class="moz-txt-link-rfc2396E" href="mailto:dakr@kernel.org">&lt;dakr@kernel.org&gt;</a>
Cc: Heikki Krogerus <a class="moz-txt-link-rfc2396E" href="mailto:heikki.krogerus@linux.intel.com">&lt;heikki.krogerus@linux.intel.com&gt;</a>
Signed-off-by: Balasubramani Vivekanandan <a class="moz-txt-link-rfc2396E" href="mailto:balasubramani.vivekanandan@intel.com">&lt;balasubramani.vivekanandan@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_i2c.c | 45 +++++++++++++------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index b82caaff80d7b..c54a2375f07ef 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -55,6 +55,10 @@ static const struct property_entry xe_i2c_adapter_properties[] = {
 	{ }
 };
 
+static const struct software_node xe_i2c_adapter_node = {
+	.properties = xe_i2c_adapter_properties,
+};
+
 static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
 {
 	u32 *val = ep;
@@ -98,7 +102,7 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
 	struct device *dev = data;
 
 	if (action == BUS_NOTIFY_ADD_DEVICE &amp;&amp;
-	    adapter &amp;&amp; dev-&gt;parent == &amp;i2c-&gt;pdev-&gt;dev) {
+	    adapter &amp;&amp; dev-&gt;parent &amp;&amp; dev-&gt;parent-&gt;parent == i2c-&gt;drm_dev) {
 		i2c-&gt;adapter = adapter;
 		schedule_work(&amp;i2c-&gt;work);
 		return NOTIFY_OK;
@@ -110,41 +114,22 @@ static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void
 static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 {
 	struct pci_dev *pci = to_pci_dev(i2c-&gt;drm_dev);
+	struct platform_device_info info = {
+		.parent = i2c-&gt;drm_dev,
+		.name = adapter_name,
+		.swnode = &amp;xe_i2c_adapter_node,
+	};
 	struct platform_device *pdev;
-	int ret;
-	u32 id;
-
-	id = (pci_domain_nr(pci-&gt;bus) &lt;&lt; 16) | pci_dev_id(pci);
-
-	/*
-	 * Not using platform_device_register_full() here because we don't have
-	 * a handle to the platform_device before it returns. xe_i2c_notifier()
-	 * uses that handle, but it may be called before
-	 * platform_device_register_full() is done.
-	 */
-	pdev = platform_device_alloc(adapter_name, id);
-	if (!pdev)
-		return -ENOMEM;
 
-	ret = device_create_managed_software_node(&amp;pdev-&gt;dev,
-						  xe_i2c_adapter_properties,
-						  NULL);
-	if (ret)
-		goto err_pdev_put;
+	info.id = (pci_domain_nr(pci-&gt;bus) &lt;&lt; 16) | pci_dev_id(pci);
 
-	pdev-&gt;dev.parent = i2c-&gt;drm_dev;
-	i2c-&gt;pdev = pdev;
+	pdev = platform_device_register_full(&amp;info);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
 
-	ret = platform_device_add(pdev);
-	if (ret)
-		goto err_pdev_put;
+	i2c-&gt;pdev = pdev;
 
 	return 0;
-
-err_pdev_put:
-	platform_device_put(pdev);
-
-	return ret;
 }
 
 static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
</pre>
    </blockquote>
  </body>
</html>

--------------mmMZw9v00zk00s2kF02CWe2j--
