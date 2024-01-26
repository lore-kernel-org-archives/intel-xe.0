Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6FEC47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 16:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525AF10FBE5;
	Fri, 26 Jan 2024 16:05:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E808810FBF5
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 16:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706285143; x=1737821143;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=twV0q0+ZK6ZSyRWGONC4sgB40KeUSVX27J2BOox25Ao=;
 b=cjbhzJGk24kDQIS/yanNmZ8iCNuBeJLyLMbIQnX8beZaBq+MwGnl+bq2
 HbRokXhNjOo50+tXCPWj3ioIT8hqn/+s3xXtLStgF3mUZcbwncAOz1KoO
 tuLbnqjVY8C/M4RhF78nAuBVFSwFk4q8wcz0yu6YyDV+9FoUVF6b45PwV
 TD5PuTEyet69lIhawc9+TwzpSzncUnU2oWoQmPeJx/I0XQtwklC2IcN8g
 pmVoaSGGBvbPrk6EUh7CRoZEHvmrhuUEG0r7L4yWTSvp2NqobiJbA+NRc
 gtwu76JuoLoO0jDSDXbzF++egaDIAl0SUzoIhWZs2pVJkUZlI7rFCLIWi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9185725"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9185725"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 08:05:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736719549"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="736719549"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 08:05:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 08:05:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 08:05:41 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 08:05:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpHl4o1VQu5qHvIiTxwqerWbK62aTj72XCrl3FPKvVSlWEVhCkeDh0SOs5n6mYRxM71iiq1MRU1kB7Ol47wxURCnZiBZhD+bjV6Kuo8s6BPyykTXuBM0xfaNgMFXxFNFK3/5Hwww5EYiSyMsIknhgzEtdWYnNtM226GjU7hwDsJwOI026WtKZry7JUcbtF2RzoS2Bo0V1Ilryotmuhl0shJIlIDL9KHY8yDkSTwSsM2VslRGMaoTOvljyFuVkAq2h9H7kMWhHrX++zME4lVCKJMDHWdGGF3uPtevucQ5GgBMkfzf7QsyNGOOKsx9hJ9hLqVQmXX4TQerm/fxtR2AAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ueoIGQZwdp24b2Ch0m1O/YFjYG70UbEaRDc3PjNGjc=;
 b=l+13EOIFzVrm1/CakUUwjhiWgynroQOThrvvDycNwamr5RIJfruNah1/ZNC0VWpYfnpM1DoyRrLz5/g3/tDVwLIf6ArGVHl9KNiM/QblYo1qfjcnUG/vWrdUUgYPEvejvWFPy9pVrHFyovfxMdAdl2fJZDzMDVc/5g5ll1pCgsKT/SI6MzYmVVX22bi+hog2pZXcgrx5G6o8KN8LO7LXilaHD3tOM6ifMNPoLjBIjJpyYp1yBQK+fTLHaL+HfyHTTMmwvXfuauvcoBda/9IDi89A8e3Aegjkk4MiyOg1tooIhMEdCwrI1oBB9TwG9W6PKfS+ZzO2UT2tNB/AWgvMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 16:05:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 16:05:38 +0000
Date: Fri, 26 Jan 2024 10:05:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe/hwmon: Fix abi doc warnings
Message-ID: <5klw4ya4dqjb7krzgon44cn4gqyiuk3gemof7lvk73ge225bmv@uwouw7wmcj2p>
References: <20240126153943.2294003-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240126153943.2294003-1-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0072.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 70bb3e4a-56b2-4b3f-faa1-08dc1e88a34e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XTLZApPNovcMyF63ol/sKob6W0VGydFuAjwL33jwIOn0Fmo3pcmX5dKwdxHfDEzKN69SVcQnKVRiKCHqX5U+Lo1cDMv8/gYnUgWyDrc00wzFbYtLx1XS0y6P6vvWQgTJ/w9jlOrIaCZYs1npDekmWW7GpsVxQXqvSAVmj8MusM04lmdyEj58lXkFQfmbMc7sDgzTtBMqg4LmPIvHZpyTLZit7mJ9sUOBCOMhor58JPbAn20DSocjzPNaLhVN864RANhFc4FFX1GE1tv6atpCbtD+YYLSii+GGVXHK+yK2dUz97xdGNFEm5N0MdpNdfeAKrZ2ApoJ7R9sTo0hmo3RTxXt5XsAECYARa5+BusB6AykAzRcBzOSpeZ3/1NxS1c8sO/DWn9BYRQkQR578go/1kGF9+RotPfW7ZTw2B1uQwUU/RchB7edZwg4ottQ/udS1xSSH4zn7KOI2XQBONDJV17AQXtl07kxD+xTMo5ZJsPanAg7xjLCVP5Tg83XT4JwxmehQWxQjrTQMOcSFZqghWfKEEvXTOYb1T0m30+JUvITL3VjlzwMyH2ymN7OUnPa4EWBl4552PI/RzdjNvnqy0Da9T7rHmibBfldQjoT2q4npg+mNSv7CubOe5lAgsR8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(396003)(136003)(366004)(346002)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(186009)(1800799012)(86362001)(316002)(6636002)(82960400001)(66476007)(66556008)(4326008)(66946007)(8676002)(8936002)(6862004)(6486002)(966005)(6506007)(41300700001)(2906002)(5660300002)(38100700002)(26005)(83380400001)(107886003)(33716001)(6512007)(9686003)(6666004)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VMO55B99rlUC95u/L730PVWzU70IyZtEQKIrBQNGPjVoYRFEdXsTGDnn/xYQ?=
 =?us-ascii?Q?aIG4jxpmZ86wq3pH4nVd79HXgUya4v/lXS918SllmKNsIT6Iqhyx29e45uqd?=
 =?us-ascii?Q?4afHdX+6dzy3zXNqnGdLA/vBl9EzGBXp85tjjchtoBGCNM0JvWEqiahueady?=
 =?us-ascii?Q?qfTIIvUrV9y7vXsnKkw3HaiYtq5IID5omKaS5MeDqPKCRdrnFFGBfQ+IinmL?=
 =?us-ascii?Q?KkeI2wl/jyP/xK/Gb1WQtbZ/eERkmhDgc6RdVqY36HFaywSLZguxdsgW6WsZ?=
 =?us-ascii?Q?oNYc/4tM7sH2EewKsTnxF16Ukd5lC/E1ifOD4RvhcVSxMtqdKLbORUp//3Kg?=
 =?us-ascii?Q?7qgOybebUxmBAvB2OHsrvsjMFv5A/AiJjTEBMUN0cwsdpE9FWwfkt4EszErH?=
 =?us-ascii?Q?RaqanYqjltQNGfM8+2E0aJjVCkSs6RwPFoSZRGfOendCV1cwdZ6kmpOgUpBg?=
 =?us-ascii?Q?2vOrDYUquwm7L9xI2KwuItWPUJJW5Eiqgacczfli6KJ24Ql2m91QPETIB+w9?=
 =?us-ascii?Q?giDXtf9IzElfMhR218nf27TU8P0mzfIaxJslTOCt03YJETfT40t3joMa3moz?=
 =?us-ascii?Q?t3aOlQeb1Wv6ZaGFAWAw0D2XmTa7knG1HgDODsXT7Ym3xCTeLefsTXclSwr6?=
 =?us-ascii?Q?agzgSKPuRhqVla3x/1reJw/clH+3IwlRfdtraaam/fAbHvg5sBKsASHtrk3I?=
 =?us-ascii?Q?GiYXJO4ljV32qFLUu8ZSEiwYPmt/neYcw5kGf+VwDjZJquKFOwqOAv4WWhzg?=
 =?us-ascii?Q?Zu0lKG1UF3yHgP62lFZwUky6uptdpg8cOMjNjXV3jUzi8a3I2kK5lCYg+po1?=
 =?us-ascii?Q?raWy3dmKGyHEwQXQsp7yUSUa/nWn3HUyIfyTTFsbw8JJO3t/YhUB15vSotHV?=
 =?us-ascii?Q?yJzb5HjeQApqwYaslugVK9aM69+jrZi+8ENQ6+TKeNEaWwUpNm+xoKonRYCC?=
 =?us-ascii?Q?P7+qrbTT8U3fGk88wP7A575g192IIxx4hUxZvWe4RvxUaRZBWlKySmIEXBV6?=
 =?us-ascii?Q?fa7XMw8ktV3ePBKE0IMPQuBEOSqpIrHinYThgBnLQpD9DYMMSzX2YdeIII8w?=
 =?us-ascii?Q?ekFb6ydCE7aUEioxUQFQ82z/upFcdfKodkjv2BaBm+4dU87zL0pGt02bC2Ed?=
 =?us-ascii?Q?Ojskp46fmmoFrPf18v9s/jarkYPfMgapnxXC4LxapElZZmbngdJri67XrqK0?=
 =?us-ascii?Q?AXKuyFiei8o+w6KWtb1ZFC+sT3oA73WTmrZSSVYED/9yzwe9PI3J9DF5Ssiq?=
 =?us-ascii?Q?IhIv1ssLnf9xi02Mezl7ipggp/ZjiKEWGP2FInGgoQHKURN17hVpodF55fTA?=
 =?us-ascii?Q?h8QERjpgriMCx7WCOL8+nt7khSKYBgoJizXblIwpowB7mEkN5HZ/X3iZNiNC?=
 =?us-ascii?Q?eGUaKQV1qpIdvkV4NnzMiUDZ7Ap49sqCS4h0kMTWhjpCslZZzIlbfdjxYVyq?=
 =?us-ascii?Q?Ut3JF8hUDL0p5jISVQlFkmR5NeNEpoEosu30Wc+Eyjjg+itI9pKw5zvH8Qkq?=
 =?us-ascii?Q?wLU6yMjoyHKtHeYPS9Zsx8g1tMoQzkfPHZNJrjsfuCjdwGcbqgbEdRlvRPtK?=
 =?us-ascii?Q?DPJQxOWribu34TXiEkd4SUYJWd6JhZtIysPy0gG/S7IamhvUjjxZjzzOJeVN?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bb3e4a-56b2-4b3f-faa1-08dc1e88a34e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 16:05:38.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gm8/GYIsIDI7JYp+ErwjjmvzdtZz24cD4Y2gZWd0/cmoHZl6EQZJZcwP9D3AGbzqftgAiyAR9yooigr7llzc4G11ztu1gWIHZGu52koHkPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 09:09:43PM +0530, Badal Nilawar wrote:
>Fix warnings in xe hwmon documentation

Please spell out the warning you are fixing. And:

	Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
	Closes: https://lore.kernel.org/all/20240125113345.291118ff@canb.auug.org.au/

and Cc who was Cc'ed in that thread. From that thread, you need a
Fixes trailer with at least one of the commits there, but I think adding
all should be acceptable, too.

i915 should also be changed from a doc pov since that path is also
reachable for xe. I think this should be done in the same patch, but
need confirmation from i915 since they'd need to ack it.

Lucas De Marchi

>
>Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>---
> .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 28 +++++++++----------
> 1 file changed, 14 insertions(+), 14 deletions(-)
>
>diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>index 8c321bc9dc04..48544bd970ab 100644
>--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>@@ -1,6 +1,6 @@
>-What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
>+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_max
> Date:		September 2023
>-KernelVersion:	6.5
>+KernelVersion:	6.8
> Contact:	intel-xe@lists.freedesktop.org
> Description:	RW. Card reactive sustained  (PL1) power limit in microwatts.
>
>@@ -12,17 +12,17 @@ Description:	RW. Card reactive sustained  (PL1) power limit in microwatts.
>
> 		Only supported for particular Intel xe graphics platforms.
>
>-What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
>+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_rated_max
> Date:		September 2023
>-KernelVersion:	6.5
>+KernelVersion:	6.8
> Contact:	intel-xe@lists.freedesktop.org
> Description:	RO. Card default power limit (default TDP setting).
>
> 		Only supported for particular Intel xe graphics platforms.
>
>-What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
>+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_crit
> Date:		September 2023
>-KernelVersion:	6.5
>+KernelVersion:	6.8
> Contact:	intel-xe@lists.freedesktop.org
> Description:	RW. Card reactive critical (I1) power limit in microwatts.
>
>@@ -33,9 +33,9 @@ Description:	RW. Card reactive critical (I1) power limit in microwatts.
>
> 		Only supported for particular Intel xe graphics platforms.
>
>-What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
>+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr1_crit
> Date:		September 2023
>-KernelVersion:	6.5
>+KernelVersion:	6.8
> Contact:	intel-xe@lists.freedesktop.org
> Description:	RW. Card reactive critical (I1) power limit in milliamperes.
>
>@@ -44,25 +44,25 @@ Description:	RW. Card reactive critical (I1) power limit in milliamperes.
> 		the operating frequency if the power averaged over a window
> 		exceeds this limit.
>
>-What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
>+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/in0_input
> Date:		September 2023
>-KernelVersion:	6.5
>+KernelVersion:	6.8
> Contact:	intel-xe@lists.freedesktop.org
> Description:	RO. Current Voltage in millivolt.
>
> 		Only supported for particular Intel xe graphics platforms.
>
>-What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
>+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/energy1_input
> Date:		September 2023
>-KernelVersion:	6.5
>+KernelVersion:	6.8
> Contact:	intel-xe@lists.freedesktop.org
> Description:	RO. Energy input of device in microjoules.
>
> 		Only supported for particular Intel xe graphics platforms.
>
>-What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
>+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_max_interval
> Date:		October 2023
>-KernelVersion:	6.6
>+KernelVersion:	6.8
> Contact:	intel-xe@lists.freedesktop.org
> Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> 		milliseconds over which sustained power is averaged.
>-- 
>2.25.1
>
