Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D9ACCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 17:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F8F10E934;
	Thu, 23 Oct 2025 17:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ds8QINbE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1F910E938
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761238801; x=1792774801;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wh9S8alsUvMtZVn8ynsl2XdWIqzXiLDWHg2+InRd0Ic=;
 b=ds8QINbENgqav2CbqbndrmeK/iKZVQOst2pjS4e7FhDmxe+sjWqfTq8y
 RkKOqIhz9+ELJlXd4vSArA0C0wFtY0Prfm0A3GiA2NF5eatOSM5NPBiuJ
 qyHwea22KLgmMlFJWQZ3q1jzn60DppFkkOyOna66vyjCgCiEvQyFPhd+Z
 fvimGbUu9kmXk71R/OnD8jk908HNhYgEQDQSqHdckutu8dFUzyAAPxMNW
 Jp/57B5MxnQV3HkSd3hHvWIZLTRJhs6EON9J6Fw7gIkObKzKqaEwEzqtK
 YYZhrN50ftJdtsux0H6aRGi/hRcj8JKcsqIjvJcNGWqSHO2YAaWerFLwW Q==;
X-CSE-ConnectionGUID: FQnVgLS1RA+XePcGhxTTJw==
X-CSE-MsgGUID: 8AKsxyB7QgilcZpSZqlLLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81042745"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="81042745"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:00:01 -0700
X-CSE-ConnectionGUID: wv/ijDSbRgGxXXoQ3so2zw==
X-CSE-MsgGUID: SXixcOsZTqaxGtKG0e2PaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="183814416"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:00:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 09:59:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 09:59:59 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 09:59:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cmgjyqk3Ak/q0YH/xQj3kxYvBzZUXB3nXV52Yc9tuHnPLOLdPBoiV7dWMd7+x5Qyzp6oykKj02TAkc7IGOY3dAUwaVdKwD/uwdRFshf7O5M7UZVuOqeIeMZg4IZ5k07KTVfi12zMnt/fBNmSd6G6pNFkPHhQZrbT727drVI3VhUpSIG1czY8fyJRkCysUztXMkasSRSs9smpRJEeDHASPpMcs2igmBLK002Anade9HBRz1ep7609vbR6Owby9Nd3F/yTmoCuFOeFxl9p7AnG74udtl+rI9CxUBd+bzMp3jAi0Y3WC56em3GaO0ICNYZanAlLqmwIAgbq2eRp+Zk/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrU0XnHHUfMqe+7ZOIJAj/1r8b9anvWyjfdulxfOWSA=;
 b=X2Y4Kwat4VKe2qImnpoabeACFyqIRN64CgxZLJ3prjEVIJMjEPtkS+z2ir2eI40r4+YOFEXbrr+x+oMwHA1O17JJZQ3B0FxHsVDxIhAk1FfZcf0E4BWrK1vJCyxR8HjWC5SFqjIqdYUXDQnlgUTq83ft165q4FKnOy0kKH6+jIwD0eOhNuNe1reYU5dyd9Dpf5/Y09a/YAM4czSP1ew9xhV/vBBDks/5v6J76nIEexsBMP/eiRsBHZSDsbuKw9DI+fto2Kz6Ady2Nizs5zUNdHejcUt3g0VIQKMdnsjqRVC9DVaqnnnAJj2LDgOGmqdMAtC9act0fYAe83jIIRwpSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5118.namprd11.prod.outlook.com (2603:10b6:a03:2dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 16:59:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 16:59:52 +0000
Date: Thu, 23 Oct 2025 11:59:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mei: late_bind: Fix
 -Wincompatible-function-pointer-types-strict
Message-ID: <d3irozcnhptufq7jbzrou7s3snjj4rw5jcmcqxqajin5zw6lnw@qhnrqk3ibskw>
References: <20250920-drm-xe-fix-wifpts-v1-1-c89b5357c7ba@kernel.org>
 <qxvmx7nawbqjj5luzzken3psdei7pvgliieiv4vdxgumb2wpkx@p4ckdsds66ak>
 <20251023165205.GD2090923@ax162>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251023165205.GD2090923@ax162>
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: 31019353-83ac-4033-f175-08de12559579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J7fgVc/2P3qAapNiQWkGC/9uZePVsSXeZzcUy4gh7geT5z7sLtqsa1W4HJF2?=
 =?us-ascii?Q?+OUpPjbqoNoPDIZ8WG/O32kvqYPH15kDl5jyVxuu84sLoZgwRCuwcrbDcMA3?=
 =?us-ascii?Q?IsUh0KZEzv7FZqYA9EXewPiSMApXDIYEn29bh+MbMfb3rhHNZCy6oeVx76dQ?=
 =?us-ascii?Q?KSqWvO5YRIRtVbllaU9WSDurkd2E0CRex7sqpS0/SDB1qowC466UQH2oExxQ?=
 =?us-ascii?Q?TSHeP5CtEoIV53HixleKIELVP1aKV2jysYdtcOk0sN5K8E4NCvjTPB5wER+k?=
 =?us-ascii?Q?/zEA5NeBTX0gub1QOSq3c6OzYcQ/TeRn27mayjAdhvTnDDUzsBSjSB9rxQtA?=
 =?us-ascii?Q?DK5/BMrg9NzxC8xJK2UOeVH7jr5Wy6+TMNOp+MvyOCo5QPQQ9MXnQWhCpQUf?=
 =?us-ascii?Q?6BtzFWZY1QuXSVmQBXiiDxDKwdHR5vC82yi9kN5dQbh5dJpBVTJ5CGECK2Ae?=
 =?us-ascii?Q?FeWsYIO0k7WUcJGb3mlkEqf1rNHqs2IgG31wti55YZvDtwEbFKiCY8/erhxc?=
 =?us-ascii?Q?0W7rN3IxUGaq4ofx1JQ5HFEjGpk7aMnwW8Cwo9k4u9Wu8AjBMyvcrBxRWcN5?=
 =?us-ascii?Q?4At4YTlfoP04gSuC4bcKPjYGMxiIvbldytebi/RZVDBOXjMNOaErbRvEmJSA?=
 =?us-ascii?Q?IxTF5etmmKDJom0wmdfFQn4os3rvtZzSJnyd22cUaxAfoxuLJGnL6iFQ4XKN?=
 =?us-ascii?Q?CJbzCHOi8b4xdL8BOdaNsLh5R9N1zVHv15aAcVIOu3tHFalhBejQ8VQa2tQS?=
 =?us-ascii?Q?T4p8GwlGMz1kCBwtvlMbYDNvwHxVP0ZuR96OPQg4adrmx+Nvc0rHZMmhIZ/b?=
 =?us-ascii?Q?CaqEFtGJOzkdy53GeYgqyYFoi3edre0JDWbC3Xt1aKQ8GXhRPDDRDIdYX/i3?=
 =?us-ascii?Q?/VtBqV3Vj986xc9zDaubsKfnfdQE2ehlwD7KV/iCfACreeHap2hznV3gAnYV?=
 =?us-ascii?Q?1mK+rLK1WflpFdNhopfuVPpG2oM4vZaGoLxCAH24zaNm7P7DGGRVzIrJupLd?=
 =?us-ascii?Q?/LvHWM199zRdjKHnn7U1dmHupcunnd8r7oQeC7E76WSDA6HkmJf7kaRMj2HZ?=
 =?us-ascii?Q?w/a/dvlfioMe58gVPy9PmKZWqMHGGEYnYm+q5mt0/IgVTtWFweEDVY5Sdp0h?=
 =?us-ascii?Q?pkUvsf89SNvDVgmZ4Kzv+btTMkQVNLK0bgT4yn51qJtLtX/2d+L3B2MQAWVk?=
 =?us-ascii?Q?B8Etf33BinYdhbsb2prVuMenZHZ+Bd3a3eZ/lWP5Efp3gXvAOGkOxr0cbMuY?=
 =?us-ascii?Q?/ufd59KcvlURSLMgZjAiwpAKWZFwrxZ67CdHyXJ10PKzC38uEsECboVrF92u?=
 =?us-ascii?Q?5ZrVwOl+kHrg/aeLp0OITuFJ47x4ZaF3IpEOAsrNSVli6JCcRP+S4z2aygRv?=
 =?us-ascii?Q?YzETWGJdo9ephQQxWHM8y76S3iU+5K9raaEYbOyHwc3ZcOnZVu8lvg9rt2KA?=
 =?us-ascii?Q?5+yw4fpB+v8ys6Y9tm6bXPOwi7KWRd4STmtUToZgo6VEu7IuVGrpxg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9l5z5fSOmQmW8brjeItLTYpEq9AxoIQ8oRSiCCX9EjFWBj5JcP5+zuqWtaiX?=
 =?us-ascii?Q?6x1ABoebodGQQ6Jb9NLE0UhMqHBQymM23jtsWZhWd3Kh+sIDFF8c6AQm45Gz?=
 =?us-ascii?Q?9LFw3leg5OOcsTgqoQWWOrSNhguYFU1hfGiUzrBNG7ZQ2wAgbS8TF6oJFjaQ?=
 =?us-ascii?Q?+dEf//Nm+yWItwzZqXHrYlsMoRYu1s3Z6P2NaJbi6VvvbrvFSc9z5EZCjX+u?=
 =?us-ascii?Q?CWQpRthMxL0T6I8WtIKWFNWyrkQJOEMhS78J91TFWXHBUi7Pi473JrKZoNxv?=
 =?us-ascii?Q?bV6aXVYfrbyRGqZ+A0SpG2af3QuGC/gc1tqv7JNIzyd6LtT7Y3WeAzdM6m3m?=
 =?us-ascii?Q?5TxU+4+3vb4zIFptP391sdhsMHKCkbjKCg43xVlrFrmxYTyNGhIFGQKfouKd?=
 =?us-ascii?Q?1Zik1O7exrLZQs1GIoqRAKvIVHsa9dzhJZSVYYxajhmA86E47NQ9ySRXbnGb?=
 =?us-ascii?Q?Q2PcQgAIXXyUgtUjpBtTyzi1AmpIYjuV8g8rvs3nOzxPausJDHNeezY//IEN?=
 =?us-ascii?Q?NiEfcFLA4/TOkVjHzz3juxKkii4TXx2SZ8pgDGEA0gCrUXsH/duxJd/zXChb?=
 =?us-ascii?Q?5YgVAyv68pxm8aiOBsxhoiemKDh0eByQ+hGV8XLvLs9nW558UMiddVuFU//P?=
 =?us-ascii?Q?qZd8PDG6lVXXvSjyQxn6MWEZPqIVgRGS+pFetmXEAGO2rt8sGg1jJE1dZcWd?=
 =?us-ascii?Q?NAi19ZFgIXnzz9ywm1x2ubMFkm/o0f/PSyLwezoLMyVhpm/vZfHcgtNNaM8s?=
 =?us-ascii?Q?dkrTuc1jFsblmXPACMM+hfPlfT307mACOaYsEU6qthD7v72KbE7mVcQXbPVB?=
 =?us-ascii?Q?dxeOQPfkry2qQyjTgt0N9MTRN/iJreMvnmrG19LeA3W9zBpyd7xuNwXIdPhC?=
 =?us-ascii?Q?uoZMDrYAMcAo/x1ZTytONJbpkctjC6pTkU7YOtgzHtARVvRFdBnM4xA4/+n/?=
 =?us-ascii?Q?ZosysbyNssy6m2pC+4bs7NGt3aHDFpphyE+Bp3nzoxnH8ZIH0vR/raLttEiq?=
 =?us-ascii?Q?bMiYwmS9CUGieMLZFjwoQjC9RtkJgVhOsUg4LW3xvCi/JsPvYlUXcancNAaP?=
 =?us-ascii?Q?J9Y6y5uK86FwvEeiUtOgETjHr7XjVLm/sShKH9aprDW8rxilbGwB+rOtbxl5?=
 =?us-ascii?Q?AMVa+hfwRsyROGGaCqRbGWyUCLTn5DvMMK6ALw84ZOCXusM6sXIpYZwLwjWd?=
 =?us-ascii?Q?Xb1fR/EeQcG8Z+P1lezxL88iStXyrjRLDBEjB+XbBtycP26Em0EzGPzTmPCr?=
 =?us-ascii?Q?Q+uIex+/dsCoO3oYTca6sfLSQfaiQxBwPJF8cZX3qFWY8Nju4FsO6jLk/0SL?=
 =?us-ascii?Q?3zPxjx8+yTyAkFFnr2ZzLPHDNM27SiZ0UAQnnrtZZOx23es7hkz4Jcfmf152?=
 =?us-ascii?Q?ZZe/SYrKZ2dAMRUFnSb3iFq3G+4PgFyEBgAof0ML8oTfD5vPl+O/7WD3ntaE?=
 =?us-ascii?Q?9l7VM64wSXh5hIp6l2Joj6YyDYnjhChU3yhuhgUURZXLn4XNTsL5Trg3+C/m?=
 =?us-ascii?Q?dvf3GeC9kbt4uOPEkGpFN2HUzEIBNV/kNEN7U7RJ/1qRaWG1a2wKMnk7uUR3?=
 =?us-ascii?Q?CXES0SWvmBrJJlnYXyVhKN3BgSU6+TGjg60mcijGZ9lRxVQrvrEqlwB1Ennn?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31019353-83ac-4033-f175-08de12559579
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 16:59:52.4513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBafABix4XCGpwUwuMjaiigevkAI+hIwMjbAV+5/wn7bsVUOFjcwrbo4doRAOEAk8pSKMrctTu741+OOKsdC3LtFw5vR5VEjSfPmwvRK10k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5118
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

On Thu, Oct 23, 2025 at 06:52:05PM +0200, Nathan Chancellor wrote:
>On Thu, Oct 23, 2025 at 09:27:03AM -0500, Lucas De Marchi wrote:
>> On Sat, Sep 20, 2025 at 04:17:50PM -0700, Nathan Chancellor wrote:
>> > When building with -Wincompatible-function-pointer-types-strict, a
>> > warning designed to catch kernel control flow integrity (kCFI) issues at
>> > build time, there is an instance in the new mei late binding code
>> > originating from the type parameter of mei_lb_push_payload():
>> >
>> >  drivers/misc/mei/mei_lb.c:211:18: error: incompatible function pointer types initializing 'int (*)(struct device *, u32, u32, const void *, size_t)' (aka 'int (*)(struct device *, unsigned int, unsigned int, const void *, unsigned long)') with an expression of type 'int (struct device *, enum intel_lb_type, u32, const void *, size_t)' (aka 'int (struct device *, enum intel_lb_type, unsigned int, const void *, unsigned long)') [-Werror,-Wincompatible-function-pointer-types-strict]
>> >    211 |         .push_payload = mei_lb_push_payload,
>> >        |                         ^~~~~~~~~~~~~~~~~~~
>> >
>> > While 'unsigned int' and 'enum intel_lb_type' are ABI compatible, hence
>> > no regular warning from -Wincompatible-function-pointer-types, the
>> > mismatch will trigger a kCFI violation when mei_lb_push_payload() is
>> > called indirectly.
>> >
>> > Update the type parameter of mei_lb_push_payload() to be 'u32' to match
>> > the prototype in 'struct intel_lb_component_ops', clearing up the
>> > warning and kCFI violation.
>> >
>> > Fixes: 741eeabb7c78 ("mei: late_bind: add late binding component driver")
>> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Sasha, is this fix something you are taking through char-misc since the
>> commits that added it already propagated through the 6.18-rc?
>
>It looks like Greg already took this via char-misc-linus:
>
>https://git.kernel.org/gregkh/char-misc/c/98718e80af0bb1cd80f4bfe565dd60c57debad51

ahh, ok. I was checking rc2 and noticing this was not there yet.

thanks
Lucas De Marchi
