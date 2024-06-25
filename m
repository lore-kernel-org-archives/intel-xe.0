Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DA4C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 17:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CC710E6EC;
	Tue, 25 Jun 2024 17:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDqDsSUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9854210E6EC
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719335875; x=1750871875;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rqOfb4xfHZkSRASAjdWaH+ZDj8YbOxiA3nI24DRpDr4=;
 b=eDqDsSUPvtfE45b7W9H5tZsL1snItjxpqIyvJ6l5WDnHBaTUX4uFnN0F
 x2zpgWdUgvpslQ2KrIsIZ45avzYZnqnSHHFsE6ShB3+AvVxhWcpMoAQnk
 0ur+9unO03aHxfTZRx9Zf5X56S3KeWstqI5e38JlddVMzrdrtTjkHJoRO
 5VtQfh/QLZPEx01Y4In/XOEINDIv4bIEF6ZX10PeAHJMxQLu4KTmHc9SF
 yBDIuwSrXIXd4O/3rCMJ3Hqs31jzDm8+LO8dbZMhAh4rLNG/b+N+FeFse
 ia43jF/B1Uox38NgnzleemYiiStZOFAVW0snC3ub5ZpxKMdC011rI1iHf w==;
X-CSE-ConnectionGUID: eqnZdiBCSN6iLmmx1PAPVw==
X-CSE-MsgGUID: 7vA3R5tASFaHcF25PmKXnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20181786"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20181786"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:17:55 -0700
X-CSE-ConnectionGUID: E/VTtBFoT0a0AsUweewFkw==
X-CSE-MsgGUID: zHuGX6UxTJmGpNzmwIIhuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43527999"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 10:17:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 10:17:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 10:17:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 10:17:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 10:17:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edoZw956KiU51noZypLLoF6/sIVDNDwxOfkC1nLylE81d6O82/GaGjGaxtATzYvEeqjYGWPb2ln/Ulp4DrqE/hkRBbau8lx0jRvWoSfBadWpGpEYsnA/qIVXlgDEjp249Ak2t/qYzXlfwJvbBNEo2JSlz31s82uAbTJMago4XDu9OBoqAZrEDcqV4ojBE0swadX1whGBjv5m0j/rZnT0MnsQLisHxaNhJE/HVbHm3NGYKXQzHMpHbUHZ0onZEMkZXWJVDBgTj98kjR90NQz3MW6w0uUjM0+YnmiyLDqFviojOr9RiIhIl0aAmSFlTmueHNAgRdWasBdTXTtbIgyxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqOfb4xfHZkSRASAjdWaH+ZDj8YbOxiA3nI24DRpDr4=;
 b=OMgeG3/73EY0vTn++AqZ594whxUZGFX7CWtDSMJ1joHXHjOvr8ImBrgfzxViaBrg54XVkAFIXUuLa79y27PRSedZ1+tN6ru0P7MOMOqUetyRswN5yO5YJOIR9P+xyhlMcYfooUi1wlETRAJGCLo+SfasOTYqnWCISg5IhC3Odh2OUMNhloKFrVuXERyxr+A9XOSMZKuQ9XESfVTis4g783W8pf7tOPv0LYLRLpTjJfsVhcY94OZqerGedPBKqd16rsQv5Bk1APS3KohRbXaIoEPS6wnmhX/bMCsnRrPtTpp5dxMaR0HsnOOzZlvOCY5hvYpWVxhf/e+oSRP5hpjbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN6PR11MB8194.namprd11.prod.outlook.com (2603:10b6:208:477::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Tue, 25 Jun
 2024 17:17:52 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 17:17:52 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Fix missing workqueue destroy in
 xe_gt_pagefault
Thread-Topic: [PATCH 1/2] drm/xe: Fix missing workqueue destroy in
 xe_gt_pagefault
Thread-Index: AQHau3V2ANNnzPhbDkS3iFTlE3NXDrHBlnoAgBc50QA=
Date: Tue, 25 Jun 2024 17:17:52 +0000
Message-ID: <a0d34966f975d068178fef60ee92a047aac823b4.camel@intel.com>
References: <20240610203300.182615-1-stuart.summers@intel.com>
 <ZmeACI6X3zEaepaz@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZmeACI6X3zEaepaz@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN6PR11MB8194:EE_
x-ms-office365-filtering-correlation-id: 2da76293-36ab-41c1-2383-08dc953abed7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230038|1800799022|366014|376012|38070700016;
x-microsoft-antispam-message-info: =?utf-8?B?MWRDd0x2dEYvQ2JMSzBBZU0yYlBwZ2ZhTVZsSmltVUtpcDAwVlp2WGtIK09M?=
 =?utf-8?B?KzU3REJlZ3lmeXhGNTRDVTlxK1NzQUlQc0pHQk5kbVUwa2RGUWhXSTR0RnAw?=
 =?utf-8?B?SkFxT0lWZi9WSTRZQzZ4VlJWZEl5MVYwejYvRTFObExpamJUTmhsMng2NVNM?=
 =?utf-8?B?T3U1d24wc1U0QlVUU3RSTEV4UitiWWVNYzVkT1B0SndKMktnVkhnL1ptYUhm?=
 =?utf-8?B?d1pTQlFMaEMzZy9BV1Nac2RiSFdxOEo5Y2VjaExWd21SNXV5YTlyMjhWRzBk?=
 =?utf-8?B?ejZPaG5wR2dBek9kT1VIbGVVeWIrdFRQSnN0N1Z4UTY1NWhPWGNuYmphU0Jy?=
 =?utf-8?B?UVhGRzJnZHpqS0Q4MGxzZ3hMcnFUQy9DOTk0djI3ZXVERXdtdmF6N1YxZ1A3?=
 =?utf-8?B?M240UmNFU3JFalJJUlBYRFg5OWZ1ZUhhNVBTdk5lRjQreWY1RlFWclpjL0Rk?=
 =?utf-8?B?RHVJOVZzTlRYZW9YS1BhenppN0xxZlFWcWM2QjVEd3VmaEUvRThWSFIycFFG?=
 =?utf-8?B?YVFvWkNyVWhDVkFXdHJOdkphMnc1Vmg2S0Vudm1HNmpoWXVNeUc2cW9XblVs?=
 =?utf-8?B?M1RoVEorMXBSSTFUQXVTK3dyS3hhZXVBYlk3Umw1WU15YzhJdzBJelRHbTNk?=
 =?utf-8?B?QWdyb0htUlBQN1BCUlVjSkVUb1NkYklXSkRESmhjeU5ZYjc2VmxVVWJtaFFi?=
 =?utf-8?B?MU14S0dGdy9Sa0g5SEVTK0hrTVpSVE1Tem1ycTJZQW40WWZCcVdXSTVoa0Jl?=
 =?utf-8?B?UEtnVXk5WkMwZEdUZ01aOFNlZVBqRHo4T0VrVW0wV3QvcWtMMytxR1laUWJ0?=
 =?utf-8?B?NUpTSjhJWmdlZVAzOEd1SjJPQlliaXNIZVdqaWxKQWN3cXFSTkgzSkpFMita?=
 =?utf-8?B?d1VaRzh5cTJQNHdyaktUdnp4MVVsMTF0bm5Rd1JwcENjSy9rU2svTlovNFNG?=
 =?utf-8?B?VVNBY0V5cEw2K1h0UU8xdG54aDkza2VVUkdZUDZuYzhtY1NLeXlaMWFIbjlr?=
 =?utf-8?B?L2VnNSt3aVNHRFlDR2U4SzRybEkrOHBJNVI1ZkdPcTlYN1cwS2JrcXdKaks4?=
 =?utf-8?B?YUhiUXI0QzhDSlQvbUFRYVFzd3hOaktwQjAva25RZ0VjUERSblphbjRYc1lQ?=
 =?utf-8?B?aGVmaXZmRTJlRTBiZGRYRnFpRnZ2YkVEOFA2anNXaC9vVVorSWRnd0hIQyt4?=
 =?utf-8?B?c2U2L1cxSFV1WTRhOS9McTc3dS9IaUJjL2NhV2t5cWl2bkRWSldxRWNFd3Ji?=
 =?utf-8?B?SkJ5c1dDMkFDVEkwUWdUcXpxMmJRdE9ZQ0FKU0RuSnU2alpkOWtqY2NFcUZX?=
 =?utf-8?B?Y2lUMnNhTmZlYWZ4QmNrTG9tN3FrakJOd3k0UGd0MkpoSzU3LzdyRlRkbXBo?=
 =?utf-8?B?ZUxqekJrQXFJQW5vcmlzdmdUQUpKaXlKWEUyL285R0VKT0l5N3k5Tjl0Qk5o?=
 =?utf-8?B?eGRRTUpJUG8rbm93TmJWZ0d5c3Voeklid3NqYjlkVVo2SlJCWUg3R2c1b3hn?=
 =?utf-8?B?OVJaSkx1MEF3SDJhcXZWa0cxVUpSY1V2bGczaVE1TkRNc0RTd2s1MnFwL2pr?=
 =?utf-8?B?VElGdUwxK2dmMFE2STJORHd5K0V2MnVTNisxdWM2ZVNIaklwWkVQK3pHSEIx?=
 =?utf-8?B?Uk01dDR0cjhmaGxqSnZqK0Z3SDY3enNDK3lwWlFlcVdNNzc0NWI1Z1Roa1lh?=
 =?utf-8?B?YkROZk1jRzFodE9xc3RrOWVyUWgzclA2bktmY0dFNXBmN1VZS0dXcDRrMXlP?=
 =?utf-8?Q?KCsRGvVDi0l3n4Ao5KNRCMbxSpjTvC76UX3cjSB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012)(38070700016); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTVnRlpWU1VCaFM4cGRycWllRWhrQXp0TWRjRlMvRWQ0RUZaQ21WbDFhQnlo?=
 =?utf-8?B?RmRHYTI3aTdQS3puRWhMREZiVm1rb1QyV3dnRDhQaEVsTVF2RnN6UHc2M1JV?=
 =?utf-8?B?c0NjZDRwWEUwYTF5R2pYR3lEcUszUEhMcHRWeFVRejdqZ3NFZmZuZHNnM3Jh?=
 =?utf-8?B?bVRBSUY0TWo2aUc0ekVCRHZBTHUyd3E1RnZSOUJ6dnVuVzlhemNMdEVHbHY0?=
 =?utf-8?B?cklkSjFmbTN4ZVlScE1jQmduRmVsUEo1bVdrbnpaYTlzSE1ZbmxjWVZlbVFE?=
 =?utf-8?B?Q1dSeWhQbWR2NlkraVUyNTRubHNTV3BDY0FtQ2VFbjJFQlYwL3RZU3lHWUFB?=
 =?utf-8?B?ZERFeEs1YkFsVVhXNWhFd1lKZlIrdmxUdFlKUG5kT2FpY3FxdkIrbldBeGZi?=
 =?utf-8?B?b3BseUQ0Yks5TFNYd3F4YS84L093SUJyemN0OWVrQklwdXA1YnBUK20yVjh0?=
 =?utf-8?B?aGpJU3NCTXd3MVNKcFM3dDI4RU9KZ3gxZnIwRktBZHRMVEdlRXFLK01EdVc4?=
 =?utf-8?B?ZklBQm4vb0t5cGgwaDJYbTkyZXBjVUd2QUR3Mzk1cWs2dEhuaTNkZU9UTGxp?=
 =?utf-8?B?SytBSEtlSk04Q1ZwYWpmUFpIaDR2WGZ6NkdOZU80NXVVSU1FU2VHRDdGSmJX?=
 =?utf-8?B?QUxXamJ6UjNQVi9XbXU4WVVFS0VnaVpBN3NCRHd2cExsSDdzM1plYUxsU01x?=
 =?utf-8?B?UkNkL0o0c0hUWlNTWTh6NzhFS0tFRzZONkdHU1Z4SjdHUzhjMzhaMHdUcWow?=
 =?utf-8?B?YmYweVMydmhqN2R0MmRsaEwybnRZZ2sxZHh0UjFGZ0NxWEV3VVBKQzJaeHlH?=
 =?utf-8?B?aE9XQitYZzBGQXRHcFo2K24raGdhaWsxWGl0Ly9xN285MDVIU09qUEFQWnNL?=
 =?utf-8?B?NVg4Qk16UGVHMER4Vlp6UlV6V0hLcXoxaGVNcGt6eDhGbVRNbXFXZThRaS9j?=
 =?utf-8?B?QmdiVVl6bWJOb3k4c0w0WVZ5M29XZW9DYkI0TzJXYkZ3aWl4eEtuY1dPclJL?=
 =?utf-8?B?NU1KTzJveUp0cGRCOEhOeWxJZGpvS3drRi9OWDVDMEFFOWJVV1VZZ0RPTDg4?=
 =?utf-8?B?MjQ1aHpNdk1Vek0vSVM5c1Q3QjFBWkJLL1hYR1ZtQWRYZ1BHakZPL3c0a2xP?=
 =?utf-8?B?RDdrTDhGOHZYM2tCek4zYUo3YlFsOUdSN05oNUIvUC9lcEZ1Wmpmam4xc3Ja?=
 =?utf-8?B?bWtlcVdlZ1E5ekFYMW4xKzR6RXZKdmY2Q0JpeGwweXAxM3ozMUZWdkF1K0Vi?=
 =?utf-8?B?QURiTU1VMkgvaGJMdkQ3MDdZRzNGV29yRFNXQkQzT25HOFdoSFVYOGdQaUx6?=
 =?utf-8?B?b2psc0N4cEppdTZCWlZ6VnNyTEtnSUQybVF6YTd4RGRuRExQNVkyS1lBWVRL?=
 =?utf-8?B?cTNNUDZTUFJNTTZGYjU2TGFZL0IxUHNaZzBsRXA1VVMvZTE0clBSemtjUnl0?=
 =?utf-8?B?b1ROSmJQd0NZTTR5OU5Hc1hqcVFGS2Q5b2pjQjZGK0dBWHZFL05ncmJNZURi?=
 =?utf-8?B?ZGtYREJVd0ducUgvd2xIUkdRWXluNEVOWjNBdDBxZXhXVEtGM3hOWXN0YW50?=
 =?utf-8?B?bDJ4cVZzOWZKLzdxTDVvT3VyOHZYMGt4WDVwU3k4bVQ0TFpKRTd3STcwdVBP?=
 =?utf-8?B?MitTRzczQ1RIZ1pkUExyOWR2Ti8xbXZpS3p3WmhLNlIvejR3cERVTGtJdGth?=
 =?utf-8?B?U0JxMkVxRUVKNmVZUWtSYWsrOTNub2U0ZndObGdPUXdQMk8rU1hZQUxNcTBw?=
 =?utf-8?B?T25IUTFrVVNRWW9jRmxzemZUYzVkRWVnaE54Y1A4am1sbGNtUHo2MnpaTnZ4?=
 =?utf-8?B?dnpBVGYxOEFoOVU1Q3F3bmV0aC9jc1dqbko5VDVES1BVNTdPNVcxWUp6ZE5u?=
 =?utf-8?B?cVlmMDZzL3RVM3VqK212a2RZT1g1bjNmbGpYczVSQ3UyNmNkYkM0YzNOQXVu?=
 =?utf-8?B?UXdjdWNpZjQvL2M3eVFtZzF6SVo5d2RtRXhmWjFMdnJUT3BCM1BSelBrcFNr?=
 =?utf-8?B?UWg2V1BLNVF5V1RVekFEYlYvUlZQVzNVTnh5Vkk2a2JKbzZlSHVhclduT014?=
 =?utf-8?B?NmtGNGY2Rnk5U1FVeWY5Tk9JRXdzTVF2Vm5nUjF0Z21HWWlhUG5LZ3BPdmo2?=
 =?utf-8?B?Um11S2Vhd1YyUVk2T2Jna0FsYUJMSEN4VnhwdUt4NGFiUy9kVWVtUDcyZHcx?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF7FE6AB8944D843B62D66D09BAAC733@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da76293-36ab-41c1-2383-08dc953abed7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 17:17:52.1578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ttG4mXqbMxsK6MHIkUOVxQj05G98AHyIniG1Ua0EpQLAk59Gf80XlTV/ov68YtzlRavn/0m3PIlaJWCpYIBrA3c25WYyuJGtOuueDl4F9GY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8194
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

T24gTW9uLCAyMDI0LTA2LTEwIGF0IDIyOjM2ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBNb24sIEp1biAxMCwgMjAyNCBhdCAwODozMjo1OVBNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBPbiBkcml2ZXIgcmVsb2FkIHdlIG5ldmVyIGZyZWUgdXAgdGhlIG1lbW9y
eSBmb3IgdGhlIHBhZ2VmYXVsdCBhbmQNCj4gPiBhY2Nlc3MgY291bnRlciB3b3JrcXVldWVzLiBB
ZGQgdGhvc2UgZGVzdHJveSBjYWxscyBoZXJlLg0KPiA+IA0KPiANCj4gVGhlc2UgcXVldWUgbG9u
ZyB0ZXJtIHNob3VsZCBiZSBtb3ZlZCB0byB0aGUgeGUgZGV2aWNlIGFzIHRoZXkgYXJlDQo+IGlu
ZGV4ZWQgcGVyIFZNIGFuZCBiZSBhbiBhcnJheSBvZiBvcmRlcmVkX3dxLiBTb21ldGhpbmcgbGlr
ZSBbMV0uIE5vdA0KPiBzdXJlIGlmIGl0IHdvcnRoIGhvbGRpbmcgdXAgdGhpcyBwYXRjaCB0aG91
Z2guDQo+IA0KPiBbMV0NCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21icm9zdC94
ZS1rZXJuZWwtZHJpdmVyLXN2bS1wb3N0Ly0vY29tbWl0L2U5ZmQyMzNhNWFiNGRiNTQxMDQ5NzBj
ZDhkN2MwZTkyYTM2ZjUyMjANCj4gDQo+ID4gRml4ZXM6IGRkMDhlYmY2YzM1MiAoImRybS94ZTog
SW50cm9kdWNlIGEgbmV3IERSTSBkcml2ZXIgZm9yIEludGVsDQo+ID4gR1BVcyIpDQo+ID4gU2ln
bmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4g
PiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDIgKysNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYyB8
IDExICsrKysrKysrKysrDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0
LmggfMKgIDEgKw0KPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+ID4g
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+IGluZGV4IDU3ZDg0NzUxZTE2MC4uNjhkYzY5MjAx
MTJiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiBAQCAtMTA3LDYgKzEwNyw4IEBAIHZv
aWQgeGVfZ3RfcmVtb3ZlKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gwqANCj4gPiDCoMKgwqDCoMKg
wqDCoMKgeGVfdWNfcmVtb3ZlKCZndC0+dWMpOw0KPiA+IMKgDQo+ID4gK8KgwqDCoMKgwqDCoMKg
eGVfZ3RfcGFnZWZhdWx0X2ZpbmkoZ3QpOw0KPiA+ICsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgZm9y
IChpID0gMDsgaSA8IFhFX0VOR0lORV9DTEFTU19NQVg7ICsraSkNCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHhlX2h3X2ZlbmNlX2lycV9maW5pc2goJmd0LT5mZW5jZV9pcnFb
aV0pOw0KPiA+IMKgfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
cGFnZWZhdWx0LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYw0K
PiA+IGluZGV4IGVhZjY4ZjAxMzVjMS4uMzg1OGM4ZTBiNzA3IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYw0KPiA+IEBAIC00MTUsNiArNDE1LDE3IEBAIGludCB4
ZV9ndF9wYWdlZmF1bHRfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+IMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gMDsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+ICt2b2lkIHhlX2d0X3BhZ2VmYXVsdF9m
aW5pKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+IA0KPiANCj4gVXNlIGRybW1fYWRkX2FjdGlvbl9vcl9y
ZXNldCByYXRoZXIgdGhhbiBleHBvcnRpbmcgYSBmaW5pIGZ1bmN0aW9uLg0KDQpKdXN0IGdldHRp
bmcgYmFjayBmcm9tIHNpY2sgbGVhdmUuIFNvcnJ5IGZvciB0aGUgZGVsYXkgZ2V0dGluZyBiYWNr
IQ0KDQpZZXMgbWFrZXMgc2Vuc2UuIEknbGwgbG9vayBhdCB0aGF0IGZvciB0aGUgbmV4dCB2ZXJz
aW9uLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gTWF0dA0KPiANCj4gPiArew0KPiA+ICvC
oMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3QpOw0KPiA+ICsN
Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIXhlLT5pbmZvLmhhc191c20pDQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKg
ZGVzdHJveV93b3JrcXVldWUoZ3QtPnVzbS5hY2Nfd3EpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGRl
c3Ryb3lfd29ya3F1ZXVlKGd0LT51c20ucGZfd3EpOw0KPiA+ICt9DQo+ID4gKw0KPiA+IMKgdm9p
ZCB4ZV9ndF9wYWdlZmF1bHRfcmVzZXQoc3RydWN0IHhlX2d0ICpndCkNCj4gPiDCoHsNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuaA0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5oDQo+ID4gaW5kZXggODM5YzA2NWE1
ZTRjLi5kMzdiNzkwY2U4YmIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X3BhZ2VmYXVsdC5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2Vm
YXVsdC5oDQo+ID4gQEAgLTEyLDYgKzEyLDcgQEAgc3RydWN0IHhlX2d0Ow0KPiA+IMKgc3RydWN0
IHhlX2d1YzsNCj4gPiDCoA0KPiA+IMKgaW50IHhlX2d0X3BhZ2VmYXVsdF9pbml0KHN0cnVjdCB4
ZV9ndCAqZ3QpOw0KPiA+ICt2b2lkIHhlX2d0X3BhZ2VmYXVsdF9maW5pKHN0cnVjdCB4ZV9ndCAq
Z3QpOw0KPiA+IMKgdm9pZCB4ZV9ndF9wYWdlZmF1bHRfcmVzZXQoc3RydWN0IHhlX2d0ICpndCk7
DQo+ID4gwqBpbnQgeGVfZ3VjX3BhZ2VmYXVsdF9oYW5kbGVyKHN0cnVjdCB4ZV9ndWMgKmd1Yywg
dTMyICptc2csIHUzMg0KPiA+IGxlbik7DQo+ID4gwqBpbnQgeGVfZ3VjX2FjY2Vzc19jb3VudGVy
X25vdGlmeV9oYW5kbGVyKHN0cnVjdCB4ZV9ndWMgKmd1YywgdTMyDQo+ID4gKm1zZywgdTMyIGxl
bik7DQo+ID4gLS0gDQo+ID4gMi4zNC4xDQo+ID4gDQoNCg==
