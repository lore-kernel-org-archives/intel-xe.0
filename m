Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFA1C02187
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 00:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3535210E0F3;
	Fri, 17 Jan 2025 00:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQODZcOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F85610E0F3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 00:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737072553; x=1768608553;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dy5HRdGdX15SFbm7xK8JTUcFYqPeddj06v/Uda6Jb8I=;
 b=fQODZcOYUVIEnwmzPa0jSZn8fwC2dVXdkeN8wEK5P+onfPFqPSYF+VBS
 1wIll8pr6RX7G0OBxRK1GQqb3zWGzq9JGsNMx8DGKAsw5+Apx6WF4DVm9
 2chQVHEJsvxIQVkxLXDlsfkAS4n+gRoK3RWBFFKl2yjgg9gl1aqFxkc+V
 oWzCzdQwEtNduG5B8WKR4063rXBwrFra9CeQCcKgtlrg6mlthRX3dxKhU
 Z0LWTDkISVwuXz/sNjw0WA8vAo9zWkCBXBDPMgZC6TMfpYuXt+w4SS62U
 UuQu4s0IQJuXIyFKXH/U6M3TbQPbq1dUU2Leq+2reqRyj4UU4ZYFKkbzt g==;
X-CSE-ConnectionGUID: sa71SKfNSkSJyWtmVGt5YQ==
X-CSE-MsgGUID: 6WvFSjL6QJGQZnTqH3tIFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36698807"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="36698807"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 16:09:13 -0800
X-CSE-ConnectionGUID: A40mBfNhSxa7BP/zmp+vgQ==
X-CSE-MsgGUID: 8njwb7zXTOmmL8TnRnJ7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="110639844"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 16:09:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 16:09:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 16:09:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 16:09:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBpy+N58/cRvgX76+6GYzN2/OxAEFTX6LJUWC0+y5ZBnOeE1yvtZ0ea5PD46KL3FVom8uiCt0/X55SXRGHaTLcz20bHfBwS3KowDuayEKANgiMHbWpMOq5vD3yRMoBzvZFNqRChPwSGdP+sQeLUC3sjSFaZL9szM18OzBV3pGy2FdFZ6vFGOkgkWrIOP9r3FgYB2XGAeRcToHwZFOB9fTNnPAO4iVHRk6Ec0dK9g+kn1MyntB5lUcu7miwGDeCNprmKso3oeNfVYJz1Pv1WloS1ICN1qlvJWpOhnalY565RHxwbciR/jHUA/4I+7yECNm3NUo0rzHsWF87lapv9rwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+lMXi5PbWcXX+dvyKjtIlnTvAvIAi2W+mzkK/GCfkA=;
 b=Nm5/Rxwf0Xqt+Mj0gtzuEzKEV4+i0gX4ejreLLm8783TVNgRQB9DrloQqL2fjPy/X/a6WGJbt/uvlQ0C/ZNlNFS5AfNVNddFaBOtQ4GIgdbobDV+rw6aDmsPwGpDOu6X2OhnHZWR5Jv0cvujM3vuSaX764A/ZOXbiX5U7s86zt1kUXcvKmHx1KdQgHEwDBZr8KEEbHmaA8wOhWk6pIukP8TP2EjPvKgIlysiz/y7YWGgAu3O6Hnj0iXFHJNveHWzl1TF/itXE6WxeVG4I5ecAbZoyNkKp7nPC+g9/cL1OnFfoYJvklX3qMXW6W91XxysTXs/syo4gWq0tU53c3oTTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4581.namprd11.prod.outlook.com (2603:10b6:208:26c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 00:09:10 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 00:09:10 +0000
Date: Thu, 16 Jan 2025 16:09:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Refactor max_remote_tiles
Message-ID: <20250117000907.GK5109@mdroper-desk1.amr.corp.intel.com>
References: <20250116125447.4025927-1-sai.teja.pottumuttu@intel.com>
 <20250116125447.4025927-3-sai.teja.pottumuttu@intel.com>
 <8326b6f30df9fdfc13c44d4b26d00ea5c0c9dc0f.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8326b6f30df9fdfc13c44d4b26d00ea5c0c9dc0f.camel@intel.com>
X-ClientProxiedBy: BYAPR07CA0050.namprd07.prod.outlook.com
 (2603:10b6:a03:60::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4581:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a53d79-6195-461f-0f47-08dd368b2ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?qbPm0V0iJSnxLo8nYhpT/7rdQQpG1uyhZbUZ2fu8xOeZjGLWRl4auPLHWk?=
 =?iso-8859-1?Q?vpJDoKnikP9Z+Ag1BxkTyoOB45zYEYgByfrgz/DBX8zzFmDjWZL80E3Kzq?=
 =?iso-8859-1?Q?fPFM/SPL/wstzv3ZgtUZ8kQaz2ysOW8Kx2zdsTKw7Nlu6tS3kSTIFrM43Q?=
 =?iso-8859-1?Q?3b16NR60NTizsYidR6dnk0Gf5pN5TH34cXaDvxuZtJcldm8g/GYo9T3tg/?=
 =?iso-8859-1?Q?eSHathaQb/BvIg/g9v3DG7CnU1lOH6p8qmTGcXtQUDSpXO03pEV5y81iSx?=
 =?iso-8859-1?Q?KjWjX74zCK+bcWasOTVAta/O9qy2LDkAw+7QWWJPcO9EjmttmTTm6XxDee?=
 =?iso-8859-1?Q?pGBtXBhbRoUUaadxtGYh+vUJLYHjhnWhTAnGdZ/ST45hvH1jXbtZSo+S0f?=
 =?iso-8859-1?Q?EehxMgP6TbWDUQVJQC0QaZ4O8qVMcSGRreeXL4n1kyFkA0o6z5amPF1CRw?=
 =?iso-8859-1?Q?4qQb76BYyMeD+PhOmRjXzDJ4vN12UdlGxAexDv4pwLfjRL+T+HOXCDe9gJ?=
 =?iso-8859-1?Q?YCNQxZUFAv8Yn0TlVnsHulG7/M45WqVmlmJq9AfQhzwo/HrYzY7iPGflmM?=
 =?iso-8859-1?Q?7LSmeVsd+QiS4YXTgVk1D5euD1Kf05usGeErxTi++z9Mc0WDc4DD9gTxTG?=
 =?iso-8859-1?Q?OdddQMOboWmmTQYqiCojd2x1VUSfyJv1ctRTe8fQZnLqsCCpzLjf9TxFQ3?=
 =?iso-8859-1?Q?U+jFZs/QcaINR7TGyGtUETr4Ot6RugdMnsQCllpNMzLYFjJmHjTDZY9qy3?=
 =?iso-8859-1?Q?5IliXT5dAgo7T3rHucq/B1zpCwXOr3xfAlxHJ7/LfAJxQKjFfpDfCo7fg5?=
 =?iso-8859-1?Q?U9R+E1c43r4QtgorN/JQo13w1MCltGguHi8eb8T1qaiYaiUkvWw2ltNL6/?=
 =?iso-8859-1?Q?+YX3w51eKe1ZZzwQQhu6UiqDeHkZUBxNAG/nCQ0twwUmUWk1eRuA+umORf?=
 =?iso-8859-1?Q?vT9tl457+HHJzf/SSR17Imn/cp4Rie4x5SFvyWcQMAwirpFYXG+iEh6iN9?=
 =?iso-8859-1?Q?WHENilYprYrzXg51c8hms6u+rN+tZ2/NZovfN9WSy+DDcx06t6+8ISIf6W?=
 =?iso-8859-1?Q?Vrd5t7R1YeGhALyET2qyOCysaSln95BjhSxscX/aN/GXb8VmLdaX9wCtTn?=
 =?iso-8859-1?Q?+jtQn2q3wWqxp272H5wr1txeoQFsRiAICxUd2Fxcr/CBEM6h8srvFVfplJ?=
 =?iso-8859-1?Q?HFd2vBrIGG5kGx6fKZHxHseViClNhDBrNu9go59xAA9SvkZmD1H4S+rRiS?=
 =?iso-8859-1?Q?mEpjby8qKLMzETpaJKqfQSHflvOVBXQV5tyUl20BMLRuncCXHB06BfS3T3?=
 =?iso-8859-1?Q?CzrswIaQWMF+P/JXQ46LUbn5AD8x6J8DumsoJvNChbSkbF5zNbhEDHVWAl?=
 =?iso-8859-1?Q?YAQjmIwJDNpfLJ9DwXphi8b5FLhbFvqoDisIxzD2JBFdY/3/IyGHL4QZOC?=
 =?iso-8859-1?Q?GHEspHO4JnaCeojV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?35BZqENxHxWfvsod68pdmQkeegUS3C7Pxz4CHNxoJ8hlX8X5MVbmAO02hL?=
 =?iso-8859-1?Q?IQngBgAKj1WpVXRnGS400B0LzE5KoryILh/shDE1RzlROzgy2XvRazr8ou?=
 =?iso-8859-1?Q?K5f+dlu+CHw2VtLQdmEE2x0Yu3TMDzZc7dZmfSdwvvUN5vGUIx47dq7NGo?=
 =?iso-8859-1?Q?bnuA/+8QaTOoNuXgti3VptK03w71MaVeT0sMtrJFwceHk/I62KpKAYDZya?=
 =?iso-8859-1?Q?NVAItOSXG/w5GE2n2xmNrmKMKj4xz18Pfdxz+EldB3irCp9uBThuO5RHO1?=
 =?iso-8859-1?Q?1cNfnr8sRNqQdW2uumGWoXTbm52T+U+NQMHitCuR8TpR9oxaoLQJf1q+Sj?=
 =?iso-8859-1?Q?ih/zHmKU1uYXOz40dSi+84SSCBK2+eVoyY8UfHNdrkxC9Cg1y53xk59Mxr?=
 =?iso-8859-1?Q?R4RwsWiT7kP9H+w4tb9zSE/wv17NGiuVufIVvsCrbQBoiutG/MFNJXDcf8?=
 =?iso-8859-1?Q?oUNdQcWuCED0b5lpe2x3DIdyXWIif7gNsBONBgkt9CAbD5znu/murnBs2S?=
 =?iso-8859-1?Q?9OGynR0+tXGmQrhhEDcEEPQ5HowjvjQ+QvFAZ31daMXJ9Fw2AwIjo623vO?=
 =?iso-8859-1?Q?i6fNHZNdtgdEIXiVIKjLbbaV3VfENaVdprSAHxaaEfPiAzEQQlyIQIHXAD?=
 =?iso-8859-1?Q?ESfrCpCeQtloRo5x5zjy9Rykk25ptLER5PfA70BhCVFvu3PYepCv/tONbV?=
 =?iso-8859-1?Q?x/OGmzlcwY0AaK8zpurTJEp1xySMRoO/VZ7T2vMmRC79lJlNNS1ydHq1JO?=
 =?iso-8859-1?Q?b1S7y/YgEUCWlkhhVrmx6x3CJ3ZVItAe4iP/c3To7RzF+k2zkUUXQ1B+6I?=
 =?iso-8859-1?Q?kLtNoUocTGeFwaW8DyWdQIqxyOPT80MmBmV0d+ZD8QmPCyDoAWupJJkAGo?=
 =?iso-8859-1?Q?WSnYJZQu9+IfxtPEY31pSVn//lFfzswK2yspl0VW09DgQrstU5bz/4hTOP?=
 =?iso-8859-1?Q?9dgbt8QKF/cN8ufO6XDUBWt4OQ054CMg07iQsRxjKzvue/JDS3RLF7hUau?=
 =?iso-8859-1?Q?pDJy+klAGLHvnpHDu0NSDBgtJXd42ffFuGFUCxWVDbRCi/B/u/Xj3uPo4d?=
 =?iso-8859-1?Q?Gz8Tx/9wnVSH3S9PBcytchPnYnHZaoZwbioYKmd91liNlUp8EmAQqr4Jcy?=
 =?iso-8859-1?Q?d1MWO3TKNy4CDkdaj57GFuOW28xMLljr+IavAeqdPf4ppOdGgTHa8+GNzt?=
 =?iso-8859-1?Q?Gz8nSqubCvYOfV3pmUq8kuVoplvYBykq5tiLIuBui117M17+sCsMAUtnBx?=
 =?iso-8859-1?Q?mxC2BcabzP+nLN+oOx/fjK9nebwfPsaq29A9V/K3dToKoJfyezClqOzkXf?=
 =?iso-8859-1?Q?JfTCf46KjdD6+uAr4aMokCoDSQWDeBnIBY9gQherUjN3Tgs2HV1Fv2xlMV?=
 =?iso-8859-1?Q?PeZcIGS5SzGBu4cAmYRSWYJKAYO26z122hJtvCp0gebVyvpHRBc0Hxwh84?=
 =?iso-8859-1?Q?3sI7mPC0wudGZ4AR1boDZTXmRVHOOI8w1/zIDFa/WqtltghkcHqLIazC6s?=
 =?iso-8859-1?Q?QfkwEqG2IK7Z083MuvOA7UCtI9RGyjrEafqI82CsqTtRMyren3If7G7xdj?=
 =?iso-8859-1?Q?My0/DS24iA5MM+MKTp9Y4kxmDNRsACc9l3H4QpO8kUiHa5wK4xGi4jyZh3?=
 =?iso-8859-1?Q?WisywWJeb5U0AWKfOIEbNENhurjqKybO5h1y63drDeeJhB5cV43GhTmg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a53d79-6195-461f-0f47-08dd368b2ab9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 00:09:10.2624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxA1NDiARe7LnEocF1EIjUEFCthMDbCowNB2WKHK6vrQKjtJdY/1Wn6dx+r8DBOY4VgBxrn8V6uGmCy8/VqDeymJrKBRxZjJjCfqRR3tZJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4581
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

On Thu, Jan 16, 2025 at 11:16:26AM -0800, Summers, Stuart wrote:
> On Thu, 2025-01-16 at 18:24 +0530, Sai Teja Pottumuttu wrote:
> > max_remote_tiles is more related to the platform than the GT IP. Thus
> > move it to platform descriptor from graphics descriptor. Note that
> > the
> > FIXME is no more required, thus it can be dropped.
> 
> I think we still want this FIXME. Has anything fundamentally changed in
> the driver wrt tiles vs gts?

I think at this point we've fixed most of the code to use
xe->info.gt_count in the proper places instead of xe->info.tile_count.
E.g., commit 37efea9ca258 ("drm/xe: Allow GT looping and lookup on
standalone media") and similar changes.  If there are places still
incorrectly using tile_count then we should fix those, but I'm not aware
of any off the top of my head.

The thing that is still a bit of an open issue is if we eventually have
a platform that has both multiple tiles _and_ multiple GTs per tile,
we'll need to figure out how we want to number the GTs (for example,
0=p 1=m 2=p 3=m vs 0=p 1=p 2=m 3=m) and then rework code like
xe_device_get_gt() to use that.  But that decision can wait until we
actually have such a platform.


Matt

> 
> Thanks,
> Stuart
> 
> > 
> > Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c       | 9 +++------
> >  drivers/gpu/drm/xe/xe_pci_types.h | 2 --
> >  2 files changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > b/drivers/gpu/drm/xe/xe_pci.c
> > index f59c1acae23f..7f17e5ea6edd 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -55,6 +55,7 @@ struct xe_device_desc {
> >         enum xe_platform platform;
> >  
> >         u8 dma_mask_size;
> > +       u8 max_remote_tiles:2;
> >  
> >         u8 require_force_probe:1;
> >         u8 is_dgfx:1;
> > @@ -136,7 +137,6 @@ static const struct xe_graphics_desc
> > graphics_xehpc = {
> >                 BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
> >  
> >         XE_HP_FEATURES,
> > -       .max_remote_tiles = 1,
> >         .va_bits = 57,
> >         .vm_max_level = 4,
> >         .vram_flags = XE_VRAM_FLAGS_NEED64K,
> > @@ -329,6 +329,7 @@ static const __maybe_unused struct xe_device_desc
> > pvc_desc = {
> >         .dma_mask_size = 52,
> >         .has_display = false,
> >         .has_heci_gscfi = 1,
> > +       .max_remote_tiles = 1,
> >         .require_force_probe = true,
> >  };
> >  
> > @@ -635,6 +636,7 @@ static int xe_info_init_early(struct xe_device
> > *xe,
> >         xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> >                                  xe_modparam.probe_display &&
> >                                  desc->has_display;
> > +       xe->info.tile_count = 1 + desc->max_remote_tiles;
> >  
> >         err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
> >         if (err)
> > @@ -706,12 +708,7 @@ static int xe_info_init(struct xe_device *xe,
> >          * version 13 or higher has an additional dedicated media
> > GT.  And
> >          * depending on the graphics IP there may be additional
> > "remote tiles."
> >          * All of these together determine the overall GT count.
> > -        *
> > -        * FIXME: 'tile_count' here is misnamed since the rest of the
> > driver
> > -        * treats it as the number of GTs rather than just the number
> > of tiles.
> >          */
> > -       xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> > -
> >         for_each_remote_tile(tile, xe, id) {
> >                 int err;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> > b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 7437415a54d5..b96423844952 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -19,8 +19,6 @@ struct xe_graphics_desc {
> >  
> >         u64 hw_engine_mask;     /* hardware engines provided by
> > graphics IP */
> >  
> > -       u8 max_remote_tiles:2;
> > -
> >         u8 has_asid:1;
> >         u8 has_atomic_enable_pte_bit:1;
> >         u8 has_flat_ccs:1;
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
