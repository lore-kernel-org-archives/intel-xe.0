Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4946DC9830E
	for <intel-xe@archiver.kernel.org>; Sun, 27 Sep 2026 23:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C7810E17E;
	Sun, 27 Sep 2026 23:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M52t9EfK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778DC10E17E
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Sep 2026 23:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790552825; x=1822088825;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8hBncWtaScCl+0EhT7s8mgEi7LRWF42MhSP32hkuuZg=;
 b=M52t9EfKBr0310iuPhGw00XCkULZQtPfyo5mvR1/I073nhjc9U1hXMFj
 qe/wx/Y2T7A20AiaBSdcNrQ/kgXtJacr8aZ7nvHFcdOHU8jhNxZZPdqZM
 D2kbo9QXsDJYlggNY4kkOcdmaSphCUR0ePn0aQZPw2e6o1UTvtvGPxntK
 VsgMn58jT69hf6WUpVIvFbTY85+IvLcXRvtB/kKr3FrSQ6Z5pBqCBTw2U
 rn+ZiXNJxneZfl6mu4r18fzdQBOt5sAz8XHA0snpZ21+KTAn3Y8jp4dpp
 TbSjLe+6ZWE3DhsBS7W+60yXZRKZcLNVEtJZWbMjtAiuBuUsari2Y4zt7 w==;
X-CSE-ConnectionGUID: SkRVaJ3qQyyG2DB5JOMZiw==
X-CSE-MsgGUID: 9J/GLNExQmKk4Ia1ifH7TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="93741336"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="93741336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 16:47:05 -0700
X-CSE-ConnectionGUID: VcsKdaLuSwyyZ9c+lH9vKQ==
X-CSE-MsgGUID: hbkPShPfRNGI25KOBfdsng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="275015950"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 16:47:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 16:47:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 16:47:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 16:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wa5+S2S1Q6SitHDTunY3+cGyOsDbzUchnYJZqXqfcbADW+uhQchSZoKnmhIP+nj7+IM86Vi6SfzHH0nxtyHZ+Fqhgywxs5NEnxSDvHIkWw9e2WvCenJzDktpFXe55qR3SQSHxOWLimxRzCHKHeR9OjEiDb8U2Ig6a1tSuIaR44Bn2oNdHypHxBmEstm6iCVSlKmqrRD+hiPdbebtClGTsfz/MmKQ5Aaucv01j+lZkdUwQpdvZ2Ifl84jyvYGZZrdBikDXZGMeYCLgJul/BFNkz8dxtdqS2mu13yQ7DEfekEWMuvDoUc8lVPtV99NUiZ81UR1vbGoB3jlSRJdOMKdcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvZ4xpSfs9SicxBmYGondeYd9MMZndfHMYOXkPrs4qo=;
 b=NbBqDGvEqgXWmdcx7eKMmCsC/dD2Y/Sk2LUo8DnR5c9BYiPbqOYbNvFnmbyFw8kt1AJ8HuoaDNI7smOA1JVRCeWp5aGnhzzzgvUSTsQyIEPE0dMbAXlZIv8k2IFg0QxzT6hptdCN3gGeImmthVGhAU772VSmrXI6K2GNIfujGJCDnwIGxb/i8Fagnr7IQf99Hl5FIVLgZXpZPRqPGAgFM7fRCDeECMbpFk4lRLJ62JGtvpZJTXXdhgn7z+HM1EEisevGiEZEVTEdmbQ/FvZiJf0DLa1GKlkkE7hFjTjTTFxvQHwG2xF65vN4Eig+5+9QfeaEJAAC5UIeOj8omWYp/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sun, 27 Sep
 2026 23:46:54 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 23:46:54 +0000
Date: Sun, 27 Sep 2026 19:46:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michal.wajdeczko@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe/sysctrl: Add sysctrl debugfs
 infrastructure and loopback test interface
Message-ID: <armq2MJRtbCbiutN@intel.com>
References: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
 <20260925135521.1804299-6-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925135521.1804299-6-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: a528f924-0563-461a-4e7f-08df1cf19bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|3023799007|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: sP2jPF81Mbk/tmjgOeobBwn5W/hGqMww1xJcBCBAUXK6hWjuk+vqSO60jSTWqJKvZK5a0mCIOtfP/yXAALsxVEWlikISRefF1AF7ruKRE1OiAdVgszzbuc+N39IhEp/0qTDBu8IC/GsgU+yTz7rzVDFmagIhQkkLBSyyYtQBIb/85S/sqeF24PBOs8CC7vZPvaqApRzhQu/SGrUjxDzTroyDTQLbvF/r9kHgN2aF2ABBFBlG3fkjG5mVjHfYOLgY+2X+CEvbj1seXZvplJBdMqvk+Ve+zg8uOG7PM4nht7RVJGMDGY8JbPDfBzwTjnfNVifdsXkZfAXpgCZkx6yv+iuA/7vq5fMl8mqD3IXfPA+Mn8uxCwNE9IzQLKSs9HKr3mbzHcC67Y1cPW55NbAiS3nB6gvY2sceSaziR/beViQBHoUJ4fr+mo2g81LurtJsFvbacG2J7f2MOdlsCOUMFXF4iUNhJqP7x/2w3dL1mjcote1N6DQHP6qA/hgFnVZb7b4O/6cIaR+IBRmxgmqkwfJKVb2QlBdAAX6Kt0/Ag3QRVYITxFH4K02Z++oZRoB9nGHwRFulh4YU2EYHtF2m2evBoXm6XkXQ0pMRvZ2oL3STkP066Ejo+0cWf2/qclWCsAyhpWBzgDPTeX1vF98eIlqnq+vH9ZV1oTungqnGpF8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(3023799007)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?L4hqt9v2k4LMxtHwaA+KBrk58VijXRKRFq/3RTwZf4IQpbV/XczdlTFjXH?=
 =?iso-8859-1?Q?F/H32J04u/6mexTZW3H1UU6GF34iovEhpnAUsz34VqC0VsyDwS/AIP8K27?=
 =?iso-8859-1?Q?be92qWS6DKSZp+XUS793NPKtrCIXoQ3I80yD1eMYFVyqEzJF19l9dC6qj9?=
 =?iso-8859-1?Q?qZuT0ixsX4iTbxlt6NOtKw6ogDZhjdqJcOuYQkPkbu/wbxetggjPfaW80P?=
 =?iso-8859-1?Q?EyC43skXxRYr7hxXQW4V3bCG7ER9aJ9Hly3Qu4cuENaj8ZjdR9oCO2mOU9?=
 =?iso-8859-1?Q?VZn+YKILqYRpAxzAkC/YTnsc2Xej69mR3vgIEcaZyUtE82O655ME8J4Cbj?=
 =?iso-8859-1?Q?kr4kJ+nmEnI4ylRK0CidNN/pfZsXWtyE1ORib+yj8c1gShLQNU6eWnFiS9?=
 =?iso-8859-1?Q?gJ2M8YfRPY61yVmXJMUxQqO6XAhNUSFyAnVSAd1j++aLcuTI/3DBMDOvE4?=
 =?iso-8859-1?Q?GVKnoEfpY0OBuj4lMo2OyTWnXpUbtg7dlYnhzuScs4mnrtuZ5AeUgnd2bK?=
 =?iso-8859-1?Q?xhwx4YbuiEi7VFdAfGYyq+WHCd3fmSE5E1FPhS9+zr93ilPAN54K/pc7DL?=
 =?iso-8859-1?Q?eRwsC2skOeaaRL6Igtjy7p9t8qKITk7o155JyC5TdGcP6qpJDhPbM20P2T?=
 =?iso-8859-1?Q?Dbtb5O5VB9VOu0n/Y7dpOOVc05agkXM1I80VJmvBSYP8AYcB7tsVbajyzV?=
 =?iso-8859-1?Q?AItYE7O1q8++TBkeibaf3mbZQaSaH5A1eHi4NzFWL4DqutbShr4oWy9JYJ?=
 =?iso-8859-1?Q?MCCfyH8ISrrjbkYE4bFHed5ogiJo533EaXc9bv9UKEBhUmcAdusrRWHM2L?=
 =?iso-8859-1?Q?o5GsOzPOodJAvkFjdZQo6w4g1apc9c5r/OUAgsv7V2f679S9n/x82fCluj?=
 =?iso-8859-1?Q?9MdMA0I2xYFBG53CLRWE1Ir+rT3KmH9FZ+YWDqgUYDjKuPXIoXOwG8Bn57?=
 =?iso-8859-1?Q?AhA7pv2uhur49XdRFnnq/EENtFh/wdEMSavZ+jUPYyRvViD6yVl/ODLkdX?=
 =?iso-8859-1?Q?dfGxMvFJnFuIBK0S7Oxxbk/BnlM635mJUA6jRYuRmXcrGXGuwEmpYFSi79?=
 =?iso-8859-1?Q?xP/MZcEys3sC3GzVIzoEHrKi+4gjnIAeXoEjfZroEmTjY8JLG6r0MmGzVZ?=
 =?iso-8859-1?Q?Utj193YmjCcx1xWMqTf1EfJY2KZvaCAX+29p65Qnlu0Xu/IN+V4bjP8ajW?=
 =?iso-8859-1?Q?n2k4UrEpuF/6cL0iuirVqV/nJQgaBJZcZv+XBUp3/nVLDYrhIsyY67s5Tk?=
 =?iso-8859-1?Q?MvizuWa//w64V8/6+JH1XLjlf/jBj4bVrJWSBnx6NOBA5vYGsVtp1E0Lsp?=
 =?iso-8859-1?Q?HE6cDm4Gjq6R7FY+IhocwZsIpF9jwFvxDuIRS/j9YUSWkGydVrjW9yDLIt?=
 =?iso-8859-1?Q?6zbjusSvMFjo9WUQbADJl7olr4AV724awMRTiHshA0hpvrRlUHbAFDEGyw?=
 =?iso-8859-1?Q?xBzIGb5jPM9RwnYA6b0nvKPto8rA6DeVCGk04iSd5AJ0zag+c+OnWxIODh?=
 =?iso-8859-1?Q?psl6Ema/PbFEg8Q4a76YqwMxUyGrrAKAAELMHvw8Uhz76YGVWFtzrTKoL+?=
 =?iso-8859-1?Q?8V4OqjZ9go1mJD7gP0oe1NB75+isyowBKaGAjAUWG6SmDS+7HF9BpxScna?=
 =?iso-8859-1?Q?TXi0fKcTm6TqQnysF0k2+ga68XQe81UJ96TyavKbRRo19YzzgxWoeoc/1y?=
 =?iso-8859-1?Q?MXhs85N2EqdlM9XjUh1dmeGF8zb4h4M5WhhzsW9+DmZvrqKFhdimJK5jW2?=
 =?iso-8859-1?Q?7XntgUe1L4TnfVOxfYYRgXE/VnTSo4KLaeaqw+uYRmA5iqOLsnoJLKYTkC?=
 =?iso-8859-1?Q?wYD73ayyRg=3D=3D?=
X-Exchange-RoutingPolicyChecked: hMZ6fnfdFdV2tRAvD2DJlSxU3CumS0Smx98Hu8Z4s2Ca/3mR6W+4PeRV8Zdm5idAIDRVeyfX4Oxpn4lZazcOQI1McI1+KQArRmLNSHyUSK4+/s/yboplmV9R3l2w7VZDI9Yf3GhPSSCr0QB4SVUG7nMcO+0WcyMWDE//jZh6gBA6OiHU1rZO080b3yBX69D1wWWFFoemUJ/MkXgWO5gdqrFb6GY4Wl0GaPcVH0lx21yk/PIeV6xIAgIznv1aFfQBxS6GCkAtsJ+J4lKPYXlGgXbLY690d50EJP1VsOr+llkFrDqXEXrviEBxyclbbnTzeOjr1wTkEfVkb6NNTXNLiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a528f924-0563-461a-4e7f-08df1cf19bd5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 23:46:54.6969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhOgUUoASBPkzT5iIK8KKJ94hbCNsAv04gOmxlIST/xN8/eWn8E99PsNwg5UlXFPmdQU904tNX+XXYxdmCm3Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
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

On Fri, Sep 25, 2026 at 06:55:21AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add debugfs support for exercising System Controller mailbox
> interface from userspace. This adds the "sc/" debugfs root
> directory and a "loopback" entry that sends an arbitrary byte
> payload to the Core group's inverted-loopback command (group=0xFF,
> cmd=0x03) and reports the response:
> 
>   echo "0x11 0x22 0x33 0x44" > /sys/kernel/debug/dri/0/sc/loopback
>   cat /sys/kernel/debug/dri/0/sc/loopback
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v7:
> - Add usage hint to loopback debugfs read output
> 
> v6 (Rodrigo):
> - Reject non-zero offset writes for loopback entry
> - Account for mailbox header size when validating input payload length
> - Add warning on devm_mutex_init() registration failure
> 
> v5:
> - Add per-entry locking for debugfs accesses
> - Drop unused xe_device.h include
> 
> v4 (Rodrigo):
> - Squashed debugfs infrastructure and loopback support into a single commit
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_debugfs.c               |   4 +
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 176 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.h       |  14 ++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   5 +
>  drivers/gpu/drm/xe/xe_sysctrl_types.h         |  38 ++++
>  6 files changed, 238 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index ba4404896f2f..64232a48fd18 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -128,6 +128,7 @@ xe-y += xe_bb.o \
>  	xe_survivability_mode.o \
>  	xe_sync.o \
>  	xe_sysctrl.o \
> +	xe_sysctrl_debugfs.o \
>  	xe_sysctrl_event.o \
>  	xe_sysctrl_mailbox.o \
>  	xe_tile.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 80f62634fae5..926020c7526e 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -31,6 +31,7 @@
>  #include "xe_sriov_pf_debugfs.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_step.h"
> +#include "xe_sysctrl_debugfs.h"
>  #include "xe_tile_debugfs.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vsec.h"
> @@ -836,6 +837,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  
>  	xe_fault_inject_debugfs_register(xe, root);
>  
> +	if (xe->info.has_sysctrl)
> +		xe_sysctrl_debugfs_register(&xe->sc, root);
> +
>  	if (IS_SRIOV_PF(xe))
>  		xe_sriov_pf_debugfs_register(xe, root);
>  	else if (IS_SRIOV_VF(xe))
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> new file mode 100644
> index 000000000000..dfd614e7e54b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/debugfs.h>
> +#include <linux/err.h>
> +#include <linux/kstrtox.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/uaccess.h>
> +
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_debugfs.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +#include "xe_sysctrl_types.h"
> +
> +static ssize_t xe_sysctrl_loopback_write(struct file *file, const char __user *ubuf,
> +					 size_t len, loff_t *offp)
> +{
> +	char *kbuf __free(kfree) = NULL;
> +	u8 *input __free(kfree) = NULL;
> +	struct seq_file *m = file->private_data;
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	struct xe_device *xe = sc_to_xe(entry->sc);
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	char *token, *tmp;
> +	unsigned long val;
> +	size_t input_len = 0;
> +	size_t max_input;
> +	size_t out_len = 0;
> +	int status;
> +
> +	if (*offp)
> +		return -ESPIPE;
> +
> +	if (len == 0 || len >= PAGE_SIZE)
> +		return -EINVAL;
> +
> +	kbuf = kmalloc(len + 1, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	max_input = min_t(size_t, len, XE_SYSCTRL_MB_MAX_DATA_SIZE);
> +	input = kmalloc(max_input, GFP_KERNEL);
> +	if (!input)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(kbuf, ubuf, len))
> +		return -EFAULT;
> +	kbuf[len] = '\0';
> +
> +	tmp = kbuf;
> +	while ((token = strsep(&tmp, " \t\n")) != NULL) {
> +		if (*token == '\0')
> +			continue;
> +
> +		if (input_len >= max_input) {
> +			xe_err(xe, "sysctrl: loopback payload too large (max %zu bytes)\n",
> +			       max_input);
> +			return -EINVAL;
> +		}
> +
> +		if (kstrtoul(token, 0, &val) || val > 0xFF) {
> +			xe_err(xe, "sysctrl: invalid loopback token '%s'\n", token);
> +			return -EINVAL;
> +		}
> +
> +		input[input_len++] = (u8)val;
> +	}
> +
> +	if (input_len == 0) {
> +		xe_err(xe, "sysctrl: no loopback payload given\n");
> +		return -EINVAL;
> +	}
> +
> +	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
> +				  input, input_len, entry->response_buf, input_len);
> +
> +	scoped_guard(mutex, &entry->lock) {
> +		guard(xe_pm_runtime)(xe);
> +		entry->status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
> +		entry->response_len = entry->status ? 0 : out_len;
> +		status = entry->status;
> +	}
> +
> +	return status ? status : len;
> +}
> +
> +static int xe_sysctrl_loopback_show(struct seq_file *m, void *data)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
> +	size_t i;
> +
> +	guard(mutex)(&entry->lock);
> +
> +	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry->group, entry->command);
> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ? "FAILED" : "SUCCESS");
> +	seq_printf(m, "Response: %zu bytes\n", entry->response_len);
> +
> +	if (entry->response_len) {
> +		seq_puts(m, "Response data:\n");
> +		for (i = 0; i < entry->response_len; i++) {
> +			if (i && (i % 16) == 0)
> +				seq_putc(m, '\n');
> +			seq_printf(m, "%02x ", entry->response_buf[i]);
> +		}
> +		seq_putc(m, '\n');
> +	}
> +
> +	seq_puts(m, "\nUsage:\n");
> +	seq_puts(m, "  echo \"<byte0> [byte1 ...]\" > loopback\n");
> +	seq_puts(m, "  cat loopback\n");
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_loopback_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, xe_sysctrl_loopback_show, inode->i_private);
> +}
> +
> +static const struct file_operations xe_sysctrl_loopback_fops = {
> +	.owner = THIS_MODULE,
> +	.open = xe_sysctrl_loopback_open,
> +	.read = seq_read,
> +	.write = xe_sysctrl_loopback_write,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
> +static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_debugfs_entry *entry,
> +				      struct xe_sysctrl *sc, const char *name,
> +				      u8 group, u8 command,
> +				      const struct file_operations *fops)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +
> +	if (devm_mutex_init(xe->drm.dev, &entry->lock)) {
> +		xe_err(xe, "sysctrl: failed to init %s debugfs entry lock\n", name);
> +		return;
> +	}
> +
> +	entry->sc = sc;
> +	entry->group = group;
> +	entry->command = command;
> +	entry->response_len = 0;
> +	entry->status = 0;
> +
> +	debugfs_create_file(name, 0644, root, entry, fops);

do we really need to give read permission to non-priviledged user?
I believe 0600 should be more appropriate or explained.

with this addressed:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +}
> +
> +/**
> + * xe_sysctrl_debugfs_register - Register debugfs entries for System Controller
> + * @sc: xe_sysctrl instance
> + * @parent: parent debugfs directory
> + */
> +void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
> +{
> +	struct dentry *root;
> +
> +	root = debugfs_create_dir("sc", parent);
> +	if (IS_ERR(root))
> +		return;
> +
> +	sc->debugfs.root = root;
> +
> +	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc, "loopback",
> +				  XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_LOOPBACK,
> +				  &xe_sysctrl_loopback_fops);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> new file mode 100644
> index 000000000000..d1414ac3562e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_DEBUGFS_H_
> +#define _XE_SYSCTRL_DEBUGFS_H_
> +
> +struct dentry;
> +struct xe_sysctrl;
> +
> +void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index e98fa6877fec..6a8284a424c3 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -47,9 +47,11 @@ enum xe_sysctrl_gfsp_cmd {
>  /**
>   * enum xe_sysctrl_core_cmd - Commands supported by Core group
>   *
> + * @XE_SYSCTRL_CMD_LOOPBACK: Loopback test command
>   * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
>   */
>  enum xe_sysctrl_core_cmd {
> +	XE_SYSCTRL_CMD_LOOPBACK				= 0x03,
>  	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>  };
>  
> @@ -118,6 +120,9 @@ struct xe_sysctrl_mailbox_command {
>  #define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\
>  	(XE_SYSCTRL_MB_FRAME_SIZE * XE_SYSCTRL_MB_MAX_FRAMES)
>  
> +#define XE_SYSCTRL_MB_MAX_DATA_SIZE	\
> +	(XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(u32))
> +
>  #define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 98c2f473f7c6..9ad3c40de97a 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -10,7 +10,36 @@
>  #include <linux/types.h>
>  #include <linux/workqueue_types.h>
>  
> +#include "xe_sysctrl_mailbox_types.h"
> +
>  struct xe_mmio;
> +struct dentry;
> +
> +/**
> + * struct xe_sysctrl_debugfs_entry - Debugfs entry for a raw mailbox test command
> + */
> +struct xe_sysctrl_debugfs_entry {
> +	/** @sc: Back pointer to parent sysctrl instance */
> +	struct xe_sysctrl *sc;
> +
> +	/** @group: Command group ID */
> +	u8 group;
> +
> +	/** @command: Command ID within group */
> +	u8 command;
> +
> +	/** @lock: Protects @status, @response_len and @response_buf below */
> +	struct mutex lock;
> +
> +	/** @response_buf: Response data buffer, sized to the maximum mailbox message */
> +	u8 response_buf[XE_SYSCTRL_MB_MAX_MESSAGE_SIZE];
> +
> +	/** @response_len: Actual response length from firmware */
> +	size_t response_len;
> +
> +	/** @status: Last command result */
> +	int status;
> +};
>  
>  /**
>   * struct xe_sysctrl - System Controller driver context
> @@ -31,6 +60,15 @@ struct xe_sysctrl {
>  
>  	/** @event_lock: Mutex protecting pending events */
>  	struct mutex event_lock;
> +
> +	/** @debugfs: Debugfs entries */
> +	struct {
> +		/** @debugfs.root: Root debugfs directory */
> +		struct dentry *root;
> +
> +		/** @debugfs.loopback: Loopback test entry */
> +		struct xe_sysctrl_debugfs_entry loopback;
> +	} debugfs;
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
