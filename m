Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921AEC5ACD3
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2EB10E81A;
	Fri, 20 Feb 2026 17:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhAE3dqN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F053110E81A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771607262; x=1803143262;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8OV1YufKIj6WH9hnqg7WPZPdVDt8j1bVMrF5ZOvc+C4=;
 b=LhAE3dqNEQT8NKhEbC2n8xx2wWQd4LMpXqIHhJsXBSl58vhYw5tAPV/7
 o3ShfgBn2Ksm1v7Jst/jhlI4HmCRfyd5Lxvova4Fm/iTE0dEAmVUMwQqz
 KwUhXlh8TaWz1fkfsewuS39MTmAEQxAs5ySyedg3KwxpESYHjT16ncy0u
 6LtF2+Sja4VPqNV7ZbqcUiF9T68ubsDsdyRPIee7UUmxwoQNXdfo1rS/H
 HMRL4etpWsF18LVy4lnaNwKuNSUU+6aZIn5g6aSv02KA12gK9cQakZVnH
 TKcS8+PQsYVwmdiFL47hifcbxI78KyDIDVhdOs+hMEbsuNf+u7fpba2oF Q==;
X-CSE-ConnectionGUID: bhZjJTUVS1WZM0LIDykKuA==
X-CSE-MsgGUID: QjQT2rnwROeCfhJ0Q7hL6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84155600"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="84155600"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:07:42 -0800
X-CSE-ConnectionGUID: 8YLX41gBRNCSP63TfMUJMg==
X-CSE-MsgGUID: dwdrmr7YRB2ilvhTb+XrBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252592932"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:07:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 09:07:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 09:07:41 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 09:07:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfyJhCgaNN792i23Bf4lXEd8vJ65CktK5RVwtqpxElHMdztXhU43lYTdvIEmMfzan4WER4fVhJjqIkbGadHPn9LxJeXcqZFgnW5Nqmp9e/e/GkucJcET5fyFeBkg5KbakqPgeFHMdokrM3tsEbTZsnqcpdi817dFRC96RXj3rvK3BH2CNgUQzwYoOlE+tDPVL667X/WSWKPbuLDDBroPWfRXTaYJ4viuRj2xJRjVuV2KqZqDT6ODRmuJ5QQJRy4jwJua1xROTZZL20b9Tgal72Fj9lWq/2jKdeEmleLLMJHBV4mmMz8lhVWP4zwoX1jJCMZVAhMgdMpXma/d69Qkvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YU0vBdUWULG3z9Vg7JYkCwtxk9KZHFMbeOWlA+3Pajs=;
 b=iIQbYCi/fQIJcqcma5Z0WySfORRjwnoqvRo/yvgZvPV3uwUfFsyAi39tmfTcHcPpntQlV1zSyw8RbQ1Zb+WJzCqvXlR6bpCP/E/f+mN2ojbhNI/qcemoeEPzT3sPcMuXVh2PlJEPifOrKQ3S8IyqxgfPsKRrxUliOmKGUSOe07NTUin7H8myQdwc1AtPLbESrllEis1bgE4EGBsO7q2tUyZPNHBZjSogmCecu6WUdTejld+pXTfHb5GgFhRWCEXjojoHiFlQl3V9/nciPeDvfNPG0PyXSUlUO97T8dO/jx1lu5I7gh66QkGvMVAC6DuKnYgdgmus/Qb+dzFJ21t4ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 17:07:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 17:07:39 +0000
Date: Fri, 20 Feb 2026 09:07:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/22] drm/xe/pvc: Drop pre-prod workarounds
Message-ID: <20260220170736.GE4694@mdroper-desk1.amr.corp.intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
 <20260213-forupstream-wa_cleanup-v1-2-961f2dd3a8e9@intel.com>
 <aZhEJ21xgL5Tssa0@bvivekan-mob1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aZhEJ21xgL5Tssa0@bvivekan-mob1>
X-ClientProxiedBy: SJ0PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 77300520-b7e2-4e58-2dc4-08de70a28d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RcVGlvzaKj3M+gsuuynicPxJo9DtKqCD+hiJ7I/zGVt8o1saTMdiDRPoocTn?=
 =?us-ascii?Q?h8gf4kNOOSoIs29Rnpkz2eCruAECXCsEj6i2QVaEIcB2DzD8jw3wL6u1MfPJ?=
 =?us-ascii?Q?WPGulzHpXiajVzVVNDjrvheZ3VCBbrwq9iZsQJ50FsGS7a367fAL8hdPp3+K?=
 =?us-ascii?Q?ETGXeUb9N8P7+uuTVgsmaTHsaEKBGCnfRG0Y8gk66yraX40y3sVe5eHJ4mlx?=
 =?us-ascii?Q?tj2wCCqdTBt4QMPdHeOayoLOelPbtdEGOjmRIL47wkqiW783SJSi3Atj+RFZ?=
 =?us-ascii?Q?5srcaCtGRyZKxC9Sye1cm0eTR77mXaTEuPnTuPK3CgG6Sj4Iln9hwtAjgLwK?=
 =?us-ascii?Q?FdcyfvUTDH6h0YxpZITKsYVaraUyg8Jyv8IcZmx5D+9iE+YRMUacbIjruB98?=
 =?us-ascii?Q?vITKH/af6Qol+AxYqV8tUAaW3dFR3L5jgPUdf03/dyj2OuMbB8xolabO4NMP?=
 =?us-ascii?Q?6Tp4ZE3pj2ejVn81MjIU3XJnMwB5R/9N58+BntIktPaqPMNvNjCYr4YsKRw3?=
 =?us-ascii?Q?/c8o3bjOdCUXGbzIGpGwa2JFqc+4GoyGc9T1++VzcvqtLusEvnH+ByziVkUe?=
 =?us-ascii?Q?lY+m0dAURk1g32qWpbBSvPySHF+V6nIXdznXjCUxxYErI+XRPNHk0RNApTUH?=
 =?us-ascii?Q?rQqD8U4gCWkRuzXBiPsscHKNcuFjphJ+kc+CWOVJii7ZMibYsmx7vPhGJYkN?=
 =?us-ascii?Q?OUS9YhEvIdO4c9wdVEIjMDN4n0LA1OCNrFYkuesh1yPSzfYaX17jyL6f3Uec?=
 =?us-ascii?Q?zppsfDFJAA8vi8CvLjEPnMXTHXT+Lji3lSqtxM93kleKEdReAcs5dXIbJaKx?=
 =?us-ascii?Q?kW/kBWzF0/JcrL4nDAR/7b72RyO05BJYnKIyRSkzBY1L7b6G9Gg6LOn4AlPw?=
 =?us-ascii?Q?iYHUcn9HlnUB7L+8xjzRr3ftE/2cKm47V/qC5rEHOU8vPxhmZPp8Yoe5XmDd?=
 =?us-ascii?Q?axPo7T1Zo/OyBzOga6MfdjTtLewXcXDOhLYD1nhUF8ppXBPV06LDE1fRKfLd?=
 =?us-ascii?Q?5TawN9EilrIURphfmTanIU6J6hCIsUPNNrn9bsd+xSGhWEVj3+tbJpApxmLa?=
 =?us-ascii?Q?O/sMgpiqFL6joRNJ3or5bW9mUsogaS/ZHuMPg9Ob2B7ePTME/APoKxqM943U?=
 =?us-ascii?Q?5Vs/BOYc3QWfIUiWNvHWda16UVhPZhEAHNSc6vdYRp/EzzkSgmtY1U+RmdxE?=
 =?us-ascii?Q?LSkZNJO549txVKMJsLQLByEHk7lNkO8bNOHj/sqRI84qUEtlIRtx7+xxM9Qw?=
 =?us-ascii?Q?ffZmgIC6f37LRpeLkr/Wh4j1VSwt+BlTzoMEsT55EZDcdgx9CwfCEqGiNLAj?=
 =?us-ascii?Q?xMODhKxiJGprk1WXr0fLXwGjEMZkVXG4iWh9zDhq/nUupe99Va1CE1W/ipIj?=
 =?us-ascii?Q?BATDuC4JjRUqFrpcMWUlJaV93gi93gChKl02WhM5xZJr4oYAFY8/ucHNGvs1?=
 =?us-ascii?Q?L3AHxsoa1oiK5rx9j6V3n6Sb/uJfqWCDMhMKRXaxkV+H/hpE0yO9sdK4bzEv?=
 =?us-ascii?Q?F3ouj9uNPAURbbBRdXjIqQx2gVnDZDoneQvFKWOlCMVHeEPmbtl77YkSKuRO?=
 =?us-ascii?Q?PhCeLyHEV5nBNXb4eUo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?92VHKEnDzI/ki+x/Lu4WHpI2GsI/qfuLtrib1Ij3Nd5LssLFRYmhL9oon4lh?=
 =?us-ascii?Q?rQPHndZswrytsTkDxJSHQe7146wonnWlnyAkO1hXFmC/lXLnXMjK6C+YU7DY?=
 =?us-ascii?Q?e8Oo3Z/xxhXVLnowPL4N1H42ZEsrptsFDo0hGqaN6J5/k46Tp+0RWcP5o3ZV?=
 =?us-ascii?Q?7+fb6iPRAjcNJ9AQJxy7D6cc3b0XFC9YKcLnTTAzc+kJGELH6SdgNiiWZa4W?=
 =?us-ascii?Q?HabniXTlt/6urN4TfCYGpVZ05oOVa9+fWOCyZD6ijg8rQhOqhZO7zazO24Vo?=
 =?us-ascii?Q?tUXKmYZtrSqojIS27VS1XwHnUux7o8o5BV0dheUeKrD5OAckkp62RzSxmg+7?=
 =?us-ascii?Q?sUoxAMXu9ah4bS+2BUfH2DtHmZxevHq33TiLcrg9yHlcwlo8zcRsChOTWOw8?=
 =?us-ascii?Q?Z9QQqkfkHYfoFTdQhiZSQduWZSlXP+IH2OjlWhpSf11Q4QywQs2HSLW5b34X?=
 =?us-ascii?Q?w6B+iBB31Lqe5u477bMqWk05ydJXTuvaV5yoYfMLTVCedH4UWorXO3GK9K6S?=
 =?us-ascii?Q?LgGRtbZ5sfxHDzSCabYsBIsLCijrbmQEjOsutFI1nofcfgTmId1Xn3PCGOJG?=
 =?us-ascii?Q?2nPmcq78KrMNBg+nq/7HR9i40MJgnYHB7dTBaK5iNPWMWJCnKBj1nB9PDGk5?=
 =?us-ascii?Q?CfqtECDSIC4DNS6iEjilv+u4TZs94JgXm7Zimj6pdRMue6d7db1rLgyUhFyr?=
 =?us-ascii?Q?3IJgDzJTb3ky4j0VY7BnIwEXSJ8scs9jqJKSdaEiT1avJaEw6pB20CI9j/0M?=
 =?us-ascii?Q?K5dQdf7084EwxdVJj6I56XU7+VgKn9eWi5umR4/roHu5blISns2mM4Op5cmX?=
 =?us-ascii?Q?RNIBLiptN9tzsRp6sAgOkHSQsRJOR5fV3c0IUz0Uh02InW+bUASQd45nTgnA?=
 =?us-ascii?Q?OyHohi5fr2+oA1Qu2RK73glDwdSnz5RB9d+NJaCah9QW75hSy6cfP/ciBo2U?=
 =?us-ascii?Q?OigJCUJxm9ovhn0G6giHh2nOW2NrpluZh0fezs6HPAyyPQOqRnJcnGOBOGX3?=
 =?us-ascii?Q?BYkJJ+fQSuu9Ixq4lV9jqIABKBii3llm2va6PXQ50DjjIlo90JfiuJncUcrg?=
 =?us-ascii?Q?l5h1kyfyZLGe2hRMFWUScvEATOnvZDPmTFMMEgiRZgvvmmcPtGN75vJKe1LW?=
 =?us-ascii?Q?GaKOyoslGj+Lwo6LD4I9napxqHldSe8egcqsn6OLoK/Qfy6eWFk6BtFmufOR?=
 =?us-ascii?Q?Sgsfu1xdyFrk+VoLoTfEJ/rUx31jieVDPUzHiwaM7Dl8qgt4DJu6EhUAX/YA?=
 =?us-ascii?Q?DBVC+sDx8gsd4wvbDISkYXO4Lnaf41VwR8Q53jhKiSVCpcFVMKhcswsdaViV?=
 =?us-ascii?Q?Yn2TO4Fw3uut8H34rXI21Jl64MpVd4ETJAySwagbko12oPKQcyLW3BRXWfPm?=
 =?us-ascii?Q?gJpidBW9LLuf3rfGyQZPWSKdSrL/vYOVq6KDdZaJ0THa4yJ6t47xeHuQYvej?=
 =?us-ascii?Q?zn9yiNrI90YLuVPnsTuUkK/NFvkKIWGbIEq7WBRoG7ujy/fQJs0GBxNCs13c?=
 =?us-ascii?Q?pwYl35cwtcQMEWtcqhKPjH0hRa2PnCaObO3gyN4IcqqvbeZTvnme5Vk/vW2b?=
 =?us-ascii?Q?q0nVFTz5rTMN52qmT+2A+vnpRXXm1aLRbEuOU7LOmvW55FBHV21R/uTojckb?=
 =?us-ascii?Q?xK5fdVzwUpPDfPEutspk31X8Gi3VqQucfXa9+gwLOzf4TmIfZX8DBaEqTfO2?=
 =?us-ascii?Q?bN2UJUTYlkSwEu9nLkNZEzJ5Dy7Mve6KVhRsMsVf8p4VQ74oAxcpkZMQegyX?=
 =?us-ascii?Q?qBgm8h6X9pZuc5R3p+WrA26F2QuH8BQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77300520-b7e2-4e58-2dc4-08de70a28d26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 17:07:39.0330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xzKCJASgHZnfc5P+5kqvqC5sS1PQDFPzcwqZuOLByMHeakw0nHv5HRUvkReU/ni0VmksZ/XDf9g5uHeR/VDPLMzpCSqO6qmPT4Xr1LdJSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
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

On Fri, Feb 20, 2026 at 04:53:19PM +0530, Vivekanandan, Balasubramani wrote:
> On 13.02.2026 14:31, Matt Roper wrote:
> > Production PVC hardware had a graphics stepping of C0.  Xe1 platforms
> > already aren't officially supported by the Xe driver, but pre-production
> > steppings are especially out of scope (and 'has_pre_prod_wa' is not set
> > in the device descriptor).  Drop the workarounds that aren't relevant to
> > production hardware.
> > 
> > Bspec: 44484
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c        |  3 ---
> >  drivers/gpu/drm/xe/xe_oa.c         | 13 -------------
> >  drivers/gpu/drm/xe/xe_wa.c         |  5 -----
> >  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 --
> >  4 files changed, 23 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index cbbb4d665b8fe66105727e83cfc59a13624d259e..54d2fc780127742e2e152da438c7d3e8332f3cbc 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -213,9 +213,6 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> >  	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
> >  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
> >  
> > -	if (XE_GT_WA(gt, 1509372804))
> > -		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
> > -
> >  	if (XE_GT_WA(gt, 14018913170))
> >  		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > index a462d6983d8d6daf74beaf6fef5bfe2ab779179d..8683b56d4c80a4a514a85924fe3b6a61e7a9fd18 100644
> > --- a/drivers/gpu/drm/xe/xe_oa.c
> > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > @@ -1760,18 +1760,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> >  		goto exit;
> >  	}
> >  
> > -	/*
> > -	 * GuC reset of engines causes OA to lose configuration
> > -	 * state. Prevent this by overriding GUCRC mode.
> > -	 */
> > -	if (XE_GT_WA(stream->gt, 1509372804)) {
> > -		ret = xe_guc_rc_set_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
> > -		if (ret)
> > -			goto err_free_configs;
> > -
> > -		stream->override_gucrc = true;
> 
> override_gucrc variable is made true only when WA:1509372804 is enabled.
> So we can remove this variable from code.

Good point.  We can also drop xe_guc_rc_set_mode / xe_guc_rc_unset_mode
as well since they become dead code after the removal of this flag.
I'll make that change in v2.


Matt

> 
> Regards,
> Bala
> 
> > -	}
> > -
> >  	/* Take runtime pm ref and forcewake to disable RC6 */
> >  	xe_pm_runtime_get(stream->oa->xe);
> >  	stream->fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > @@ -1824,7 +1812,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> >  	xe_pm_runtime_put(stream->oa->xe);
> >  	if (stream->override_gucrc)
> >  		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
> > -err_free_configs:
> >  	xe_oa_free_configs(stream);
> >  exit:
> >  	xe_file_put(stream->xef);
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 7f45d6eba44354a4dd047ac5800f18c6a9c90725..fb1ce4479dd81a5fe91906948cd37a7e654b655c 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -499,11 +499,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >  		       ENGINE_CLASS(COMPUTE)),
> >  	  XE_RTP_ACTIONS(SET(RING_HWSTAM(RENDER_RING_BASE), ~0))
> >  	},
> > -	{ XE_RTP_NAME("14014999345"),
> > -	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
> > -		       GRAPHICS_STEP(B0, C0)),
> > -	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
> > -	},
> >  
> >  	/* Xe_LPG */
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index cc988f2a18d33365dc09d32f4e85ced01b823877..c3222d9504889b5175fdfa73db0bf4e9910a277d 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -8,7 +8,6 @@
> >  22012727685	SUBPLATFORM(DG2, G11)
> >  22016596838	PLATFORM(PVC)
> >  18020744125	PLATFORM(PVC)
> > -1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
> >  1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
> >  22014953428	SUBPLATFORM(DG2, G10)
> >  		SUBPLATFORM(DG2, G12)
> > @@ -53,7 +52,6 @@
> >  18013179988	GRAPHICS_VERSION(1255)
> >  		GRAPHICS_VERSION_RANGE(1270, 1274)
> >  1508761755	GRAPHICS_VERSION(1255)
> > -		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
> >  16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
> >  		MEDIA_VERSION_RANGE(1301, 3000)
> >  		MEDIA_VERSION(3002)
> > 
> > -- 
> > 2.53.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
