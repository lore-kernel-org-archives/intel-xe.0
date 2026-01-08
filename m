Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1822DD1D48A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 20:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19BE10E7C7;
	Thu,  8 Jan 2026 20:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3Xkrjan";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE5D10E7C7
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 20:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767904454; x=1799440454;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1rtXkSTpzykIajYv41hgd0rUbifxB4EqeySx+cnKWT8=;
 b=Z3Xkrjan2QvXGUhzxsKBP1Ke13T+CCKf8mEI5kr9hWaUanH7C2x1bZoO
 4dFFwC3OFKHfznhRZl9ofEyZcgHhzbmm7qrxUT6gwnUu1n1EEhk9HGhl2
 JgKbF3FCEpjgIIwp54cg8KrHwmtBkW3pLIrr2EJE5MBSSjg2kNktiIvR3
 gnoNkDG5LcIKxCyrZKNaQ8oTO7fZEpse4KQdsRI8swODnjBPgYAP2dN1M
 MkACVzTi4wkWSUqMTjTk/twLL118+sbJumCYf9MDMyv0yEccBizZzPGTo
 vghVY36qfADpyadP3gdKkv9xp1o4JT+XwbRZ5z1QbFrB/JX0emCqh/Abu Q==;
X-CSE-ConnectionGUID: yFnrct7cSCiMv70IpUqUaw==
X-CSE-MsgGUID: b9yyIppDSxmaG3Scx1U4BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69204079"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69204079"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 12:34:14 -0800
X-CSE-ConnectionGUID: YypAfl8kSyS11a7BnuBnlg==
X-CSE-MsgGUID: 1q2nBW2LQuui46slX3MkjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="204151171"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 12:34:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 12:34:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 12:34:13 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 12:34:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILx57ERZBUl1VWEh8XqH/yT+4wQVzTU7ok1jLmZWXlPrDPoso6Myj+gJWf8UO6bqrmATD6kEWggOJHPdChD56juLnPHarEfBCKEf/S8eYEpmAsqdAj0DDf08/fUbbraxInBzL3JOpFafr1jUXj6SP5iNsiWezKy1MwyBrrpQ7g5x+w/x8OrDyB98EHUO/upOmew+Mvp3P3BFBzEzXPjijPHv4eH9gOchb2Lwhq1gkGR3vzCGPIdgNB5QNH4ErGIyijRgvX6ZceCJDHGcrNERECbg1VxtV0MR7216V4CpDpHsuhb53G4hIN3ckLpp4yh5e6UOVNRFYbeMZyUgvziwDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+LA/xCVNTLmzDDyFfKlgcZKpOhpb9uZ131JwTk5oRM=;
 b=d4LWd5zwS2+TV9ykmPybC4qYObgtKbu14dpU57yM8fM6LR7G0mvD25CDRswvM6itHKv76Y04Y04zPfVOs277Aa6c3iSPifkNktPwhhHIKTTjEEkVnsFEquNae+5pYJZ9FkwTFESpkANIxEAImaNkUXAXEffRj0a3IPuJY71TRnbS1pFd0kA2ETodvtyJIhz4+ITCzt0ZEuis+wNyemh8AkSmk7baba9hH0h8+Wa2H2JjW/p80AlzdEtDwI5rwamypXJ9mq6OXERcyIaJGYWG5kj0uGSAIdwXMUNfYLE0t+TCt82hKWkExc/u/H4uc7cBvhJ3ZlJR1OtdWHDlq2qOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7194.namprd11.prod.outlook.com (2603:10b6:930:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 20:34:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 20:34:09 +0000
Date: Thu, 8 Jan 2026 15:34:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "dev@lankhorst.se" <dev@lankhorst.se>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Poosa,
 Karthik" <karthik.poosa@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/pm: Handle GT resume failure
Message-ID: <aWAUvRxduVe9AMhD@intel.com>
References: <20251220073657.166810-1-raag.jadav@intel.com>
 <1424d50e95dd5410a9e91527383fa9c8f1182298.camel@intel.com>
 <aV-a6ev2jb5VBoi-@black.igk.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aV-a6ev2jb5VBoi-@black.igk.intel.com>
X-ClientProxiedBy: BY3PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:a03:255::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 793797c3-c25f-4b51-0b63-08de4ef546c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6VLdMW+/xnn4KKQgiBlsabivPXci2eF/KVQ012NbufIkCN+wN9/wm5bJ2Y?=
 =?iso-8859-1?Q?B4klWimWIeJnsVwia8uoYujmMAX+Qg6zhR+QBDBygeeGL/hBlV0YyDjalx?=
 =?iso-8859-1?Q?LJj0YRnErp5NcXe/VHNl4Lj/eikh4ph3bP0tKIMSj8gVAZdKjTLiNvrGgK?=
 =?iso-8859-1?Q?2vcRAKAJNLabnVAH1Hd10Jn0KLGjdC/b08XXr76ajZx7lwPedl42ztwf9B?=
 =?iso-8859-1?Q?uCbg6+uu2ydKc9ofvZdvzUtCbXhqT8XpSf5Z+07/+icXIlczD59qa90Zqa?=
 =?iso-8859-1?Q?FpRYDKOqsdRfg2aXTIYHYqGHLbkme5liLbrw8k3Hz+IV9jP6dTqbZ0ehUb?=
 =?iso-8859-1?Q?wjWRIRz68BhfgaOqzRpYZylGjCqiTQPmEPVq9W4ospx9OCxVDuU2t3rkos?=
 =?iso-8859-1?Q?35WKF8yw4zKZzP/Llz1rVSSDFT+pc2cPOGJOCyps2X8mejf1d0Nf8u9bVm?=
 =?iso-8859-1?Q?5HJFmdOoNe5Sumo8I2Mdqblv0NHZyxJKfCQx8mxwZSi7MT6pUZ7cH24C7R?=
 =?iso-8859-1?Q?MIB24fKClDzfn146fdqsVYAo3iQNjgXHgJ0Diw+3stAajLw+REUrVfibXz?=
 =?iso-8859-1?Q?xtiXSxSEYhtK87aQiZjm05MV2rYxbjkwRoGgIawLNTujMcDfOx8z1+W/Op?=
 =?iso-8859-1?Q?feZmUTa+usUJL4qhidiEvlqF0qha+uFZX2Q+K6OGNOBX/x2x0mBP5xjtSz?=
 =?iso-8859-1?Q?eFX++vvQ1BiE9edG9m1yA6doK/qd0nbYbCr6awIya5JQNbpasbVAXRixkH?=
 =?iso-8859-1?Q?4hboomTDvOjPE9NenDc1MtdAt22ZduqkQNUgM+6vlnjawlf22JDUUzpzEV?=
 =?iso-8859-1?Q?MRtSrRQqqGyLRmokKdt/V7M5uRxZ49+cb1LIpLA08SO2/054mzzi9nrRlA?=
 =?iso-8859-1?Q?vHSJmyu0FkPMVMlsUjhAO2wUNzE8Pi6Y8tmDPEM49j2aFFSSWJv3sz0i+3?=
 =?iso-8859-1?Q?f7uCcp8mqX7TgewnYRI58klKQ0Kp+QFtK3LNsWHjVc+CQW6WtrcLaY29E6?=
 =?iso-8859-1?Q?fUYlQfbG1tVgWxCJLA+uMd/pUd/YOyCFidF7yuGl2h2Y/Mc8Ytn6nSvJ2F?=
 =?iso-8859-1?Q?RxlBfgT1v+z4hMQVPz+TjMo5qmV1weAF1TYmdt0gVql1/w44+NoNgmlNDd?=
 =?iso-8859-1?Q?F32mkdWI8h06D58t+GiQ5BxYkuer5xc+4/U1wwu51TXApDK5tKKfd2nhsG?=
 =?iso-8859-1?Q?JYVDTfgNgmqoHIZz7nUcMxsG+HBJy9YJRD4Ho8LHrcxRk4TcEGZPpSmcyw?=
 =?iso-8859-1?Q?VhnXVY1I6eRQztn9ttMLeLhLjl6ivpJOEn7xF6o4ustTK7FOrXqmlhDpFB?=
 =?iso-8859-1?Q?CUUx6CPFv8Lpt+Dlr+CBqYsfdn7Kwapw7SWm+WdLnoal/LIuCxdKxQU8bb?=
 =?iso-8859-1?Q?s8WQNBHi+CCFjf9kWk0fuJKmoHHSVu9GT/W2e6u8j+HrpsVkNs7QN8bIBv?=
 =?iso-8859-1?Q?1JlmQLgt2qriJw03HBB6yEaHUAqnR4+Qidu9cVp1CY0o1c775TsXwKi6mm?=
 =?iso-8859-1?Q?qz+NfLkg/hGAyLZ32K56Xq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4sFu5yO84yju4vafQgQdU1oDLR2YbK1tTIwhulMkegIYgveR5TLOSJoE5/?=
 =?iso-8859-1?Q?0OWvpmMv4np9s/lKGG74nGlYuDPELwXEpyojdii0lMjVeN7RskYzOBuoAN?=
 =?iso-8859-1?Q?aBdXMh2ETX8DN7743zj8+3Y8rEqDG16uE03woZjstfpMQ/qqX+Eoy0Gpib?=
 =?iso-8859-1?Q?npqgoNmiqh6UrkWUI+bcVzfrab6XqLpXZY1xZZSojzgf0uXlpomjhtIO64?=
 =?iso-8859-1?Q?oqNyy4sh8P5FO05TYfvGoSWji6Ye7VX0SzW7wXgRFkqiqptjVbfV7Ri7bY?=
 =?iso-8859-1?Q?bz8MRPBLGalniILEDNFFfeHvOAbxVDvS/eOtA8Rt79K7yfTfwgIGqxosri?=
 =?iso-8859-1?Q?q/x+7gsLhpPNF2e9Ao+tTXxanNjljIywTomKa22JDdWHJDLksRS5S9coe+?=
 =?iso-8859-1?Q?FDehsHFM3yPNsiD4PgfLpeLVK1iudYEEy7UWsJccSG6BG85hT5EaFCsYI0?=
 =?iso-8859-1?Q?QD1ML2s4qlKxdmO99NVuFrIau83h+pp6CeOoBkdiDevBi3rD0ZpU3Aw3PI?=
 =?iso-8859-1?Q?rEeEuq561iW6H8A9OBctcNusUPCu+z89EqZYGNkeRkFowMDB/6MM10Woep?=
 =?iso-8859-1?Q?X8nVLuzCYS7qlHWPa7fYTTKMtoM90NHxIN9lQXtoow7gFZuF1zmeAuuaxk?=
 =?iso-8859-1?Q?g5+v7qCLS9uDpquNwfcQZJs8abfYHyxU+SkOCMgkg4AuYqYx1VSOxdcDLN?=
 =?iso-8859-1?Q?Ky4wgU4xOSugKsw86iXoRnhhH/8x01x3uIREmsR4nsOAYxMabVBUL/rUKJ?=
 =?iso-8859-1?Q?DbUemOEkBYLTcVIbxwt30hTBX3w/8P2LcgO7e+AvCv2DozwyPHLUa1/yMr?=
 =?iso-8859-1?Q?lrpja++ZvtvIyd6tAhwb1QzYZJeXmDOPzIkUnO99jdxX6KaeKzbneUQAr7?=
 =?iso-8859-1?Q?RgcFeduETar9anTyYqMPc6ZSCBGiqQgDXdjpZniZognDqsYQxhNzkpC3lG?=
 =?iso-8859-1?Q?ADGy+tvW4xLSx6Dp6wOOs0ElYoR39qhmnB8GeJMW+qy5YeEWkPuwO+Qss1?=
 =?iso-8859-1?Q?MFM91QEkSKa7OoOZ2Kg0rxSCeM9oRo/jwgqDaZYEY24Cs/u1entCO6YVOg?=
 =?iso-8859-1?Q?NRA2KHZSicmQ+beHdFjDRGI5I/opG4m99usLW2IjKvMy+bVrqL59hI4sXP?=
 =?iso-8859-1?Q?F18O0DsF+F4ExfxsQ0K+YfmTqeHB0aFAAu6sBa5Btv3pZLNW+3wGCGoUGN?=
 =?iso-8859-1?Q?bAguMCbxBfK86F9yOPfFLy4Hv1lWDfkf/B0YN8nqfU4fDdq8uZ0q0O0nwX?=
 =?iso-8859-1?Q?EVkZ8ZJYyT2uQzdajmjkWocRk9RpWvqE3hG6bIjD/+N6zjVfZYwnXdE0qz?=
 =?iso-8859-1?Q?WJeeSar/HfbFBcL4RByxh8nhAV58PerlALAIp1Ey+IGBe94ixDbvbF/rh9?=
 =?iso-8859-1?Q?lyAdXcxhkjehNHKibBPm/jwOAUMj3aoiP17S3evlla5TzBIDNGXZmzn4BC?=
 =?iso-8859-1?Q?J/KqcBwimOIP/W4LcHiAKhLmG37eqnDHDq1gPLoVgOq1aYaFh61QME5+OG?=
 =?iso-8859-1?Q?h++I9tYGHIAEM7+ZJxw2PsGBs4YFkWxtvgqr8UejGjCUYS18hGhlsZzz/A?=
 =?iso-8859-1?Q?6d7aIi3r2bBNSKLccNyRftYv1ieQ+xm2MoKF6fT6FKWjx4l5t+xXBUvqYw?=
 =?iso-8859-1?Q?HhkakmgblgRKszwC5AnxSoK38p7+COZlLrikb0URgpwWeEgYYXHWk4KEPQ?=
 =?iso-8859-1?Q?fGKQGtUEMHCQuscDAPzK3xXkCkzEVL/Ka7SJSFGvfg97GX/+ucEOQBAdjw?=
 =?iso-8859-1?Q?WwWGpaX1R9lDKThccuYjK8JtYA2ZR/ym+dqVw88doXzRemiluH0BlBXc/y?=
 =?iso-8859-1?Q?CNhmQXneqw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 793797c3-c25f-4b51-0b63-08de4ef546c4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 20:34:09.6509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGbNKmVBvdT03jKWcT9SKN6i8D/TuhAw1Dn6Eqr4VQwIqkgUHGoOFgVcLR37bDgX8wt9uEbCjJHje3RAtAvkmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7194
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

On Thu, Jan 08, 2026 at 12:54:17PM +0100, Raag Jadav wrote:
> On Sun, Dec 21, 2025 at 08:38:24AM +0530, Vivi, Rodrigo wrote:
> > On Sat, 2025-12-20 at 13:06 +0530, Raag Jadav wrote:
> > > We've been historically ignoring GT resume failure. Since the
> > > function
> > > can return error, handle it properly.
> > > 
> > > v2: Bring up display before bailing (Matt Roper, Rodrigo)
> > 
> > I'm afraid this is not exactly what we meant.
> > 
> > 1. it is not just about display.
> > 2. display cases might depend on gt (the chicken and egg case I had
> > mentioned).
> 
> Yes, this is based on commit cb8f81c17531.
> 
> > It won't be a simple solution. You probably will need to experiment
> > with error injection cases and manual experiments before deciding
> > the proper approach...
> 
> I did two experiments.
> 
> Without GUI: I injected errors in GT resume path at mulitple places and
> still managed to land a working console after S3 resume.
> 
> With GUI: Crash and burn, but able to see resume failure on tty with
> this patch.
> 
> Hope this helps.

Yes, it does. thank you for the diligence and for the patch.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing soon to drm-xe-next...

> 
> Raag
> 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pm.c | 26 ++++++++++++++++++++++----
> > >  1 file changed, 22 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 4390ba69610d..559cf5490ac0 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -260,10 +260,19 @@ int xe_pm_resume(struct xe_device *xe)
> > >  
> > >  	xe_irq_resume(xe);
> > >  
> > > -	for_each_gt(gt, xe, id)
> > > -		xe_gt_resume(gt);
> > > +	for_each_gt(gt, xe, id) {
> > > +		err = xe_gt_resume(gt);
> > > +		if (err)
> > > +			break;
> > > +	}
> > >  
> > > +	/*
> > > +	 * Try to bring up display before bailing from GT resume
> > > failure,
> > > +	 * so we don't leave the user clueless with a blank screen.
> > > +	 */
> > >  	xe_display_pm_resume(xe);
> > > +	if (err)
> > > +		goto err;
> > >  
> > >  	err = xe_bo_restore_late(xe);
> > >  	if (err)
> > > @@ -656,10 +665,19 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > >  
> > >  	xe_irq_resume(xe);
> > >  
> > > -	for_each_gt(gt, xe, id)
> > > -		xe->d3cold.allowed ? xe_gt_resume(gt) :
> > > xe_gt_runtime_resume(gt);
> > > +	for_each_gt(gt, xe, id) {
> > > +		err = xe->d3cold.allowed ? xe_gt_resume(gt) :
> > > xe_gt_runtime_resume(gt);
> > > +		if (err)
> > > +			break;
> > > +	}
> > >  
> > > +	/*
> > > +	 * Try to bring up display before bailing from GT resume
> > > failure,
> > > +	 * so we don't leave the user clueless with a blank screen.
> > > +	 */
> > >  	xe_display_pm_runtime_resume(xe);
> > > +	if (err)
> > > +		goto out;
> > >  
> > >  	if (xe->d3cold.allowed) {
> > >  		err = xe_bo_restore_late(xe);
