Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF4EC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 17:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AD810E4B1;
	Mon, 13 May 2024 17:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WW0jyqmt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3D110E4B1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715620549; x=1747156549;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rTO+S36c/4Wk7lDLndW8p3jZfTYgL11VWhn5xZNJiYY=;
 b=WW0jyqmtwuworeroMv5gJmV9wbfg8ooQQSzzvOsDoh3lPobo0lFKf1L6
 so5vzPPZMMIHQIeZ1YNIDOIL5J0D4oUbNvvwh2xO3Q1eEFidlVM+VPOUK
 A9hAX5kqkD/5JSEtSQbmuomC9xDsO3Ako+PK0Q7L6F3b5S0IkcEOfDpM/
 rghmpkq5G4s1wPclo4NSN5LIDHbw0FUTDEkKy9vJWbYd/++kQi0Acxfx+
 JtBssFHXEPY4/JkfYLJh1bZjC8kGuFgxuVgDtOlVFwKDNgrVK0wDdSmHT
 1n5yRtJ0LLWV64TA3QyxDNDkUAb7Nw0duC1WZXbSgqPSHfPC6assl0hbI A==;
X-CSE-ConnectionGUID: dcI4qMSBSLCU7i2YE8zMqA==
X-CSE-MsgGUID: KqsxKrbiRLK7nKEb6nu7bw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11400051"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11400051"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 10:15:48 -0700
X-CSE-ConnectionGUID: CtLBb3xCQtGrBmIxtB0+EQ==
X-CSE-MsgGUID: XQ82bKMARgaZnxjXvrRC9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34956775"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 10:15:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 10:15:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 10:15:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 10:15:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFm2F8BK+oZDpWaoIx5cI4K4JdVLY1kJlf1hTx5G7zTRaHXL8c+SYh7dY6goYNT3ZPbUwilWsSs7rHoa5V6rRRZqo4KTo/clAbc5u05Opcc/FU4ZMVwqQAKhLhOf85ike9vBZmKKD9fosz3XiGAlanz9JMydsl/3VMOHv1GNzefKARInCPwLs3irqYRi1qT+Urhh2pvMnJcV3QEo0MG6MbqM2QOTUS8jYPEmEf5xBIxvjiDUfY++RU56Bsm3lK27hEXBUlS6zM3K3o028+1/MBcE0BdkIEr/tCDjDC5qjfeLNS0aaLo767EV1ggrrG35jvu85PNBV0eKX+HcnxWN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMRw2o0HY/J6wzgnegOLc8cIXhdqEaHlXRy/8ZbTrpY=;
 b=oO+a6qwGiAf3bIkcXKCuIiZpykZJOwbSqzxFieWSR9y1Q7OaNeskKMnEDfJUq771J36fOPyhzcYj7NdbM4G45rSwA7G2YDIY27obA07PiYPbjEkzHcwHiHB2XRhJCaU+BEyaxXBWZqwcL6osbXXgnmHk8P95T+IOnxIZEzuiaA0QxSyeYzfsCtbUSByPICwzhyPPcSHgZ9fAxXLDm6Fpi0utrIL0OWZ49tmc2Un708epvI954xFcVsHxxKrBWIU7lMuAYfs6tSPrSK4Vd3y+3Mz85VENIHpR7/AnR4XBmHxEDKWUvTorL460lvUj0rAZO4huQOuRyq1j4fQWm+yRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6433.namprd11.prod.outlook.com (2603:10b6:208:3b9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 17:15:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 17:15:44 +0000
Date: Mon, 13 May 2024 13:15:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <david.e.box@linux.intel.com>
Subject: Re: [PATCH 3/6] platform/x86/intel/pmt: Add support to use provided
 read callbacks
Message-ID: <ZkJKvFY2aGe4FSV-@intel.com>
References: <20240510205948.904409-1-michael.j.ruhl@intel.com>
 <20240510205948.904409-4-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240510205948.904409-4-michael.j.ruhl@intel.com>
X-ClientProxiedBy: MW4PR04CA0145.namprd04.prod.outlook.com
 (2603:10b6:303:84::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a5259d-39e3-4dfe-37b7-08dc73705278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SPttDbxgZldVIDjBGj3ltm1PjkCw4JFHQWg09E2BfG5xEgwbAtG6T/9RCO0r?=
 =?us-ascii?Q?xqm+fuoXELv6Lh7Ux6oCD5srDszlPE+wM6cn2YiBq+IJYCvu7ZYCdgcZm149?=
 =?us-ascii?Q?L52wZhYAJwpA1YUqt682fns14BnyPhTCvSm9onhIzwpg5FA/HcYhHGSyMwYj?=
 =?us-ascii?Q?kVSfYttWrgG6FyNPsBZZurrhoTuSX3VEfj51d2a/XUqqBiCkF6ZPgOLxjT2t?=
 =?us-ascii?Q?HiwRNC1TanCmK1o+OWEmp3elsE0UQRUdWpRMmKMEcq9Sc/6+KbLBBXU1JgVH?=
 =?us-ascii?Q?AtucckRjUq1NRfrLOzNvK4L9ew5tQ7bya4EdTRqZZMtPoCm2MtU2HBGmyt5z?=
 =?us-ascii?Q?5y24e6xlLb+2sPMkYJUP6RGx1EbhScadwrvkqvTryCwF2q9B9hu/i9SVOHnp?=
 =?us-ascii?Q?MMENyyeCvI+HKbrSLIoYcxj0EXwFxzq7EX6cJjZRr4IDdvi7+J3LnUpiJJy8?=
 =?us-ascii?Q?08WC8h5Tsc25YImG7cYuId5RlLxw7e9gQBaQYumt+nTb1xbY1BgNSmz3FgB1?=
 =?us-ascii?Q?qfnDLnLDvuXjpd33eZnyCdE1xn/BsWldiIPEiYJwzbHRhJkJ7FBGGhH8Fa57?=
 =?us-ascii?Q?Knc6kX+P7yfMlYpv43giO5I6cdi9DwQunXBpDIVf2AqVb32jgFYjp4T70f7q?=
 =?us-ascii?Q?i0s2Cx3Crp8opODWNyMrUV/OYtnah/oFXIj2dSHYMM3SjSH+2xU3+fEwKMV8?=
 =?us-ascii?Q?Jx93VD6M+EtE09z9uFKuV86OD3nwxu4ZIWs5V0q1OPv/juKh6lKFieRagKhk?=
 =?us-ascii?Q?ZoBiabohPWvdCvBpA6h3jaCHi7lRUABsQdRXHyBNmR7FzKW6VREUjUuF82Rm?=
 =?us-ascii?Q?Mag4xYSc7X4wLG7G3ECfgg93uDVXLkkYwmeRF2CxK2Y/42Zqtza6jCcNZf2C?=
 =?us-ascii?Q?BYmO0M19jRYrb3E7q8M3RT6bK/qujsAedZn2TowstK0Ff6bpudaQFotGNEzc?=
 =?us-ascii?Q?LoCtJIpRJjq7gvR++wTzEI0mVcFyZ9z+GULLm3jqlSSz34robdeMalyuXyOi?=
 =?us-ascii?Q?+u3RDbhF5kp5t+TwQi1vWXQLLvJleTN0FLpMchhLqrV2N9Maw7PozpX6cjv4?=
 =?us-ascii?Q?82lBca6IpaxwPhtqqoXp1dLaz58pTHviwxacZ5lWXqIwUUE5xO7rFMhOKoo+?=
 =?us-ascii?Q?T06SlpuVNQN4S1+90n5U2hSA05I25nAgkx7dwyAcoOdRFYXxMCX8ihvW/loR?=
 =?us-ascii?Q?gt2+4U6boGuBYiYb4j0SEt4Zd27TIlUcOIdrFTydOngY5o19UHOeaecLvkqa?=
 =?us-ascii?Q?IBiybV1XxNULqqd4x3cc4ef5AeNEX5Gzb+oeoeWJ1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2kySsgCyhZxnbdUI+GHHlNk2oErcutmW/XbwHiHgP+yUGmUUWxmOPxC+yzJK?=
 =?us-ascii?Q?emk+DLIZMie3PIfTVEPyqJZnuTNie+kOyf7skH6GCyuphRo71qv8QJN7OXN7?=
 =?us-ascii?Q?mjBbwixgbS8cg27vxfnfpcwxfonc62cJBKDgex30erhPNC9e8/DshPPI8+k+?=
 =?us-ascii?Q?pTsmmVQcFyd1nbIhl1HlwemYYTUH4TgRkYdY4CxTtu+NQJnxQOfTTHTr6mTs?=
 =?us-ascii?Q?jqKPN19eKdM/zFZSbEJ8CYYuyvGZ6s6V4qZjpIUXLv77FmfmFMgeE2NfSsI/?=
 =?us-ascii?Q?huCsdR3nzq06UQ2lFonK9orZBvM12Y+Ag6Lh88otSdm71ezhtpM7UQQYRKtM?=
 =?us-ascii?Q?7uBi/U5GVFr7RN/kCbC5nNU70j54O5fkI2PwuEUTyBWhuwZprLb3CoiHdpyq?=
 =?us-ascii?Q?uUaOmMnjC5lN28rjuwCTrpjc/49qwEXr0m7L/NKlR8x0TFJuMZTeUHqVnL7J?=
 =?us-ascii?Q?Fzz70/V1v6Zkmic5x6mMh9KbJF8a/k3JyKykzxHXqrOrcx1O0crmNspkNHRV?=
 =?us-ascii?Q?aOrO8Ah1HnGY7lXAZ+CqHsZslp5lfOn6ihe07qmur45vyuAvZUYRPaHblTz6?=
 =?us-ascii?Q?9MHSjPbRu9AU2nlQd5VctAWFxhMVTUYWzr6LecjFbgyZnmTC2Z1ViYJ3SNgy?=
 =?us-ascii?Q?Y4WyyPqMsMhdkRDucnY2alCLiAitM7MlFJyl5tJCjof8gQMBgffCTRuOV/Tf?=
 =?us-ascii?Q?R/Raj+HY4BvAdsTjL1hz+zrqGZa10APgiMAt29Na/C730xXcfFkx3aOPwSa2?=
 =?us-ascii?Q?btapujhCen+0q9nTiinPK0TOPBZ6V9X19gzF8GP6nFcgi9zYbpTzEnkRLZTa?=
 =?us-ascii?Q?MYPUnG4BntCWUHiWYmq8co32y8sbf32DcmO/CWEZ1nS9GWt1HwwEVXp1189o?=
 =?us-ascii?Q?55kLUq5oZpyuqNObnNk43V434v2pw4Z+8ErwzP/jHMh5AMdYCGJqk8lQPD4G?=
 =?us-ascii?Q?/Xh742mFOUu/AIjrMEP2CEhNp9WrwYkagIxE25mQxAz7ajO0NYBnZZvd8pnl?=
 =?us-ascii?Q?HNqv4oNoj+GsdWFgSxMGAzoKqizefVdCKPvY87pIhuVvPnOfA66Xq+GVyY3l?=
 =?us-ascii?Q?djrYaxiCV6FH6ZtYArc5N+zy5ZFXpCz7z5RxzDAXJq6uPHcWeRXlGDfHyyXm?=
 =?us-ascii?Q?76UA/ktwpL8PWIXgJwMWeM2BFZJE0SpsLtaDAexAIY+emUP018T2+Y80REdD?=
 =?us-ascii?Q?m/hOsAR1nrzQu+N6JJFpX8xO3Q6pUAfDkKTZFsLb88h10m/4xzqjP/DTp+YE?=
 =?us-ascii?Q?HHSULI+2NdgPb9Srlrik2yMysf0gPBIbpFA00IBECGf+UqDTJj+U0z61Kwno?=
 =?us-ascii?Q?rCIs2ztLT5V5u5XDf/wbLJXgm0ivmRjY424F2ydE3/OMz9nzjgCJgrhwG0+B?=
 =?us-ascii?Q?p4fEPIlXHhryn9myYWn8khZnsDZPNuy0jDF4ol9ZGE63C68r78aNtjAlOfSI?=
 =?us-ascii?Q?oQ2J5PO3egU9/Jz4hyaaXSi3O3kdYHwfSDxX2uBupjYfnawUb2A+tgJHn2la?=
 =?us-ascii?Q?J/qoFv89A5Fsqyx4ZBSEmmgacFEdQaM/L4nn8YA1rA5jLpAOIJ7+5uKYPHuS?=
 =?us-ascii?Q?2hk9byzdGT2sAuIhIywdbX1Coj2yzLEseAfAbBHi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a5259d-39e3-4dfe-37b7-08dc73705278
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 17:15:43.9845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWrnaH4UJhBuSJFd2WFGPvMH7BIfAEDwNRsQuNvI12uktjvh2iy0njj+iryCZB3t3OJw/d3VkGeM1LEXZZfOVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6433
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

On Fri, May 10, 2024 at 04:59:35PM -0400, Michael J. Ruhl wrote:
> From: "David E. Box" <david.e.box@linux.intel.com>
> 

This patch needs a commit message.

> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Whenever sending email on other's behalf, please always remind to sign it off.

Also, these patches should also had been sent to platform-driver-x86@vger.kernel.org
and linux-kernel@vger.kernel.org

and perhaps cc'ing other maintainers listed by
scripts/get_maintainer.pl

And later, likely trying to get their ack to get then
trough drm-xe-next where we are adding the first usage of these.

> ---
>  drivers/platform/x86/intel/pmt/class.c     | 28 +++++++++++++++++-----
>  drivers/platform/x86/intel/pmt/class.h     |  8 +++++--
>  drivers/platform/x86/intel/pmt/telemetry.c | 10 ++++----
>  3 files changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index d7939b28e937..62e36dd89137 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -58,6 +58,24 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
>  	return count;
>  }
>  
> +void pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
> +			 void __iomem *addr, u32 count)
> +{
> +	if (cb && cb->read_telem) {
> +		count = cb->read_telem(pdev, guid, buf, count);
> +		return;
> +	}
> +
> +	if (guid == GUID_SPR_PUNIT) {
> +		/* PUNIT on SPR only supports aligned 64-bit read */
> +		count = pmt_memcpy64_fromio(buf, addr, count);
> +		return;
> +	}
> +
> +	memcpy_fromio(buf, addr, count);
> +}
> +EXPORT_SYMBOL_NS_GPL(pmt_telem_read_mmio, INTEL_PMT);
> +
>  /*
>   * sysfs
>   */
> @@ -79,11 +97,8 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
>  	if (count > entry->size - off)
>  		count = entry->size - off;
>  
> -	if (entry->guid == GUID_SPR_PUNIT)
> -		/* PUNIT on SPR only supports aligned 64-bit read */
> -		count = pmt_memcpy64_fromio(buf, entry->base + off, count);
> -	else
> -		memcpy_fromio(buf, entry->base + off, count);
> +	pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry->header.guid, buf,
> +			    entry->base + off, count);
>  
>  	return count;
>  }
> @@ -239,6 +254,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
>  
>  	entry->guid = header->guid;
>  	entry->size = header->size;
> +	entry->cb = ivdev->priv_data;
>  
>  	return 0;
>  }
> @@ -300,7 +316,7 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  		goto fail_ioremap;
>  
>  	if (ns->pmt_add_endpoint) {
> -		ret = ns->pmt_add_endpoint(entry, ivdev->pcidev);
> +		ret = ns->pmt_add_endpoint(ivdev, entry);
>  		if (ret)
>  			goto fail_add_endpoint;
>  	}
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index d6f9ccaf28c8..5032c5244eb4 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -24,6 +24,7 @@ struct pci_dev;
>  struct telem_endpoint {
>  	struct pci_dev		*pcidev;
>  	struct telem_header	header;
> +	struct pmt_callbacks	*cb;
>  	void __iomem		*base;
>  	bool			present;
>  	struct kref		kref;
> @@ -43,6 +44,7 @@ struct intel_pmt_entry {
>  	struct kobject		*kobj;
>  	void __iomem		*disc_table;
>  	void __iomem		*base;
> +	struct pmt_callbacks	*cb;
>  	unsigned long		base_addr;
>  	size_t			size;
>  	u32			guid;
> @@ -55,10 +57,12 @@ struct intel_pmt_namespace {
>  	const struct attribute_group *attr_grp;
>  	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
>  				 struct device *dev);
> -	int (*pmt_add_endpoint)(struct intel_pmt_entry *entry,
> -				struct pci_dev *pdev);
> +	int (*pmt_add_endpoint)(struct intel_vsec_device *ivdev,
> +				struct intel_pmt_entry *entry);
>  };
>  
> +void pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
> +			 void __iomem *addr, u32 count);
>  bool intel_pmt_is_early_client_hw(struct device *dev);
>  int intel_pmt_dev_create(struct intel_pmt_entry *entry,
>  			 struct intel_pmt_namespace *ns,
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index 3478f891ea0b..c9feac859e57 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -93,8 +93,8 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
>  	return 0;
>  }
>  
> -static int pmt_telem_add_endpoint(struct intel_pmt_entry *entry,
> -				  struct pci_dev *pdev)
> +static int pmt_telem_add_endpoint(struct intel_vsec_device *ivdev,
> +				  struct intel_pmt_entry *entry)
>  {
>  	struct telem_endpoint *ep;
>  
> @@ -104,13 +104,14 @@ static int pmt_telem_add_endpoint(struct intel_pmt_entry *entry,
>  		return -ENOMEM;
>  
>  	ep = entry->ep;
> -	ep->pcidev = pdev;
> +	ep->pcidev = ivdev->pcidev;
>  	ep->header.access_type = entry->header.access_type;
>  	ep->header.guid = entry->header.guid;
>  	ep->header.base_offset = entry->header.base_offset;
>  	ep->header.size = entry->header.size;
>  	ep->base = entry->base;
>  	ep->present = true;
> +	ep->cb = ivdev->priv_data;
>  
>  	kref_init(&ep->kref);
>  
> @@ -218,7 +219,8 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
>  	if (offset + NUM_BYTES_QWORD(count) > size)
>  		return -EINVAL;
>  
> -	memcpy_fromio(data, ep->base + offset, NUM_BYTES_QWORD(count));
> +	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base + offset,
> +			    NUM_BYTES_QWORD(count));
>  
>  	return ep->present ? 0 : -EPIPE;
>  }
> -- 
> 2.44.0
> 
