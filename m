Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E96C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 15:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBAB10EBEB;
	Fri, 23 Aug 2024 15:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHlI7Lvq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E1210EBEB
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724427473; x=1755963473;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1IiSI0G5lVVeK+F2qsoGV1XFENugvHMinLS7NcEqCJQ=;
 b=KHlI7Lvq3uqD77Ctur6T2K8uytb7CAwmQNCOnZ5UqdghOK8YTku9vi1p
 y7azA3SJtyoxCXc2cmL9a9NA7XhOSCyJqmLqG4OiQz7UBPh9Y9JOngYKP
 p2013KxABLjRubGU5RVNMEaLrSJipFiC2O2vs0pzQ+u44sUsCKTpDD90y
 TtoVTV9BShaES9Gh+866LiIbag1GPoZYzzP7eASAsrZHsgSWkLWcGj6cB
 XawNhlT38L4yg3I+NXWLnnN/FoeFDu96WB8ySKJ/MtDPCia6UlROsuBFj
 zs3VTkY2AErzNg5AWNwu1UljN6GS6wUFuK31WdYj52iD8Pa5uZniOETng Q==;
X-CSE-ConnectionGUID: qggb4/l6S+mieRNd6NhZ2A==
X-CSE-MsgGUID: A4auz0pmTwmZYFWqnumw8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23071463"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23071463"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:37:53 -0700
X-CSE-ConnectionGUID: X60QABNfSWm/UhErLTvnIw==
X-CSE-MsgGUID: NX8mwh81TSm7Yj3NjxJTbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="61800678"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 08:37:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 08:37:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 08:37:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 08:37:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 08:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amUgk3/QAP86wjAPZkvfvr9XLcJULpWrmk7nUJZbPWXFeL7rgY4NCvGj3mP0nYH2LsIIcjtx/p4s3px9gx1vu+0A6uo4jE/Hzfg2l0QUcQLH/Et/ZkSSV3O5Xd4PH+lGEe5wha8nv1OEhcvsscEBDt1ZPkIemo1AMeqLnq1VxZn1Vq2yVHTZ9OIXm5DroQobKu3q2/Hn8McJol04tyfmxB91C6l2k8r6LS3jFhuL3/I5ZMQ8t9lmdpXNxuEYNo3Gng7H5HSkLKcH37igRJKo1HeVLPBr8DgLydsCQ9fdxiwNcV+uJ5Q7x8W9kL/l2GN6967wih9BRq8x5lHgA8rwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8Y8cSMzkKhRH3fITk/sqdfDkdqDGnvYP2OLtp6DLUA=;
 b=Jzpk1W6jP6FPbqkK5Ox24d1TzQn+2ObTG9p8eWd/dpOwzPgvwCLVLMCXGIgKKpbFL35QjnIz3GvY1Mpk6T4WnegvJJMsH9SynEyN1tx1w6Q66yQTpVjsoVfepbttgBEMFL/qZEO+BJ1ok3h8W+osMe1u5yA52LBlQAnsIVq2h5DuoIifhu0BRsgTWue9ilp+pxLu5R54DHTC3ppH5dqi6B0Jecky8WMskcg89unYpIGIPNVgUuSpj+N2TmunRd7gZWphcmL2eETIFxPiCLRKp7O1JnY1M6auMJm1zs0DSJhZ+D9pxQpozSB2tpZsydgzBcdMIzndmIEc84RRYwe+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Fri, 23 Aug
 2024 15:37:44 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 15:37:44 +0000
Date: Fri, 23 Aug 2024 11:37:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Use separate rpm lockdep map for
 non-d3cold-capable devices
Message-ID: <Zsisw5eTh-0ud6ic@intel.com>
References: <20240823135906.78899-1-thomas.hellstrom@linux.intel.com>
 <Zsif_XiAGPRvAIHa@intel.com>
 <4c75e56030c904cebea2c74544024e308f65bd68.camel@linux.intel.com>
 <ed1f0a1ffb6f199e61c509f4c98fec97983a084b.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed1f0a1ffb6f199e61c509f4c98fec97983a084b.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:303:8f::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 66709fec-3ffc-4f33-b638-08dcc3898850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sdQXk1FiGE25+fK/EpnTZIdWNVyQTUgx/i8XVxVnuo2Ce3VIALbs62/Va9?=
 =?iso-8859-1?Q?qpFoj/eMrlPq06bLkE8zVbHA6+HONx6lLfmNqKOFavdm5qiIdxgv9rt1L2?=
 =?iso-8859-1?Q?wm/+iphesvCo+0XWi1mp13yUtyoGs5RZsQWfgE6X8YOBIAZtgljOH1ktwS?=
 =?iso-8859-1?Q?3CeA6w47CEVQvxUG1OGjlAdpbO2Qe8CEompLbjW++yStIGme4sxpJSNWvX?=
 =?iso-8859-1?Q?WDnlSBAX8UE7Klnp446E+9jUVMWPIJLz7O6O3zJ9PB4QHbR4eaYnfHlhAp?=
 =?iso-8859-1?Q?zISX5qkbnG66LIjxQ0842YDH7teh97Zi43lWUcJez5iphjrx6Ihb2TEGqy?=
 =?iso-8859-1?Q?bfiFPxT8Z/mC2OhdOnYC7Zq8kO65j7SiI7v7HcXt/HrWRlO+to+MjfKm03?=
 =?iso-8859-1?Q?hlNrEdCcmUCvxVso6cXtvbnW42nhv2tOb+W7qqJCmJWD3XlcPgMALbJgJg?=
 =?iso-8859-1?Q?R9hT9ziBOKjvG3LVXlJhqYnjSo02ddm5WQdUAMNEPkBGMxUJRYwBvETTM3?=
 =?iso-8859-1?Q?gqo2JVXV1gN/6mG+ZdjrRua/GAIixoZ/oEumzF/Q+YywutGTa4HNqdjO7l?=
 =?iso-8859-1?Q?7LeUNhi4vyW+zeZLKBEbdV6IpjJ57XiUXB0l6tzvK3pstYtXgc95H5Gcq+?=
 =?iso-8859-1?Q?2Z87rlr8MbOU+qzo8xrJAIfSsrB8C2h8LBBqwQdjsrm3JxJSG5m6AbttLw?=
 =?iso-8859-1?Q?kfpoUVZx4/+AoBK0T96/G3eaBZlG7yhrqlqZVj/HusSUUwh8mtLk/kJfoY?=
 =?iso-8859-1?Q?1CYdPp84MTWw4WYJaS5s6Pl1dwhFcTPi3OPnZ6MMkcT4vbfcOjbQOFqjR5?=
 =?iso-8859-1?Q?7aaf8VpC7NPPaiRTvhtgA9T6f3t0J8qtqfw/AGZ7dzM77s1Aghb7oi1uXE?=
 =?iso-8859-1?Q?8BjftHqSVMfVLNsVkq0RD8MeVWTsO9CkUyq4MevSjAVSnHt11IHmmmmBLd?=
 =?iso-8859-1?Q?zzDoCxRGEKp7K3zqDlXkfBs49cGdUkfCcShKJtiiixFAhZsZmRqsDXHEco?=
 =?iso-8859-1?Q?Cdw4JlMu34RyQjiPguK8yV2T0awp7PnlKRprB+EQofvhDtBwcROyJVluy8?=
 =?iso-8859-1?Q?KQc1IY0+j2ugsKCLrYf5RZKgBmzBeoCP516ZPQRLXzPHH+pQ9DqGm8RAR9?=
 =?iso-8859-1?Q?vwqLz7ZAQUJPRhz+DnEe6GOfYt3X4972VgYT+wZHwc8wBzTBRoV38cJAOy?=
 =?iso-8859-1?Q?+mHyidYtiTfJ9aHN6GmK+ofRqMEXj+F3kuSNQlxhOhLhRD2mwZ4lX3/nBl?=
 =?iso-8859-1?Q?zr1z6mmB3zS2qUoHFVfAmEckQ73RP6HJrrS6tbF0GCm10MsVvza5vm/Th8?=
 =?iso-8859-1?Q?0FVF4zOriNGAK9Z3mW+1OFh8vScxmpv2lWrYuoBlCVCB4GGxgJbZmsrGqc?=
 =?iso-8859-1?Q?N9JSEn54BZNVBmkx3kQraVk0eL769AKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?orOOi6yWSygY5C3I5ER2YR2GR1rFgFmhrhlIS9c89rhUHt7sY2f/Qq6EK+?=
 =?iso-8859-1?Q?s/utCtiLY4Jvie7fWqqJk47cb1VXtNmCG9ohJnMvNn3Td75ZDk3Tl7V4L8?=
 =?iso-8859-1?Q?Z1HzquWjRMdjCcvRCpswCTqkjuHjiVP+KrTDG6zO41qbMp/9yKxiDPSRJT?=
 =?iso-8859-1?Q?Z0CE/n2/FWrzhB7gDsWww6hdu1ubx67+By7QFzpoJYfzXJArrujwNSTUAa?=
 =?iso-8859-1?Q?FyTOk10j/SZsrweXEvs8VTwiceTjin7BFVUQk4wweZLoSY+Nd2np4rvyBn?=
 =?iso-8859-1?Q?A03sPPH8jEMUMpu7/w2N7d0c8wG7xcE/zNKFBpJXUl08tCjeC1NBOLiDmo?=
 =?iso-8859-1?Q?U3qdz+vQ+fbHAlIdooSxWrSSOeu0U715fcCeSBPdb7Oe2+cDB//5NwlTG8?=
 =?iso-8859-1?Q?hfvXXpy0p70IPp7n3Es4NCtnPol72xiKxvjA/dfXBWtdlAfyKvUnA2Aot7?=
 =?iso-8859-1?Q?Xq/PnoW30QOHqoY/SzAyxxN1Kz3Gxpuxhkbd+7+p/PVyyYzdB1rMtqoifH?=
 =?iso-8859-1?Q?qo31TVZBTRDkfoDVQPO3kTCqdfinpjowPe4+OPa9QdLfsKUWnp4YcDDhxW?=
 =?iso-8859-1?Q?0961hmzZOM1hdCxgS4mrZS2vC8UmwKg+E+usXi08b8kcQ/8AWYDr8PaYqf?=
 =?iso-8859-1?Q?wF2/AJXwggrFxqh0Q+KZ1z6ARvaWvF5sTIkKk1GVnvvUec9xbWcjoT1pGS?=
 =?iso-8859-1?Q?MTbev6R33xFNHMAswe4jLazBOstMMTJ4j8hZiUcmp7wOMjRsYjv0qQjnYp?=
 =?iso-8859-1?Q?Xe+0gN2W2kYHTwfjbyzL3Tfen9TEGc19dG4SLhef5q+f88ABn42C4gKM+Q?=
 =?iso-8859-1?Q?Rax25vAJpSgH4+D2F3F0lnX7/ibmbpzwXcSEthMAq1KvlHIVq7tzbJcs7f?=
 =?iso-8859-1?Q?avsEGT/wwzuyCe3V9kR9w/fcYRsbUSJJPXO0kTmdhUadjlhQPC21o+bmet?=
 =?iso-8859-1?Q?v2yTNFZ093YUKcP0QUU+kwoq1NzBKsWbbbq2XCuXJ3bOGKcKNZBt96R+XC?=
 =?iso-8859-1?Q?V+JK0xpkEaA4UlyXb/5XQZ3gJrrPuGXA76HVvd6TB40X6uYrHFYBbRySak?=
 =?iso-8859-1?Q?OX+Lx1hFz57psxlBCPYRxK77CWikixDGp1abtQ91/pntAq17FwgY8pAeHr?=
 =?iso-8859-1?Q?T8exO3wi3hZgohBpKfcXb4pnmn26ZSQCRbA6721NEWzNiQjKnngYihw+SC?=
 =?iso-8859-1?Q?of7gzg9+QKPCD3RZ1724ni8TbYmKUZPW7kS6PIW0xe/wX0OO7nPwM709Xb?=
 =?iso-8859-1?Q?qkvpHfGqYfi5BU+Yu6AnCBqm0/uiwtqVMsnBvPC4jlo9uJdseLs+yMEMSR?=
 =?iso-8859-1?Q?jLRr4BbynVlFWMVbsKFI7O2AtcWiA9fKX7jb9K0BTi2Hpa0/SNfrfO62q+?=
 =?iso-8859-1?Q?Srxe4gNQf0QuegyIYsS/o0pcxePyBWWQwRu1mMQzRvLudbVhqCWb6bLXeu?=
 =?iso-8859-1?Q?gYhHCysvVnKevRtPlpxll0AI+fAC2l7tIwilOI5PMvqUKR9fJpOcfcc0ky?=
 =?iso-8859-1?Q?Uh3/fr19zZErxXTjVaY1UnCufJ4+0kGFI8Oor6g0EIM2yVLT59R8a+NBAn?=
 =?iso-8859-1?Q?/f/9G9a9DuU3ic2/SYOG84A76zDSb9cccxRAxdWPuOlkMINdp4QJaa8a9L?=
 =?iso-8859-1?Q?vaQHpQ5TinXnZdmzE5sSiprscYCuQU//a0JpHi/lLAhGclVIILns4sZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66709fec-3ffc-4f33-b638-08dcc3898850
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 15:37:44.6669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cwOlAGiSOtcScEY23u4xHhNCus0U+4dtG4uQQ7AlsA9JE5eoazj4tTclhhT62EemeMoUZV4IC532t55VYGLCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
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

On Fri, Aug 23, 2024 at 05:20:52PM +0200, Thomas Hellström wrote:
> On Fri, 2024-08-23 at 17:15 +0200, Thomas Hellström wrote:
> > Hi, Rodrigo.
> > 
> > On Fri, 2024-08-23 at 10:43 -0400, Rodrigo Vivi wrote:
> > > On Fri, Aug 23, 2024 at 03:59:06PM +0200, Thomas Hellström wrote:
> > > 
> > > Hi Thomas, first of all, please notice that you used the wrong
> > > address from our mailing list ;)
> > 
> > You're right. Well it's friday afternoon here...
> > 
> > > 
> > > but a few more comments below...
> > > 
> > > > For non-d3cold-capable devices we'd like to be able to wake up
> > > > the
> > > > device from reclaim. In particular, for Lunar Lake we'd like to
> > > > be
> > > > able to blit CCS metadata to system at shrink time; at least from
> > > > kswapd where it's reasonable OK to wait for rpm resume and a
> > > > preceding rpm suspend.
> > > > 
> > > > Therefore use a separate lockdep map for such devices and prime
> > > > it
> > > > reclaim-tainted.
> > > 
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > 
> > > > 
> > > > Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
> > > > Signed-off-by: Thomas Hellström
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pm.c | 45 +++++++++++++++++++++++++++++++-
> > > > --
> > > > ----
> > > >  1 file changed, 37 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > > > b/drivers/gpu/drm/xe/xe_pm.c
> > > > index 9f3c14fd9f33..2e9fdb5da8bb 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -70,11 +70,29 @@
> > > >   */
> > > >  
> > > >  #ifdef CONFIG_LOCKDEP
> > > > -static struct lockdep_map xe_pm_runtime_lockdep_map = {
> > > > -	.name = "xe_pm_runtime_lockdep_map"
> > > > +static struct lockdep_map xe_pm_runtime_d3cold_map = {
> > > > +	.name = "xe_rpm_d3cold_map"
> > > > +};
> > > > +
> > > > +static struct lockdep_map xe_pm_runtime_nod3cold_map = {
> > > > +	.name = "xe_rpm_nod3cold_map"
> > > >  };
> > > >  #endif
> > > >  
> > > > +static void xe_pm_runtime_acquire(const struct xe_device *xe)
> > > 
> > > I believe this should have a different name.
> > > runtime_acquire and runtime_release sounds like runtime_get and
> > > runtime_put...
> > > 
> > > since it is static perhaps we should only call it
> > > xe_rpm_lockmap_acquire
> > > and xe_rpm_lockmap_release
> > 
> > Sure, I'll fix
> > 
> > > 
> > > or
> > > d3_lockmap_acquire
> > > d3_lockmap_release ?
> > > 
> > > or something like that...
> > > 
> > > > +{
> > > > +	lock_map_acquire(xe->d3cold.capable ?
> > > > +			 &xe_pm_runtime_d3cold_map :
> > > > +			 &xe_pm_runtime_nod3cold_map);
> > > > +}
> > > > +
> > > > +static void xe_pm_runtime_release(const struct xe_device *xe)
> > > > +{
> > > > +	lock_map_release(xe->d3cold.capable ?
> > > > +			 &xe_pm_runtime_d3cold_map :
> > > > +			 &xe_pm_runtime_nod3cold_map);
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0-
> > > > > S2idle
> > > >   * @xe: xe device instance
> > > > @@ -354,7 +372,7 @@ int xe_pm_runtime_suspend(struct xe_device
> > > > *xe)
> > > >  	 * annotation here and in xe_pm_runtime_get() lockdep
> > > > will
> > > > see
> > > >  	 * the potential lock inversion and give us a nice
> > > > splat.
> > > >  	 */
> > > > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > > > +	xe_pm_runtime_acquire(xe);
> > > >  
> > > >  	/*
> > > >  	 * Applying lock for entire list op as xe_ttm_bo_destroy
> > > > and xe_bo_move_notify
> > > > @@ -386,7 +404,7 @@ int xe_pm_runtime_suspend(struct xe_device
> > > > *xe)
> > > >  out:
> > > >  	if (err)
> > > >  		xe_display_pm_resume(xe, true);
> > > > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > > +	xe_pm_runtime_release(xe);
> > > >  	xe_pm_write_callback_task(xe, NULL);
> > > >  	return err;
> > > >  }
> > > > @@ -407,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device
> > > > *xe)
> > > >  	/* Disable access_ongoing asserts and prevent recursive
> > > > pm
> > > > calls */
> > > >  	xe_pm_write_callback_task(xe, current);
> > > >  
> > > > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > > > +	xe_pm_runtime_acquire(xe);
> > > >  
> > > >  	if (xe->d3cold.allowed) {
> > > >  		err = xe_pcode_ready(xe, true);
> > > > @@ -437,7 +455,7 @@ int xe_pm_runtime_resume(struct xe_device
> > > > *xe)
> > > >  			goto out;
> > > >  	}
> > > >  out:
> > > > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > > +	xe_pm_runtime_release(xe);
> > > >  	xe_pm_write_callback_task(xe, NULL);
> > > >  	return err;
> > > >  }
> > > > @@ -458,8 +476,19 @@ int xe_pm_runtime_resume(struct xe_device
> > > > *xe)
> > > >   */
> > > >  static void pm_runtime_lockdep_prime(void)
> > > >  {
> > > > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > > > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > > +	struct dma_resv lockdep_resv;
> > > > +
> > > > +	dma_resv_init(&lockdep_resv);
> > > > +	lock_map_acquire(&xe_pm_runtime_d3cold_map);
> > > > +	/* D3Cold takes the dma_resv locks to evict bos */
> > > > +	dma_resv_lock(&lockdep_resv, NULL);
> > > > +	fs_reclaim_acquire(GFP_KERNEL);
> > > > +	/* Shrinkers like to wake up the device under reclaim.
> > > > */
> > > > +	lock_map_acquire(&xe_pm_runtime_nod3cold_map);
> > > > +	lock_map_release(&xe_pm_runtime_nod3cold_map);
> > > > +	fs_reclaim_release(GFP_KERNEL);
> > > > +	dma_resv_unlock(&lockdep_resv);
> > > > +	lock_map_release(&xe_pm_runtime_d3cold_map);
> > > 
> > > do we really need this entire sequence? or checking for d3capable
> > > here could have 2 different smaller sequences?
> > 
> > Hm. I forgot to check when this function was called. I was assuming
> > it
> > was called only once per driver instance and in that case we need it
> > all since we can have multiple devices with different capabilities,
> > but
> > it seems to be called on each runtime_get(). Is that intentional?
> 
> Otherwise I'd like to change that to be called at module init?

Probably my mistake when refactoring it. I believe it makes sense to
move that to the init function and then keep as it is now here.

> 
> /Thomas
> 
> 
> 
> > 
> > /Thomas
> > 
> > 
> > > 
> > > >  }
> > > >  
> > > >  /**
> > > > -- 
> > > > 2.44.0
> > > > 
> > 
> 
