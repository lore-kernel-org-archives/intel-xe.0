Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A52DC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 21:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E7110E25C;
	Thu,  3 Apr 2025 21:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhKqpcuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC45910E25C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 21:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743716712; x=1775252712;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q8HieXAEggwS//4F7zR6VB94hYvivE8MPjfSuv32dgU=;
 b=lhKqpcuCF3sGZGpDXZ6+VA16UtNDKBBayX6PwLod+2CZslbk5KBuFb4t
 LXsKiNR0ekiQBMifegUuHVpdETPnzXEpvYoullyh3+9nvJwABzxIaT3Y4
 Q6IjAST16EQXbuaYwXygAxWnRCrjD7Q1v8/K4ga/IPbX9l9Xt2vXftNv8
 V45TzO8WLDs83AxhCkrLxKWK14VLyegeWLY08b5QnXkaHDDz+RnO8L1F0
 +/1XS0Sz8gqWPLx57ODinNtvv452I0hkultV2GJcSCXRGa1XyynNoaitP
 RSwWKJXpiJX8APR2UzbvRhV7+7YwcBtYOdQAxxJ0hrH/Bo15zqaDBC0xV Q==;
X-CSE-ConnectionGUID: YU98qr/OTziDpQxD/m1FMA==
X-CSE-MsgGUID: wIcI060MT/KrwL9Uz1y3jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="47866793"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="47866793"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:45:07 -0700
X-CSE-ConnectionGUID: h0PrIkOPT4yzwPfl5LKa0w==
X-CSE-MsgGUID: fchTxE34THGiDffh5qFgaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="127651810"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:45:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 14:45:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 14:45:06 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:45:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxmH/kqY/bz45DQLXbsLleLbQUaDcO+v55vxoMVzSscFkuQBS/4ypHCjxh4SDZFdGJRZMAXfN/J4BIuV95pc4zsapcYB9l3Z0a17tYqFg4P5pp0Kf+0CXudgZdd7igkUsm9nJA0SI+2C6gpI9K87yXwvQI/8EtxxmHHjY9OHeUJ62FSxoHMG3VtbwTv3yUe9tZzgwasYYyRVrGxMjNKEUbn3C1uv35gIuPyAkTYChjOGJDgOGKveEVKTcLZgU61DliHB2kN1IbjddpyvqAUKo9hDghl4Wcp078CWgjHJF7GQFsdn/77rOr1n47F3CEfe4r196crK/mrw8oafaYvxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIsZR9e5KCqsUAvirgWczJ6vaWbLeaOqxw92cFtyQl8=;
 b=BaqeKxFP+TpQw/nx6d656mhdF5ASIOPwWKmGgryKxMN5x8Dfd/BI6siFMB9xka8VC/86iCHnBqURf+cgfwvc9QI1D0I3k9srRO+Xv8WKcXv+MEYrryGvJIQw0nxjUYkEdBj19/dsvD7a6Em/yLDh16Wqvb28lAtooUrOE0yDyp7qEfAUinEyeHXZ/7sOi6f/XnkzZwxrViiE5G2eg5LVQ+3fHKWkoNGVyJh1309seOiWR12lcsUIaoZ5rmnitlYoNebwGVwyo5Apn1zU0bEgN462dXh1OiEdSomxRrRbjsaierIvEf+r71kmxKU4xpTR0WWlCs+CIfU7hGzMbjNgzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7200.namprd11.prod.outlook.com (2603:10b6:208:42f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:45:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 21:45:03 +0000
Date: Thu, 3 Apr 2025 16:44:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Add configfs to enable survivability mode
Message-ID: <lijzkqogv45absxvhoba4r2jgq3l2wszefld5bkr5gmntddh3e@6jtw2c7vmzo3>
References: <20250403102555.1265786-1-riana.tauro@intel.com>
 <20250403102555.1265786-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403102555.1265786-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:303:b6::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: efebfd3e-b80d-46e6-fa04-08dd72f8caa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?q5k8YzB4JiJjv+FSrr0u/88vCoM9NgShmKAoWDkTM7uOXjy/QxYBwuWA/U?=
 =?iso-8859-1?Q?8tDQl3cWlRHoznsMfvuq2siecfKlqQWO6uOKHwbu7yKAmgKqB/zgyDN1rt?=
 =?iso-8859-1?Q?vnghN9Lpcmh0Ywzh2zO7fNCbUQv7nC7r0Y0/qRbGPuYzcaLaWaUFLvtqlN?=
 =?iso-8859-1?Q?AjtT+JN54p4j9j0slFg/iD5WuikEm5eBy2XHJposY/E8+PvZSeTZ6qVrxi?=
 =?iso-8859-1?Q?GvTFTYVqkSDor9QAWQusCM53lpgxUU7Xo/GPXz/PUUmHD3FCeFm4iSv9Sd?=
 =?iso-8859-1?Q?DRP7oH6PelTbzbE1gRo/44ezs8KyTU/ian3TXqSf9WVtXs70KdT47NVHPz?=
 =?iso-8859-1?Q?RH3oQMu36HXIcqYXNlAmMkz3FavGwsrFm0LsWP4jEGfvNV12h15c0dwTkG?=
 =?iso-8859-1?Q?hkk/E0f3WfhBBFP5mrxcQLbuDGvwbErkaUdvSPgKEOWaSWT5jrE4652tjs?=
 =?iso-8859-1?Q?+0Angs+chsTwoWn9jXwb2Fn01Qpr3XZHD4Rfem5DuMWFgPJ+aqeee7etMl?=
 =?iso-8859-1?Q?ZWEdWhKerA6BoMDM5XU5jLdYdu0mp3WHxzm6hs2fLMwMrRFdCZDwwUcUuW?=
 =?iso-8859-1?Q?RZS1koQtMMaYYyX8ysVIaHox9htnu7rWptr+TkB/kHjXk7W+JVR1D9He22?=
 =?iso-8859-1?Q?q3BLcdxQPlaDAIrWw9LZRyL4pdjW9vcONZjrB9cm2dhvV1YZmvh+jNUlY7?=
 =?iso-8859-1?Q?58hQcbJsbhOgsX0/5gRkT7S4npH71s1iACiw5PJ8vH5RESzxz+DiHif+Gc?=
 =?iso-8859-1?Q?Wg5vxbNvImzQyUJjuWkx/ox9JkJMF4qJRlqO4Mgy/XQbo4OvYBXwo2qO2U?=
 =?iso-8859-1?Q?VAVejgrM6hoCvp4W8FFVux4RvE83hIdvv/txh/xkjgpuixedGGo8qC7MA/?=
 =?iso-8859-1?Q?X+B3sUQvu6ezhDXGWhs0UULCEPhbHfXk97Vf61897hYvWoZogJt1uScisI?=
 =?iso-8859-1?Q?sr9SGue6KeEOOt0f3bXk+Dz/qPcgVPNTAn85o0XL5iHfXXPR5lmBYMmiIX?=
 =?iso-8859-1?Q?fz6uckOXZUqUWxmYrIQvX9R0jSBm5IzfGjDuhbdWilvZoAwT599viJJ//K?=
 =?iso-8859-1?Q?7VqXc2Yvne3sAlqqRMHVazdA4QPH+g2wPdGlkc9G+b/FtQshYJJJZJhD5k?=
 =?iso-8859-1?Q?JhX5gHvbkWeVAT1O30yda5wD3jrhcnU88spyvkoUMoSOMLQZBSrnzUlqrM?=
 =?iso-8859-1?Q?U0kN1pKSo5+QEkW4oNUQFDkSIfFH7aeYdRsI0c8VCK+K3iEO5TXVqrn95Y?=
 =?iso-8859-1?Q?uzDQCgdLC5YQv3OXuRXTm2EjvGyhMkP//sZbsP69CXuJJWPFASH/wVNfVM?=
 =?iso-8859-1?Q?YFs88NPB17+CyRVtU7nHNRjalqV2PH7XV4ipU/aW0S7QtL9OzrOVidj5Qh?=
 =?iso-8859-1?Q?XvndawrFT1UFrz3j6ez0lKNVB+yHCc9MpyNkP5DqqaVcKhtoN+Snvtvkv+?=
 =?iso-8859-1?Q?t76b0tEbevLroRnz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fWgtwq6HqZu13r9TK5lJEReLpCt4pvBGjvZjs//f3W0D4ja6rCYaZ9RTxN?=
 =?iso-8859-1?Q?TFMsJhTkz6QWHCO1T96BMFWvQVLfltm9vg5y/umnP0N4LvM5NLiwSr5+bO?=
 =?iso-8859-1?Q?pCaDrd+uuflS12vfq32Go+y+oNrSaqMTUQJHprkAKj9Vp513F0hv2kP7HA?=
 =?iso-8859-1?Q?3AJH1lyVlGVl7tFVSVbvrrXIkOD/r9vBoa6PxaGguEHaNS0WEUFKjivRAp?=
 =?iso-8859-1?Q?vaelYc7u+ZTChMEGsSgbO6opanvD9AqdHdp3V3e4kpmqtGxeEJ6LUATd2t?=
 =?iso-8859-1?Q?JmMI7fWrwJqJCwZSEj4kxh4gA455qciYlTNFpXAWcYAzIMluv+dO11BHZ5?=
 =?iso-8859-1?Q?plno2ypkq7aKb1wgC1q5RdqlRx8rolqbh6P9fc9gTvWO7uxnMnmWmjOJPz?=
 =?iso-8859-1?Q?UizvcXghlU5UOhBcJZn5kcyhMNVdA0h7DHOLxENTLnnXMXsf0gKSF6DDpI?=
 =?iso-8859-1?Q?KPv2UoMD3FTwIt3aDWxJX5CQ4YOkCHhm/7Hz/6FwhMQK848vEoIHhpi3Zj?=
 =?iso-8859-1?Q?OjIyiwKbBLHH5D4Xgo5rwrq/+TUyDX9eeuf9BuSaBkVirsi89pxWVN/hhv?=
 =?iso-8859-1?Q?3+bva9fi7m2UxVIVcUuzIUK+xMCBR21Jk1C8d/ho5t8EBKPAJMhTLTFRHj?=
 =?iso-8859-1?Q?UxO9T/ssJnyaVkzRKP2bnZym/lDZZ56LWQYmGj12houKFFINVidEoRmhrO?=
 =?iso-8859-1?Q?Ebvx4IcM1kLaq2phmDaHs9LRJ2UP+w96AVUwyHi0roxeuKAkXi2L2APt8M?=
 =?iso-8859-1?Q?TDje/fdUL0eSolXD/nE0kNijDGK3DsQH9tPym1lkWRGIBgO3JpM+FYKlqM?=
 =?iso-8859-1?Q?9bCYCtkOZWzUX7wAbz3SoZ/fDoV51OS2HVWf1OEFXYOBwyizcMMT1FL82h?=
 =?iso-8859-1?Q?5/+6BtgxWDtz2lGKVoca3WrwMIQuv4ijid3YknzdCF/j7Wbu3Fr577moq8?=
 =?iso-8859-1?Q?N50OmzON+jP3x8l+lh3FV7Wynmzzv9b1hZeK3IO65tiYt40746NwKWKR66?=
 =?iso-8859-1?Q?K5NJfa+Hg+zdYWdsc8hrTbIA5+MU7kiWKSNCNKObNY5NYh/fxUc/Wq6Elj?=
 =?iso-8859-1?Q?KcDWEgxnL2e3m8vVY5HgTNH4TlArdwe3vfxCxBLxbumwby5UtDzfWluHQ9?=
 =?iso-8859-1?Q?EzWzs3JpfkATfAC57NIgqBC63+YoKkUd1A1mFqCSgjWvgSRBisZKeU1Th4?=
 =?iso-8859-1?Q?d79GU/VV2RmQYZU7CGx6oiR+zaZrcO2KPoogQeIchhckGH8zupLghEaXLY?=
 =?iso-8859-1?Q?ZmUMNpExcm/Mue6qp+nR0qqpiEmmMehLFaFP4DJEhXR7uFd0pg1P2TPS6b?=
 =?iso-8859-1?Q?13M7qD4gXRcXWdSkwNiAecRMURFSZl0T6C9pDouSWf0skjPTMO2owJLhVi?=
 =?iso-8859-1?Q?pvTLOrPwzAnkLCH85oS1b+NaC2AeLiRyHV+sORb+IKcJ92Trjcyjjlvb2S?=
 =?iso-8859-1?Q?UQbDLBSoZ8Il7fFyCqn0S52drLENfgg+80dCKckoXMop50k4N6lL31ukC3?=
 =?iso-8859-1?Q?M8TcasDrjNrRmy0RymqoNbxuaXca0MiIcfUv9J49+1DhInEyuJkh21j/mX?=
 =?iso-8859-1?Q?Be00WoUc2V16nRiDSgeAPmaCnQeP4jDtC7pxWAMDaFSadiYSwnTjqbOqQw?=
 =?iso-8859-1?Q?v0TfXWdAoaLijf+/On/g+1RTquZwKlPpZf42c4KSKxhu9sJ8rzo+T1gA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efebfd3e-b80d-46e6-fa04-08dd72f8caa5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:45:03.6082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQBY9bImJA6UTlZjbD0K9PVelRpS8wNBSSp1hSWKwaVglrRoNTbIs9/fr892JQ6uW+j1+2R/AemdNxcszvUb3xlRQ//VlJ7fK/NmdAU4PPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7200
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

On Thu, Apr 03, 2025 at 03:55:51PM +0530, Riana Tauro wrote:
>Registers a configfs subsystem called 'xe' that creates a
>directory in the mounted configfs directory (/sys/kernel/config)
>Userspace can then create the device that has to be configured
>under the xe directory
>
>	mkdir /sys/kernel/config/xe/0000:03:00.0
>
>The device created will have the following attributes to be
>configured
>
>	/sys/kernel/config/xe/
>		.. 0000:03:00.0/
>			... survivability_mode
>
>v2: fix kernel-doc
>    fix return value (Lucas)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> Documentation/gpu/xe/index.rst       |   1 +
> Documentation/gpu/xe/xe_configfs.rst |  10 ++
> drivers/gpu/drm/xe/Makefile          |   1 +
> drivers/gpu/drm/xe/xe_configfs.c     | 190 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h     |  16 +++
> drivers/gpu/drm/xe/xe_module.c       |   5 +
> 6 files changed, 223 insertions(+)
> create mode 100644 Documentation/gpu/xe/xe_configfs.rst
> create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
> create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>
>diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>index 92cfb25e64d3..b2369561f24e 100644
>--- a/Documentation/gpu/xe/index.rst
>+++ b/Documentation/gpu/xe/index.rst
>@@ -25,3 +25,4 @@ DG2, etc is provided to prototype the driver.
>    xe_debugging
>    xe_devcoredump
>    xe-drm-usage-stats.rst
>+   xe_configfs
>diff --git a/Documentation/gpu/xe/xe_configfs.rst b/Documentation/gpu/xe/xe_configfs.rst
>new file mode 100644
>index 000000000000..9b9d941eb20e
>--- /dev/null
>+++ b/Documentation/gpu/xe/xe_configfs.rst
>@@ -0,0 +1,10 @@
>+.. SPDX-License-Identifier: GPL-2.0+
>+
>+.. _xe_configfs:
>+
>+============
>+Xe Configfs
>+============
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_configfs.c
>+   :doc: Xe Configfs
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 72eaadc4cbee..c5d6681645ed 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -131,6 +131,7 @@ xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
> xe-$(CONFIG_HWMON) += xe_hwmon.o
>
> xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>+xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
>
> # graphics virtualization (SR-IOV) support
> xe-y += \
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>new file mode 100644
>index 000000000000..548468d2bda0
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -0,0 +1,190 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include <linux/configfs.h>
>+#include <linux/init.h>
>+#include <linux/module.h>
>+#include <linux/pci.h>
>+
>+#include "xe_configfs.h"
>+#include "xe_module.h"
>+
>+/**
>+ * DOC: Xe Configfs
>+ *
>+ * Overview
>+ * =========
>+ *
>+ * Configfs is a filesystem-based manager of kernel objects. XE KMD registers a
>+ * configfs subsystem called ``'xe'`` that creates a directory in the mounted configfs directory
>+ * The user can create devices under this directory and configure them as necessary
>+ * See Documentation/filesystems/configfs.rst for more information about how configfs works.
>+ *
>+ * Create devices
>+ * ===============
>+ *
>+ * In order to create a device, the user has to create a directory inside ``'xe'``
>+ * ::
>+ *
>+ *	mkdir /sys/kernel/config/xe/0000:03:00.0/
>+ *
>+ * Every device created will have the following entries that can be used to configure it

Every device created is populated by the driver with entries that can be
used to configure it.

>+ * ::
>+ *
>+ *	/sys/kernel/config/xe/
>+ *		.. 0000:03:00.0/
>+ *			... survivability_mode
>+ *
>+ * Configure Attributes
>+ * ====================
>+ *
>+ * Survivability mode:
>+ * -------------------
>+ *
>+ * To enable survivability mode using configfs on supported cards, follow the
>+ * below steps ::

		^ extra space?

Suggested reword:


Enable survivability mode on supported cards. This setting only takes
effect when probing the device. Example to enable it::

>+ *
>+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>+ *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>+ *
>+ * Remove devices
>+ * ==============
>+ *
>+ * The created device directories can be removed using ``rmdir``
>+ * ::

it seems all your "::" have a space before it, making it read odd.

Other than that, 
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+ *
>+ *	rmdir /sys/kernel/config/xe/0000:03:00.0/
>+ */
>+
>+struct xe_config_device {
>+	struct config_group group;
>+
>+	bool survivability_mode;
>+
>+	/* protects attributes */
>+	struct mutex lock;
>+};
>+
>+static struct xe_config_device *to_xe_config_device(struct config_item *item)
>+{
>+	return container_of(to_config_group(item), struct xe_config_device, group);
>+}
>+
>+static ssize_t survivability_mode_show(struct config_item *item, char *page)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+
>+	return sprintf(page, "%d\n", dev->survivability_mode);
>+}
>+
>+static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+	bool survivability_mode;
>+	int ret;
>+
>+	ret = kstrtobool(page, &survivability_mode);
>+	if (ret)
>+		return ret;
>+
>+	mutex_lock(&dev->lock);
>+	dev->survivability_mode = survivability_mode;
>+	mutex_unlock(&dev->lock);
>+
>+	return len;
>+}
>+
>+CONFIGFS_ATTR(, survivability_mode);
>+
>+static struct configfs_attribute *xe_config_device_attrs[] = {
>+	&attr_survivability_mode,
>+	NULL,
>+};
>+
>+static void xe_config_device_release(struct config_item *item)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+
>+	mutex_destroy(&dev->lock);
>+	kfree(dev);
>+}
>+
>+static struct configfs_item_operations xe_config_device_ops = {
>+	.release	= xe_config_device_release,
>+};
>+
>+static const struct config_item_type xe_config_device_type = {
>+	.ct_item_ops	= &xe_config_device_ops,
>+	.ct_attrs	= xe_config_device_attrs,
>+	.ct_owner	= THIS_MODULE,
>+};
>+
>+static struct config_group *xe_config_make_device_group(struct config_group *group,
>+							const char *name)
>+{
>+	unsigned int domain, bus, slot, function;
>+	struct xe_config_device *dev;
>+	struct pci_dev *pdev;
>+	int ret;
>+
>+	ret = sscanf(name, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
>+	if (ret != 4)
>+		return ERR_PTR(-EINVAL);
>+
>+	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>+	if (!pdev)
>+		return ERR_PTR(-EINVAL);
>+
>+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>+	if (!dev)
>+		return ERR_PTR(-ENOMEM);
>+
>+	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>+
>+	mutex_init(&dev->lock);
>+
>+	return &dev->group;
>+}
>+
>+static struct configfs_group_operations xe_config_device_group_ops = {
>+	.make_group	= xe_config_make_device_group,
>+};
>+
>+static const struct config_item_type xe_configfs_type = {
>+	.ct_group_ops	= &xe_config_device_group_ops,
>+	.ct_owner	= THIS_MODULE,
>+};
>+
>+static struct configfs_subsystem xe_configfs = {
>+	.su_group = {
>+		.cg_item = {
>+			.ci_namebuf = "xe",
>+			.ci_type = &xe_configfs_type,
>+		},
>+	},
>+};
>+
>+int __init xe_configfs_init(void)
>+{
>+	struct config_group *root = &xe_configfs.su_group;
>+	int ret;
>+
>+	config_group_init(root);
>+	mutex_init(&xe_configfs.su_mutex);
>+	ret = configfs_register_subsystem(&xe_configfs);
>+	if (ret) {
>+		pr_err("Error %d while registering %s subsystem\n",
>+		       ret, root->cg_item.ci_namebuf);
>+		return ret;
>+	}
>+
>+	return 0;
>+}
>+
>+void __exit xe_configfs_exit(void)
>+{
>+	configfs_unregister_subsystem(&xe_configfs);
>+}
>+
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>new file mode 100644
>index 000000000000..5532320818e4
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -0,0 +1,16 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+#ifndef _XE_CONFIGFS_H_
>+#define _XE_CONFIGFS_H_
>+
>+#if IS_ENABLED(CONFIG_CONFIGFS_FS)
>+int xe_configfs_init(void);
>+void xe_configfs_exit(void);
>+#else
>+static inline int xe_configfs_init(void) { return 0; };
>+static inline void xe_configfs_exit(void) {};
>+#endif
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 475acdba2b55..15b3cf22193c 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -11,6 +11,7 @@
> #include <drm/drm_module.h>
>
> #include "xe_drv.h"
>+#include "xe_configfs.h"
> #include "xe_hw_fence.h"
> #include "xe_pci.h"
> #include "xe_pm.h"
>@@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
> 	{
> 		.init = xe_check_nomodeset,
> 	},
>+	{
>+		.init = xe_configfs_init,
>+		.exit = xe_configfs_exit,
>+	},
> 	{
> 		.init = xe_hw_fence_module_init,
> 		.exit = xe_hw_fence_module_exit,
>-- 
>2.47.1
>
