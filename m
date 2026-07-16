Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04885C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 10:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B731510F285;
	Thu, 16 Jul 2026 10:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mp2/7aHD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD4A10E34B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784197880; x=1815733880;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o53lPzF+hR+RfFZWsmy5KDVS01cWAwM9qYi2C19zKp0=;
 b=mp2/7aHD0aRddVQ2vGeCnvnq2uMx1O8P2PLMRkRZfR+/oEn8A0DPkXA+
 wLu5d1LsR4+CNWN8tG2c9AtXj9cAK1FwRied7P8Ug5dUpL9JLMW3tFi4E
 ccyNpO+VpylbhYsmCc3WmxKvchH0C8c3vtwiRXI2Y9nVzsMp+YGgx1f8c
 AdDPzu5Pu48CY3sgw7FjNDhgdVuxfUlxSNQiyqHwmsA6/lTUzGeVGDBXS
 CbhFmDHl+Z5jJ587jES122N2wOzfsnllvsyYJ+MW2+DMl5Pxr77UQk0mU
 ItvsV27VG4wcUrV7ZXyXj4Jdh9XgANbvtBsIc7BvU/ZyVhQGmPUEQx4ON g==;
X-CSE-ConnectionGUID: een+U6taQqy9YqU7tkzWmQ==
X-CSE-MsgGUID: e71Ns5FpQ6SCXS6cds/Wxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="85052962"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="85052962"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:31:19 -0700
X-CSE-ConnectionGUID: u9ajV+66SYGIkgm7qT4X3g==
X-CSE-MsgGUID: Zp9EAvYlQqKKNlBPSzi4WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="258434115"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:31:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 03:31:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 03:31:18 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 03:31:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1VP3d5cz1GpTpiJyY6yNu7IeRVpYEFJ8cFCwrv2D38SYmWowMbqVkmRW/degRHjtR3DOb3xf/sNBiJ4oRMOkTeAKgnoi6/QSQF5KSUAhcVNenykpEcl3yQvlfhKL5qN1QMteI2DSouxES1dwlWtgmrqvvbgANM75D4l//zyX39bmaAKPAyTOR+kIZhIYapILJqjKCd3Snw9Nn/dA2IRHeMtdD+SmnPX5lR55P5p1XWwd4kmASOj0jnvrVFrBib2noK9bJWJst6G7lbCaT09iUwC6cKUTZ/290HpGw2K54cMfJM9M0MdQydX0b17XoMa/BjHHZ8kWhlsKX/G2GPMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjK1DraoQnIRW+eJZaifksY4Cv/kD4/zFGCBSKKCRTM=;
 b=srN6/KRGvmrs7JPZi7072T1a1nnYycs7KJanjLikHqpHifFCCV1COMxrZQ7Ij0hCiBkGGIwS8cO1crfxJpupGmMEbtgZZaAVrgFXiXjO0/4W0PWFR7ZCsnSUgTOXGmea2NcJOnkFFmqLRtr9EME7r6BcKXKvA57B5oZcfqJEsQVT9fGg0oIKlOz615Oeqe2b2D6AIO4AbCAjXVMAriiYs6pcyWvhD/n/6c6DXKAqYiEy+qa19hDSXgWfanSn6rwAvw8nCQ6ri1WRjxdKi7I7fzEKUlowZ13m88+GGucIRdL9NRQzcJO5k8I4YEkgq4K13hDVvhl5fLhsrswT2LwY4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CY5PR11MB6089.namprd11.prod.outlook.com
 (2603:10b6:930:2f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 10:31:15 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0181.017; Thu, 16 Jul 2026
 10:31:15 +0000
Message-ID: <b1639805-817b-4e4f-a502-a9cbeb9c476a@intel.com>
Date: Thu, 16 Jul 2026 16:01:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] drm/xe: add page size allocation control state to
 xe_device
To: <intel-xe@lists.freedesktop.org>
CC: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
References: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
 <20260714105538.170849-10-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260714105538.170849-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0101.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: a6604c57-d332-4fbd-01fb-08dee3255d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|3023799007|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: QfR/UoXIvWgZsSLneubiQpKyHQ7jhNcNK8ltqGvTZJlMZiIGnqADFsa4TX5+dG7F8+8L5yW7dh14cfTuxYuQBbTulv9z8Wr8ULDv/a/1g9aZcoSzn0t8A+qIvpleEDm1i7bQvGWLkGBKNwn+GSeFI8FlCIdEe+sfNJ9pGvGw2QAy84aqqeh6Am3lH0qh+qIBcUi8nt4iKjEIBotBgoFAPp/N2Nfp0CZk7gfaE5zCAikY2i+k/swkl+SQ/uabHrCKTJLBpQlflnyQgtPpdqXoDO888Mna9/q7eREevf/wiZD6B/FA9lXkfxNc8iCdZuvtS94vWuGkzf+gfZWu/8zfhxkdrYlJIfsOd7XUvAfX6V+AQn/XBmwNgzFFFRRY2X0c0CpHEj1CYcNro9MUHLSYLMXBl8E5AdT1bw1UqhuUkfMOQg6UVOW+P3RK4ml3y3V1VoPtl8sW+i+/lgty59NBSQc1wAhwUfYUljNkpkznfHJ2/O9QqNgIHxe0QeeEZSutqlpK28R/sPCMGlc3RXpZ0VW0AUAfUnd3xkE3rGciz2y4bc5Kd+ilS9HbkUypJr6vg81NuCa8E4dr1dqVUyZ21gPNsNaasZMoPLcNpKCDWTqPa3U/deNYsTAsZ1vLHBO+d+B73uKxVRoFPj1QVOChQBi5TZBK9LO/LMPG8BVrL4E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(3023799007)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFVmM2NOUEM1cHd5cG1UNEMxRUF5cjFaVW1sMWxNcDNzUUVjZmhoalhWakFB?=
 =?utf-8?B?ZWlWR3EzNHBpbUd1ai9Ba3crZnVwazJaSEE2d1FCOEU0bU5FQTBNcWpEekJO?=
 =?utf-8?B?V3FabUtQOXh1ZVcwNjlUVHVudm9LUlB3U0dEcyszMnpralpLNkRpTEFwV280?=
 =?utf-8?B?aVVBbzhranpFeGVtdGtJQW9JQ01kSUJ1UkkxL3ROZHpHV3dlWVNmVjJEdUVv?=
 =?utf-8?B?VHpqU3FQRHdsUTFUNWtwNVNxcE01bGlCWk9QcmVwcHJFalhwWFBiL0V2NmpG?=
 =?utf-8?B?SUcxQ2Nla08wYVNuOUx5aFA4NklkK1Z4Qm9kb0VxdlRiY3ZtbTBuTjMzNWxH?=
 =?utf-8?B?ajU4K25iWTVqekxQcGxlc0pvdG5RbW5mR1hPWExQYU9FckdpT2pCMm95Qm85?=
 =?utf-8?B?bE5iTnlZUkxaNnEyVmxFWDFEV0tsRUhWb09salhzTXQwTE5leVNiRjNONXdE?=
 =?utf-8?B?cFFpejZESmdVdkNucW8xSWJZeXJjdmhTZFhRdis1Z3hpaGJhdEd5NHhMaHBR?=
 =?utf-8?B?VUluVGkydnkrdzluL09xWm4xU2M3Tjh4dlF1Q09KQWZRZUZDRCtOSTB0OHcy?=
 =?utf-8?B?TXZOMnRTZWFjc0JSeUpkaklFSzNkWGtkbXNlWEdHOUxhdGRZTUFOaHc3NHFQ?=
 =?utf-8?B?MXg0NWhLODNMWGwwREdZZFA0NE1wZWpyZmk5Ty9OR2IxNjRDTDJ0MCtxNUhh?=
 =?utf-8?B?R2wwaWpWUXZnQmVCbFlrUU5FVzdtSjVHNkh5TjBleEFzdHZSMnoxVkR6blBZ?=
 =?utf-8?B?RmlMcGVGOTJyT3llRmphU1hXcXFJS29OUmZOWU1raHJnRlF0TTJtclBnQ2k1?=
 =?utf-8?B?R3QvVlBpcUFaTVNuaWRRdjdQcjJaOUs2bzMxUytKWmxLZmRPVFZFTm5XbGta?=
 =?utf-8?B?K1VOWGpEK2dXdW9MTUtRQjVaeW9tR2YxNzZWTXMzOC8rTk1NbFhlNHoxR1dU?=
 =?utf-8?B?SnExdDZkS3JRYU80aVE5UDVkWW5tZUxBS25jYzNhVWduNGp6dzE3R2JyVGxO?=
 =?utf-8?B?NTUwTVVmcUVLNEtkb1NjMy9OUkpucDMzZTdSZHNocFRMZit5anNxVW95OG9G?=
 =?utf-8?B?VC9PY2lLTVA1azJuQVg1dCtqaWR5RE5oWXNYb2p5Ny9QUDIvemtaUXUydWR5?=
 =?utf-8?B?Tmh2Rmc0TTVGV2xrTWhOczRJUi9hQ3VmMVFsaGNWbzZCeUJJWm5VdnljNGtn?=
 =?utf-8?B?ckEvZHRSaC9nM01GaDdXR2lpc05sb2VvbXRwWVdZQ1R4dHI3YU9GNmNFcnJt?=
 =?utf-8?B?eXZ4Z3B4K1lheTVsQmRodGNZUUFENXNLTUVBV1liUXFiUC84dnVlOU9UQ0hG?=
 =?utf-8?B?eFJ4UmNXcHRaOGEyMDhFUGtmekhHSC9NOU1WUjVqNU02Y0RYa1Y5TUh3NWl6?=
 =?utf-8?B?R2dDME9QUEhVaEROQlZzNVZGWXdPZHozWG5sRW96VEVQZHY4UENXTlBRTnpk?=
 =?utf-8?B?YVZhT1dLZk5xNXdvQ242ak9yMlBEZkhCK3lYaTRuY1BUMy9TUVB5RFVIUC9R?=
 =?utf-8?B?ZXRuaEpRdy8rdDVMMlNpS3B2NEFqU2o3SW9vWnhnV1k4c2cvR1NwL0hOMmk1?=
 =?utf-8?B?YTJBKytmaHVwYm9vYkN4MXUxWkZ6ZkhTUDlFbUNIV1RnOUxpNE5rNmplSmlS?=
 =?utf-8?B?d3VkU21kdzRUa1VveDNIMXlHNlVMRkg4VFR0OG9LY3BrOXhkREZKRUtIVlZ2?=
 =?utf-8?B?bllnREkzSStVU3QyM3NzbWg4SU04TnUxcFhCZ0pIcUVaQ1lJYVhqZUhobVov?=
 =?utf-8?B?R2gwejZHbmxWbFd3bUdWRWRlWEFmcDNyby9KUDVqSmlveDNpdVk0a29XajNS?=
 =?utf-8?B?d25RVWFPSHZMRlhlVXdMRW1xTkZMZ0NjU1h2NTV2VlNYeWpTTmJ6SS8zWWx0?=
 =?utf-8?B?MWtCUDBvLzZJV1ZYeFA5ajlFZDVaVWsrYy96LzdzVUh6Zm9DWGJjZ1E1c2ZP?=
 =?utf-8?B?YmJJMndkNm8wTnlkUzZNSklJbVZRYkl5ekZjNmhaaGsvd1JqcDErQTl6ajVT?=
 =?utf-8?B?N2hhOTQrV0dkb2UzMUFqYmdyaHViVStvMmNLQUhQVnAxa2JXWUFYbllwY1Br?=
 =?utf-8?B?S2VUc3ZVbWpRR1NxbExrUFRrVzYrUEZEcXFCQmJ1WXBqVzRoRkZGcjJVdHpD?=
 =?utf-8?B?dGNuWmhCVC80K1pxeG00L0hza3dLb0M2Vm95b2dBb3pSNDA5NmRabWkzZWly?=
 =?utf-8?B?L3N3eElBeTkzMXNlTm5SYjlORVlPQ0dnSGVpdkgxaHF2OXA5VHE1ZjNtL1Vr?=
 =?utf-8?B?ak5aZlliajVWa1lXcUlEbXMwVHJrY1lPSWhNMCthd0JaV0ZDYldhZkxkQ0hp?=
 =?utf-8?B?azJVU1VKVnU1OEQxQm9IaUhkWHVHdys4em4rQjRHNXRUbXhnbTFYdnpwK09z?=
 =?utf-8?Q?Woqvxd0z2xocdpEU=3D?=
X-Exchange-RoutingPolicyChecked: FpKiSLhRwNugpQkG5eyA+hqIudneHkwtu9NTgEffew9+12OuDZ01qpkJbVVU2T7Gsn4uPvwHIb5F0VJnIhalu4jlWa+l3KVhvJ0X4V0NlAWxKYZqTmJt8V+y0J0650fvREzJyLbi7Alp7e41vX6yoqbVzZuRlHHDbeV7MRe+6nFfOf2cmC5Bd4aYO6tatoOu4RPP+eETKjdPWyVIH2+kDY0S6XzGIVmWM0yhJigr1v4ZJnZ3oY7yIU4w6zhsj3/AcVjMmhgt+R9eHnPKpxH5ZUkgMUyYoREadVEbxLbW1Qrjt7pzVfm9dd8AHTxiP1kcuDA3qkI5LRYUuJNVHQhwYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6604c57-d332-4fbd-01fb-08dee3255d5b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 10:31:15.6784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnHnD2rhIRjCfSLdeTc5ojTbk4xdo/Izfus9h0wrvAOHDk7MQ1lx+XhHTfrKi/33vvAERJV1B5yER0hv6kUaVN2rJVjPgxrx5LmnpOO5Enc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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



On 14-07-2026 16:25, Himal Prasad Ghimiray wrote:
> From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> 
> Introduce xe_page_size_alloc_ctrl_mode and add page_size_alloc_ctrl
> state to struct xe_device along with mutex lock.
> 
> The new control supports forcing user BO allocations to 2M pages,
> forcing them to 1G pages, or using a mixed round-robin mode across
> 4K, 64K, 2M, and 1G page sizes. Track the current mixed-mode index
> in xe_device so allocation policy can be applied consistently.
> 
> v2
> - make cur_index to atomic as update need in later patch to
>    avoid race/concurency (sashiko)
> v3
> - reworded comments
> - protect mode/index updates with a mutex for proper concurrency handling
> 
> v4(sashiko)
> - move xe_debug_page_size_alloc_ctrl_init() before drm_dev_register(),
>    so mutex and control states are initialized
>    before any userspace visibility
> 
> v5(Himal)
> - Guard all the debug page size policy code under CONFIG
> - Squash Kconfig patch to have Kconfig entry for DEBUG_PAGE_SIZE
> - Add inline to check debug page size support and exact mode
>    configured if it is supported.
> 
> v6 (fix CI build)
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig.debug     | 16 ++++++++++++++
>   drivers/gpu/drm/xe/xe_device.c       | 13 +++++++++++-
>   drivers/gpu/drm/xe/xe_device.h       | 30 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h | 31 ++++++++++++++++++++++++++++
>   4 files changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 01227c77f6d7..79118d9efd93 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -86,6 +86,22 @@ config DRM_XE_KUNIT_TEST
>   
>   	  If in doubt, say "N".
>   
> +config DRM_XE_DEBUG_PAGE_SIZE
> +	bool "Enable debug control for user BO page-size allocation"
> +	depends on DRM_XE_DEBUG && DEBUG_FS
> +	help
> +	  Expose a debugfs knob to override user BO page-size allocation
> +	  handling for validation and debug. Supported modes include forced
> +	  2M, forced 1G, and a mixed mode that exercises 4K, 64K, 2M, and
> +	  1G page-size paths on platforms that support them.
> +
> +	  This is an unstable debugfs interface intended for development and
> +	  validation only. Its layout, contents, and existence may change or
> +	  be removed at any time with no regression warranty.
> +
> +	  Recommended for driver developers only.
> +	  If in doubt, say "N".
> +
>   config DRM_XE_DEBUG_GUC
>           bool "Enable extra GuC related debug options"
>           depends on DRM_XE_DEBUG
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c9fa4bfed2b9..78dab9ae4f1b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -923,6 +923,15 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   		xe_pm_runtime_put(xe);
>   }
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +static void xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
> +{
> +	mutex_init(&xe->page_size_alloc_ctrl.lock);

Leaking mutex. drmm_mutex_init ?

> +	xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE;
> +	xe->page_size_alloc_ctrl.cur_index = 0;
> +}
> +#endif
> +
>   int xe_device_probe(struct xe_device *xe)
>   {
>   	struct xe_tile *tile;
> @@ -1074,7 +1083,9 @@ int xe_device_probe(struct xe_device *xe)
>   	err = xe_psmi_init(xe);
>   	if (err)
>   		return err;
> -
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +	xe_debug_page_size_alloc_ctrl_init(xe);
> +#endif

Nit. How about calling function unconditionally, and is no-op stub when 
Config is not enabled.

>   	err = drm_dev_register(&xe->drm, 0);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index a03760d0ce38..df574738e3f5 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -212,6 +212,36 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>   	return atomic_read(&xe->wedged.flag);
>   }
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +static inline bool xe_debug_page_size_supported(struct xe_device *xe)
> +{
> +	return IS_DGFX(xe);
> +}
> +
> +static inline bool xe_debug_exact_page_size_mode(struct xe_device *xe)
> +{
> +	enum xe_page_size_alloc_ctrl_mode mode;
> +
> +	if (!xe_debug_page_size_supported(xe))
> +		return false;
> +
> +	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
> +
> +	return mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M ||
> +	       mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G;

why mixed is left out ?

> +}
> +#else
> +static inline bool xe_debug_page_size_supported(struct xe_device *xe)
> +{
> +	return false;
> +}
> +
> +static inline bool xe_debug_exact_page_size_mode(struct xe_device *xe)
> +{
> +	return false;
> +}
> +#endif
> +
>   void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>   void xe_device_declare_wedged(struct xe_device *xe);
>   int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 022e08205897..16f0cfe43ab0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -61,6 +61,23 @@ enum xe_wedged_mode {
>   	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
>   };
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +/**
> + * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE: Use the normal allocation policy
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M: Force user BO allocations to 2M pages
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G: Force user BO allocations to 1G pages
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED: Select page sizes in round-robin order
> + *     (4K, 64K, 2M, 1G)
> + */
> +enum xe_page_size_alloc_ctrl_mode {
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE = 0,
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M,
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G,
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED
> +};
> +#endif
> +
>   #define XE_BO_INVALID_OFFSET	LONG_MAX
>   
>   #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> @@ -474,6 +491,20 @@ struct xe_device {
>   	/** @late_bind: xe mei late bind interface */
>   	struct xe_late_bind late_bind;
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +	/**
> +	 * @page_size_alloc_ctrl: User BO page-size allocation
> +	 * debug control state
> +	 */
> +	struct {
> +		/** @page_size_alloc_ctrl.mode: xe page size allocation control mode */
> +		enum xe_page_size_alloc_ctrl_mode mode;
> +		/** @page_size_alloc_ctrl.cur_index: Round-robin index used by mixed mode */
> +		u32 cur_index;
> +		/** @page_size_alloc_ctrl.lock: Protects @mode and @cur_index */
> +		struct mutex lock;
> +	} page_size_alloc_ctrl;
> +#endif
>   	/** @oa: oa observation subsystem */
>   	struct xe_oa oa;
>   

