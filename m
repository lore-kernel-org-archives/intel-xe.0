Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A37C61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 20:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA36A10EEF3;
	Tue,  1 Sep 2026 20:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdDFcop6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8CC10EEF0
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 20:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788293459; x=1819829459;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p7pHsw55BEdobkxfPmZnWQFULpeoKjs5bOqTK/vNY90=;
 b=YdDFcop6cWKCLYKbmp4hnHW3LktRqc9VYVd/COcDCF+Leb69gKqLePRI
 sTdLVrWIK0JV5EwZfKPCA3rOKc9jAYN/BsQuLZSGXmhYGGqHbGdk9BlUu
 mq7LM/SYETMopB/WhEvlRcSkYbXrp34MMPjsePHnhvyAssGdfTEIAmiDg
 UUV1+fnPozauyNowtvCgNKGEA6bgRdqeb2mNPuem/TPAqY73Ucx9WlnZL
 15EIV88iGdxNaofgnTaGSaM3/2q823xkZi513hQvqUOaRU2y2W5DsEMc/
 ACaOMJP0fKoG+zbDaTekv6OuVeAhw40jcBReADVdTL54DoA79dgxB53TH Q==;
X-CSE-ConnectionGUID: xwAwjFuLTHC22DZWjGOpPg==
X-CSE-MsgGUID: MB4AMd6RQuuUbqrV7Fo82Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99335995"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="99335995"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 13:10:58 -0700
X-CSE-ConnectionGUID: nDNvCxLhTK6N2Kf3/iHvdA==
X-CSE-MsgGUID: 53FWgABaRbmcvYLAA/xm6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="294028999"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 13:10:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 13:10:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 13:10:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 13:10:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m17GAWy9r4xt54fNnU0WXLtI8W95BmPXAL6aCrfrSxKo+J5vNrmdlBGB87xfL4q4RlEOQosBUnEsLWYs4UKdpXTeTEN3q9ZqtaUAhRdJBbkDjUKVC25qhvVcx5xpCCqqb0b0tKnWXcNuhNa2PLcjCmqq/gnzD10y7ubOputF9vRNTjrbWh3JqnW8lkDUAnlfcmFSgjBuRejN6kMSx2UZzpBXesQT+6As8K8yC07B7ZRwQaBjU1t2XS9o7kDKPfhQ2M0DIVgqBiERSIzT9BfRuOowj25f1VvEB0/Z5vRulJM79g35GFsHf6ls26C7vy22P9joBp40uG5nHukBzvk14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1owItW3DPnp+j0KewYDndRi4sIJPKdXMB3sHlay/KE=;
 b=Z0TDiPJFJDujAQ6eERDgryWjW00Ut0/tsO1K8K95N7PPjGoBcmQs9X/cjGgPwgpy6ad2A1bKatOXpFJT63621lsTAil4QCFB1AgUCc2OiIJKbeYspr7Xip8WUYq4KclNMwjIjwjcBE2uNwCKaV79V7qsDUjzaIDQqEcbDKVuyLU452MReO6w2tJoS1ef/3iuIxVKb2Vq93ltzpg+KjXYqPKkw+4HBUZQtvkUY05jPC6LZinBYwx4sJnO+6h3I5p9gtzbNU7ybuVW3qq0FJfVulWUl9EptgKOa68HM1feHgA+jE9NffsupBrO6AFo90N4t7o55L0m/6CxoOPSS5fJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB243846.namprd11.prod.outlook.com (2603:10b6:610:362::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 20:10:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 20:10:55 +0000
Date: Tue, 1 Sep 2026 13:10:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <stable@kernel.org>
Subject: Re: [PATCH 3/5] drm/xe/vram: report FLAT_CCS base misalignment
Message-ID: <apcxTIDGDPtBARau@gsse-cloud1.jf.intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
 <20260828151405.662533-10-matthew.auld@intel.com>
 <apHrLxFCdzGPs9vO@gsse-cloud1.jf.intel.com>
 <93751687-9f80-4182-80c7-c407346d5bae@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93751687-9f80-4182-80c7-c407346d5bae@intel.com>
X-ClientProxiedBy: MW4PR04CA0087.namprd04.prod.outlook.com
 (2603:10b6:303:6b::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB243846:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c598711-4d4f-487b-56f3-08df08652158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006|5023799004|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 0KkZ+uc/kHaA5xDemcvVSbL4QAIj9DLBi7rcp2KSxgcFAosF4o2WDSEjEh4fDANX7Ee382jHyhtde/BmpGbPVI+HRAowjjNp8uE9gbOiD5lP6upUaOezMCvi1vOqu14tZraRa6CDhwZGYRf5J9x9Eu4AKVBaZKMXjbtPDp2UF2m6ubdHAiT4sLjpEYJ07RdgNp3ZPNB03WaN+9UfjKofp+MvWpGPVPNS7EoWUMGrMYyumtdkVOLQNxTQRKA9/HG3TRX7jzvY+gtAIN7ie4el0U/WQrRglNaYZ8OXB3EMr4oknETKExA7DORrADlUbj0QHfu5LMGHBup9wdvDur/JIQS4mtI6OMxC9OOijdcFG8CWWwqCK37dGF+xx7g/JFyBn6R7nKmGEiTaXVY4x68FgWpN/UGodO3Z01ojIgXchl5BA9hqLGhCyi5PBjH2FZDsWriB/7JqGK9YKU8u1R+AmJEdePhrogB9PbbRrzLXnM8uo52ed34BHvBUxDQKAMoICnwbNQst+fk1+b/ZWaCHGr5De6/87IQkoEoIekOyHpJ5ecORRjdERYe9+XkMZgSLYjI/wuDZRfcJOfxEFir4yoFuf9QEd2Z49forIad36ssRFeybuzQolcZ4Uzfg34G+b0pywm+MBdoPTkzrwTSd2loDXEyD3dWJM3ZoL01AJxE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?279h7YjaC2Hiusypgm9KEtQaY19QJuPJbGZHXqtE3WaNZmlJHukA324bvQ?=
 =?iso-8859-1?Q?LRWoL+1bEFDMHSM8FsAajel6C5+MQcA17SooX/hV3bjjGXsBw2iWj35aGJ?=
 =?iso-8859-1?Q?cCzUWRCLpALdZLxaEvsvHGtVrM8Eu93Du8OcQi69tiaInl9MUXEP405gld?=
 =?iso-8859-1?Q?K0Z5v5S2DqT6nzicwFEi7kuaytX2l7uduvAUCIBqpwRtx3kIvKTExWPeTW?=
 =?iso-8859-1?Q?6fl0aeVPMCdjwtQWlz5Y968QoAhKTpH6fS6gLJlIq7i91YtSF83rYOOKNf?=
 =?iso-8859-1?Q?Vtmii1o9KHpD4nPEQ9HFjXzfcNBrOfHI6HwD0Y4yyW+yPRnqtnDO/FLwrs?=
 =?iso-8859-1?Q?PRKQMkeHD6RmtxL47/YgM728YqQ2StfFcMgnyh337WtjwS2Hg23acLsAaG?=
 =?iso-8859-1?Q?+4fIDFJP6HYzCfaSEYG82I82Si19Y1WWU+wrcVzoZ11LKg3qo8BRUw5/mf?=
 =?iso-8859-1?Q?4xGKXNCFfDkqfJ8oz5dfnuz/5a5or1NaC/9s+9fYs0Z9hbRHQOgdiAR2LU?=
 =?iso-8859-1?Q?XNnAMJULC1ki1TUAamNWc4RV+HjmB+1+yflTfDOJlS4LYPhTS3N4ONSaqq?=
 =?iso-8859-1?Q?gcGt+kJuCOJJGhIQpxpkRUELkMIqKSdINmdWBYI9y7aboEdaSvZ/zigwTe?=
 =?iso-8859-1?Q?plOm+H4EA/yUlfFH4ohINskaj9wgwldh8bPcoDOQ8F8Bj3Qj7OBW8L76oy?=
 =?iso-8859-1?Q?gHbTGxxFy0oNBaRR6TsAMJbvl8UM422uTVSF2IAk932eV1+NEnHYLNLduu?=
 =?iso-8859-1?Q?xfmVunA5dYqMJgQiDHEQhTPzcScAD9uf+UgtgZK3XLMB8TR07ZsAR//wp0?=
 =?iso-8859-1?Q?kqYNEn+q89BraKeojodeOKn9sQh69AwQbwtSWSJG5HhkNDNkRHGcYF0VM4?=
 =?iso-8859-1?Q?htinpjgbStUQboqJeuhN49Ow8RkyVMnHl4U9kPqYw94KjSZGy/rDhxcPK4?=
 =?iso-8859-1?Q?AmDAwDoFBadmSuu2TIlkpW9raGdl03tEWd8v79GQ1SSHmjtbsfjB0eUfOJ?=
 =?iso-8859-1?Q?Uh95V6ItVEqMhCkp01w03/mU+OshDs1eUxxKgA7Oj8RTqXQ+DGm47DIjYU?=
 =?iso-8859-1?Q?1dSb9SoMCznKcBkNGGYqLNXbYibI/LBHZRwt+rH5Irdp4WUvUIvuV2FlD1?=
 =?iso-8859-1?Q?UQR8qJsre0wQwOquykN5iA1MQeVl+DljJ2hYQ+U74Oapwb4xNzz5TXS0fx?=
 =?iso-8859-1?Q?7CuPDUEb7F+f942aMMqbhu3iVpnxxUdOz80NtkAHfEOJkoKnkEwVFCw50f?=
 =?iso-8859-1?Q?LXQFwj3PMzmxHYzyLOp56fbTDpE6ak9rQsj2u1LWc1Cx99lDIRZonrPS3n?=
 =?iso-8859-1?Q?h6Xi88zdPTYEXKYglAkgut11mxPrgOJBGRLZ071bimIN/wlG+lhWEIdRFi?=
 =?iso-8859-1?Q?Oek8zg9ULRW6gGbh8JkTvpAVU9ALjJzEyf8fBmxZnFK7ZSQ1nq0K13w4jG?=
 =?iso-8859-1?Q?aGDoDn5EXzw7QzKZsH0pbeODTJvhub88txBIh+BdiGEuEHH0ZyAF1UlQyQ?=
 =?iso-8859-1?Q?LEhPVnR9iIgHIPuUvbUsNNJKNnlrRrblT1a1zRWak2OLQGTPR+a4t8ejVb?=
 =?iso-8859-1?Q?QqAMDh0TYSi4XEowu0NZZepCzc85Ho+wXnb3VDVmIBD9xdC1CNx2n+G3Qf?=
 =?iso-8859-1?Q?k6/GGTryxNp/EUuueWKcHJvKlYflHajHop0BItHlKLP3DQmRjyrSXQttCT?=
 =?iso-8859-1?Q?hrpihNRqkARbqrLSmqWrpkNSAQeszU2ZMneITDrFAzwq4vAqEElhQSyQ60?=
 =?iso-8859-1?Q?nAaFN/b/KrMSVLn+t296SE4ZiK3T8aVg5lBK/z9p8HQCGqAYLK7yzCalfW?=
 =?iso-8859-1?Q?T/nMYv+edHtaaKPx3aDyZhLF4NQzKqQ=3D?=
X-Exchange-RoutingPolicyChecked: qAHWpJVIxZeBaQPdnWYEOYGnLdldVmJk8tWN13O9TizCogurgB7dcsrqvebLb4o+1fJHr6s74gKHeroZaoJZKp3CtPEfv45Dp3cO+jyBDfLxe16HvyI/oiDfT7rEE/Q72mgrWdnQ8b1Gy2eV3uqa98meKEVu4SpWkhObnNlJ+Kft6el3v87zO3AC1rDSD3cq1FO6ibFtUYbXk7zqfj4LABamhUSvb8WeoU3L9/X5U/dlU4KSKkIVxFBUSMU9UIEXo6TVfY6SK4NaSxsPNuK+hOGvDgg6FGBesPoNUp/8It/TlWK8iBnmIIBrETGlLGp9xSYqnPux7CIgZ0gamqLuOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c598711-4d4f-487b-56f3-08df08652158
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 20:10:55.5391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmEElLQ7F/ucrmVQ8U31JIWZEE5AxsI1NaalKF+RgPJeuF890eJ2kU1wmoNBA5p3q+s9+f5Ae6SyIt4VKjVZYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB243846
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

On Tue, Sep 01, 2026 at 09:23:22AM +0100, Matthew Auld wrote:
> On 28/08/2026 21:10, Matthew Brost wrote:
> > On Fri, Aug 28, 2026 at 04:14:09PM +0100, Matthew Auld wrote:
> > > So we can easily check if a machine had the CCS bug, when looking back
> > > over bug reports where we have the same machine with newer kernel.
> > > 
> > 
> > I'm a little confused about how this helps, so I'm thinking out loud here:
> > - On old kernels without Linus's CCS fix or this patch, there is no
> >    message and we get silent corruption if the affected memory belongs to
> >    user space. Of course, things fall apart completely if the corruption
> >    affects kernel memory, as in the case Linus hit.
> > - On new kernels with Linus's CCS fix plus this patch, does this message
> >    appear under load on some configurations, or on all configurations?
> 
> Yeah, this is logged before the round_down(offset, 4K). On my b570, for
> example, I get a nice dmesg print to indicate that this machine had the bug
> (fix from Linus also applied). In our CI farm, there is no print, since
> nothing seems to have this bug, also confirms the memtest is not just
> missing the issue somehow. But not sure about wider RIL, I assume something
> in there maybe has this bug.
> 
> > 
> > Is the idea that the first thing we check for is whether this message is
> > present?
> 
> Yeah, just a record in dmesg of whether the device had this CCS bug, when
> looking at bug reports. The memtest is also gated behind debug builds, for
> now. For example, some older bug report with impossible corruption or other
> weird stuff, update to latest stable or tip and issue seems to go away.
> Would be good to confirm if this machine had the CCS bug. Users might also
> want to check this.
> 
> > Would it be better to simply print the FLAT_CCS base address along with
> > a field indicating whether it is misaligned? That would let us quickly
> > determine, across all devices, whether the CCS base is aligned or
> > misaligned and if the CCS fix is present.
> 
> Could print the address also. Happy to do either approach.
> 

I think just delete the 'if (!IS_ALIGNED(offset, SZ_128K))' gate and
print the CCS info + flag a misalignment.

Matt

> > 
> > Matt
> > 
> > > Fixes: 37173392741c ("drm/xe/vram: fix ccs offset calculation")
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: stable@kernel.org
> > > ---
> > >   drivers/gpu/drm/xe/xe_vram.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> > > index 7b4478fb1697..0a2f1ab8416e 100644
> > > --- a/drivers/gpu/drm/xe/xe_vram.c
> > > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > > @@ -90,6 +90,9 @@ static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
> > >   		offset |= offset_lo << 6; /* HW view bits 31:6 */
> > >   		offset *= num_enabled; /* convert to SW view */
> > > +		if (!IS_ALIGNED(offset, SZ_128K))
> > > +			drm_info(&xe->drm, "FLAT_CCS base misaligned: %llx\n", offset);
> > > +
> > >   		/*
> > >   		 * Everything below this offset is handed to the VRAM
> > >   		 * allocator, so it has to be the *first* address the
> > > -- 
> > > 2.55.0
> > > 
> 
