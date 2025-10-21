Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB305CCD19F
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 02:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B0D10E049;
	Tue, 21 Oct 2025 02:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iG2j7etY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552F110E049
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 02:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761012585; x=1792548585;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k7O8WFTGwPJh3RGW4JM8xNXzvSeDwwFNcgI1S0F4oIo=;
 b=iG2j7etY6JapgWRdsrLgBpIFpcvACG0QGxkXatnvy+6VMxfoRK8mfW/Y
 Z1lfoaIZ37lEvEgAGnWq1/c8X7jd9QauMdPKT3qO7xk7Z/zOMjMR+rHjZ
 OCBLJdOyG+hTLh7MMSx25F+JaqmDDUQXCMOVhT4n3RQIaHlsAO34zrZ9y
 AMzoe+2AesQvA4L7UCgvpMy8QxyJEf/uV2a0/OQ8c5fZpqC4h5Mm9ocft
 qXwGIPKtFKTVDJDQptsIgf58mFTkp++6X+N50Go5P6K11SuTr4EQuhNQL
 1V9rjzmRMCQSewFeisUGv3bdbF7IhJTJcY0rnohNNO/a35YotUxxrF481 g==;
X-CSE-ConnectionGUID: 0LCuvK4fQB2bhDS1si97Pw==
X-CSE-MsgGUID: eHGN/JrfT624HDJib+ySqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62343990"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="62343990"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 19:09:45 -0700
X-CSE-ConnectionGUID: OCLiVth2SwaMUPo8b6Di8Q==
X-CSE-MsgGUID: imFM7OqrRXSfKraIe8b0cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183180469"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 19:09:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 19:09:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 19:09:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 19:09:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smKEDJRbLL5c1XZYiT+fGWFhfUdWSnFeh85yZXAt9gB5FuA+hd2QnjT2P8aNSt4rGkUKQJbKtAdXQ34fpdv47eY0+VypuYDkaABFufIjbiWOiOcF+UtDWy45ABIzU+hIxlMOMiXN9G6BIRyxKa6oB5vt4s+e7xo2W3QaQxeXqwyW8PPQfIw4tXD7NS6IrHlUhx0YIXEDzG97L+UkdZYeLG7y+akFWPAEF6KXpOSZm6fNO2WZad+hF6i+Z0ffzcUHRVatbvq6N/jirgyLVxqt0su3zsm65rlPMEFjZ0HFVcfQgfPOvoisZp4LgWimxFKjPcLJWhl0/Morm9uzuGTTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPH9nhHnRMMYZ0o+1JOdzWedlpGvMnobl4fT1nA5Qqw=;
 b=eIiv7mq1iiixXlPLcdTOPtdjyn/uU9xaC+TjK4yOQBv3UevrOhBHR9ASfndTNjxrdfKg+pRNmztWGk82EA+XLLsuR7u91/BEk21Pi9pJLyq0JvsHoBQyiDO6kejpkEx93AEb8LWS7CjeUZeQQIO2k0Lt/cBcPe7ZalBfTsO793/RDbmwhwa5rCtu+joCrR5Q9+o36G18gHjon5P5cOLxO0d0I0kPnFA0jA7LNxzQNp/o2otTnSD7J/CFpgIrDvZyjoAmGgPa3pHylwja8+38dZnYXco7R3lhSM1eb4wu7wCrhKjLLHZs1mWWxkWyFVemjrNb379SsZy6t2KkcQrmqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7410.namprd11.prod.outlook.com (2603:10b6:8:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 02:09:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 02:09:42 +0000
Date: Mon, 20 Oct 2025 21:09:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/tests/pci: Check dma_mask_size, va_bits
 and vm_max_level
Message-ID: <xuzec2uju2x52qc2ci5jaxstarmk6whjgc4ifr6al2k4ucseuj@dsyf2imspbjc>
References: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
 <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-2-27b03971bc7e@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-2-27b03971bc7e@intel.com>
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: ead6706d-4cd9-4bba-ea3a-08de1046e623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5llC7RRBWuvLGQjeM9Fx06B0RhHwdv2F3xv3KKFklNs5HdzYp1F6e3UcvSAf?=
 =?us-ascii?Q?r/1vggGYIoaTwy+or/Vsp2TSmsB5z4PbA2tbJ7rVWZVDALyIqc1UhkTC1+PG?=
 =?us-ascii?Q?05663vTAYHcMSYKXPwepjg/Qv+F6f7DRHeUh4z9TbLcrW/NyU1jJT+MjVg+K?=
 =?us-ascii?Q?QCc/9cUIeQRT1aM23dVb5TCloWkTFvD9F84dLqwu6zU14CJoabVyqWT9Wm5R?=
 =?us-ascii?Q?/TtlWYfYu3Tz42V7ntW7JOQ4sBKxwIdoSvP7h/nlzrlPXctfdESmmuExsBpW?=
 =?us-ascii?Q?W4AUNevzPHj9zMsvwHpJZEdFIlRRpaphJneFHucZqpmIqGrkwcSFlADIke3W?=
 =?us-ascii?Q?ONYz9ti3qCzKTkD36nBMBwsg3/LzSuxGnK5VrJ9FajuWBR6itc99oe8BhrsL?=
 =?us-ascii?Q?7u7eXQRZOS8rsTlvpqxeBQ0luNh6bP4GEh73VoZbvJ8emNjMC4/RXYw9PvJy?=
 =?us-ascii?Q?czD5CVZp0xGmPiEu56IZ+CfJ7T2s26JCgSfNzCkxJQN90+DBqgt3IPVmnLp/?=
 =?us-ascii?Q?XFeFY/cNngSTcAMfQkaAAUelMKv/Ft1Pc9nzG2C0WaDXz1Qgj/fSF+lnfLVW?=
 =?us-ascii?Q?Ck6uKTtWA77lTSaK/ZkqG4OpnNiTUZzzGjzak7Htcqpq+LWYeLrVz2AMeKTK?=
 =?us-ascii?Q?QKqo5hL17dSiP7/P2XJO2RqbWbRyGmn1Gzh9LIGoyePdPg1JfunMA9dXBdEx?=
 =?us-ascii?Q?OCKLbnQPqJAAGBsb+gY/QnpCbAo5XmkxcXp6BY/0T8fuHuRFGIGMplgPsEoU?=
 =?us-ascii?Q?rmW5GEfDOklV3eI3lGw0puvYuMvHDqCb737vxWpmW2bZLI8oYovjLnFZ+jv8?=
 =?us-ascii?Q?scxZfJ+kNHPH97xrFgL5PqZ9UAfBNloOqrSrxVpacj745AmB+S7WfvGtwsWR?=
 =?us-ascii?Q?ij4JWqORmdxpYdzSZf1EC+OH74Nhwe/rgS1ibhWYuiXmFlddPy+AjiN8no2A?=
 =?us-ascii?Q?6GyKAllJJhX5lzKNBJbSzDqjSURdAuC7xaIkMoLZhEp7+p0JrYtigaa9co9W?=
 =?us-ascii?Q?syRCi5a3EIjXbfj3XZk2UHBDEReRh7rB/0Tk3hHgMkabEp4OrQz+QyON06YV?=
 =?us-ascii?Q?GHDccrp0SPEslnlfNVfzMYKKmJlKdS945fM/Afysl//61ajMKquIATFgnSDw?=
 =?us-ascii?Q?cfgGOk9LkIE9D0WAArczzRWOEqoVClkPOTCdeKE1rh6xX5jg1/1hLNKDpIos?=
 =?us-ascii?Q?QsYpxaLPYw+oQVQTI0j2d0ORtFfBWhEhUCJiI7ng8GCgYdrvEMd/iU8ExeaX?=
 =?us-ascii?Q?duBTc+AjbZtFlmUmeKvChTcNBkgHk4nXbIlouJTak8jz2Ffg7VHKp2GkDx1V?=
 =?us-ascii?Q?NbxSuPwuA2oU7SqJQIWDHg5/eYaqFJSRVCAHWtd8c8maLf25skejbcgz4zan?=
 =?us-ascii?Q?KeB8+qmIKOFcXjHQwkUtUcrIgZv1oORJATAMMSK2uNFipxYG/Te0+wQAXKn5?=
 =?us-ascii?Q?btvrNmZU1s18WBOQW7xzxUqqU6zzrait?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?evz6HZtHozWyqQqv1OMROLXUK3CT0KS0epzaC7+fvBNsKYdLaKJ+4jzNOdyZ?=
 =?us-ascii?Q?Q8vmzeGY6OwGjiD1yD2hMth4Q+82aYWZCxdjUYuEhbgTY8a6ViwzoxwDmF/E?=
 =?us-ascii?Q?lmh0QYXz4Lu27K25l6IYlZQ+XN8WGhoJcf5GhHu0DvM7BZmDbv/xtGx+4wRX?=
 =?us-ascii?Q?ZZZIuimxiqflIS4893kNk08UntGLX1TWZc71pIdp1YCk6H1s14Lp1d/rl09L?=
 =?us-ascii?Q?jpF9cO90x4YRFRiQ5orNfaA3U1DgRPvs1q1Q/Kfa1gN0RK+2dTtSLEzeUI0t?=
 =?us-ascii?Q?AtfWJhvmg3B8UST++3hczkIa/jvEiKWtiEPAt6obNHqEazbtQab9hHikgJlH?=
 =?us-ascii?Q?ueCtLOBpnBWCrxtZOANDc4WKe+A9XlGGJ7hiCIlBOV2GWdw39ptGnaAY+wjk?=
 =?us-ascii?Q?k+h2zRAfcJBeQ7USCStaxR57tKoB2VxfreBrR2jQ+F0tWvfducufUGu+AjIO?=
 =?us-ascii?Q?wZRtNTuz6Gw3BUp4dl3StQxLOnswJcEEDJh3vJ0wAWIyKY0gKdvL0Mn1w3ML?=
 =?us-ascii?Q?wSBKrKsr80UuN3H/jEMuXXtYbEDZNV2T+uRzYGEmZzKwGn0RzJd5Xvd/vZTS?=
 =?us-ascii?Q?5Aw/wLl4ukCc5HgXKU/628sMeQqS10F1H4F2Ms7dr390EssM5q509I6W1aLk?=
 =?us-ascii?Q?AvtMoAjEbnNuqntHrhAwD4rn8RDfD13/ACrhqippzGADS4r8JNWahvZ3okM5?=
 =?us-ascii?Q?Yu4FPMGV70PX7GSg2kmAUMG+EUhsWxjd2m/Q5SYYqgV3HKsrkamLUlJUPzmb?=
 =?us-ascii?Q?GER57xBlUHb3x0zxBaDL98BGTJ+cjrgVlX7Rq/ohAsrkK6nOjyYO0AeR5Ovq?=
 =?us-ascii?Q?Se6qOvsL3ddsH+XUEkt0gXh9MwJeAQ5olgSRrTM8QGPr/Z2V6jkJA3w5C0jL?=
 =?us-ascii?Q?xZN/2w5N3pXVjtdhxJaSuS4JsdytjNLNFQQO8kPY3EafKFQBWG5lB4l5ex62?=
 =?us-ascii?Q?NWGfIRSZU/WVBToU14nxq+rRk+EuK2sgQW8CUepRdy79Z2hg88nLSHU6ysy2?=
 =?us-ascii?Q?hiYCmD0cfkB6T+KB7N08mnYavwB6VMzcV9Id8zuk4BypS/MGSxfcoyVYcp9Y?=
 =?us-ascii?Q?s1BW+4wKgpfLj/GjKULvb1Ip0t1Jbu1RPdTaAcnVcLN7JWyXENeXqYec/nMf?=
 =?us-ascii?Q?jfbpCQ/dKhe2n/ZTWa88wbzoX8WY4E2SCdkHKJd7sv6S3GryKB58h1nLg9Wg?=
 =?us-ascii?Q?s7JUdNPSGHxnYUMF5Tsg20r9VJS+PJCwe0/Lob5xHjnHfbChuj/FROxR2LuF?=
 =?us-ascii?Q?u3xejYnkFIPoBVmpIN31rTHeX165G0Yn6SYHkxN5tykA0NbqjUNb1z6I+3wa?=
 =?us-ascii?Q?0PhlzvpdOuT/LJ7L/zuOlch/4lPto4+FCBVZMIillnAt/53cQdT0JA+/9LnG?=
 =?us-ascii?Q?HfR7skXX9XQsqUfrTqFd1lDiMyW4khFvLsIpchjXR5alSJ78vmyqzMNVGEOm?=
 =?us-ascii?Q?Nq0dbTLyliFLmUFQd56sgQi5woM1nTGLH9IK6LjnLObWWfOI7ScRftaEgvyc?=
 =?us-ascii?Q?ioF3SH1ASi5ATAGXgPvhfHN1HysQUurEoQiufmMY/cLSIFitFg5ilHrUMHK7?=
 =?us-ascii?Q?1R5AmKtKcTiN7/NB9QCqW2Lc4WkQ0FiKmI/no2rSa3tMwKZ+AZoA2UQnnTv4?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ead6706d-4cd9-4bba-ea3a-08de1046e623
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 02:09:42.9295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odkeCJS2j5OZZ4BPCv1/QvPo7jiTco51sAFmFauyfaMKMRmwQ1N2WEMb0myM2IJEDKue7xwmUAb2RtAalXpIDEKTCvZtaf7BzoqkdVtIzPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7410
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

On Mon, Oct 20, 2025 at 08:45:57PM -0300, Gustavo Sousa wrote:
>Members dma_mask_size, va_bits and vm_max_level of struct xe_device_desc
>are all expected to be non-zero.  Add checks for that in
>check_platform_desc().
>
>v2:
>  - Also check that va_bits does not exceed 64. (Michal)
>
>Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
