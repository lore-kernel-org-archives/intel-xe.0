Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02A3CAC592
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 21:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B131D10E0B9;
	Tue, 16 Sep 2025 21:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHX6OJ0l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB5210E0B9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758057398; x=1789593398;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TBQq+870Jg4f2Vzh5Ews04LP7w8Go3evGuzD+7d/Zcc=;
 b=WHX6OJ0lSN1j0g+D5Qik/yLdcFhkb2WRMRsHD4GKpkBxLtvTLE6uyeRe
 NKUxUFrXvFQ784fIklAncc69/Y3KHaqpjM3bIt+JHtLgFSJ3XiGL8hm1k
 Uk3PQ9LQFGNpuLYh+ruXHtH8M3vEaoBiiuRKFNUHeWOMDD2QjRtLHoM0I
 6liipp0fx5zXUncPzZkl680Wor6ObnTjSMWpKYITuU0htjfqHCCHw+Dj0
 jBVe8oRJwhIM25NF0Yfh3YZjwiLWLH9dxBDjNxV+oEWcTP64GjmzGHm8w
 vjgwl6kjdULtn5vjFiWfADOCr68R283uVo5fMnruo1IpEcLfIl59yZAr7 Q==;
X-CSE-ConnectionGUID: RJDLek2oSd6VD+MP7ATsDA==
X-CSE-MsgGUID: IMV7hK3+SIKDmq169QiyVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59398253"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="59398253"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:38 -0700
X-CSE-ConnectionGUID: 0etY5/cgS72e161wSjrN3g==
X-CSE-MsgGUID: L3VMf1jfSzaQG5MYYsGefQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="174658825"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 14:16:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 14:16:37 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 14:16:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHoga4ObH12GkWSObnOPj7grFChGq2F7l90KYW6+GiH/pE+5xpjgaghFtKalndG58oDQIXKMUa7yMMaL+o+rcU9rIQtRX6oNnZbn3haIPbw9xkiHtiRxIJ8rV+zUqObyk7nsFGBkz6Bp8/Id4k7PIxTaKMTt8DHMyP+frnpLpi1Qwty96N/zvTAJe4+UcolOwNqoZ4IIPO05HIGCg2oIzKXB+Pfho6Ox88TGzqHODLlCY6JfwiU3x7vOPfxh+TcBRSbUo5meY/bl8Wx+iFmEODoWSG3o8K6AwZipE1F+t1hZCBGJ0rP80Q/tjYUvhGmV1sVyh6rjwe3JLrKqTOxpIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hufVtZHAtjFCM1de9xKFQYlxa+CtGZyLRbUxGbPvov4=;
 b=Bz0UbtNyrLHSk3scW8hOg/IdQ0Cw5Tnbu7WbW6+xR7y6c0L8aRMfabBvfgFUEajld2PQ4Wjdjgs8MbRLouL3u2x3NOZl6xntanenukmGJLGJSlD+7i+Av2JuOEj+FrhU9zqSc72lcQ6go85vlEqxqWEsJik+mGRfxhTzo2vJ4PwpS1hU2tlcFbunlMyLTSRYrX0II2dwfHuvUoeSX8M6/2DdEjMf9weRqw7AJdIhFVPwfHIDog+mpXzyvEx42T0unsZnxOInoLD6oqBeNViMUjWuL2VAZoPgxfLglw2uvakZcA9V6MGcwnefxZ1EjJM2TJDEb8twCNiYBd7dLQl3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6745.namprd11.prod.outlook.com (2603:10b6:510:1af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 21:16:35 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 21:16:35 +0000
Date: Tue, 16 Sep 2025 17:16:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v4 5/6] drm/xe/lrc: Allow to add user commands on context
 switch
Message-ID: <aMnTr0VeLK9ULX9A@intel.com>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
 <20250911-wa-bb-cmds-v4-5-c8f7e48f7eae@intel.com>
 <aMnIQQWdJvWEA0pK@intel.com>
 <qyoilnhjle5cn7sd5ciuo2iwogkpntl5pwssxcgn476issw2pu@ososownuo7mr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <qyoilnhjle5cn7sd5ciuo2iwogkpntl5pwssxcgn476issw2pu@ososownuo7mr>
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d4c06a-e639-4e35-9b03-08ddf5665139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sr8RVDGwav88vL4ACpcZII94SlNpRRnWu0AIlVHsJWyr75R6T9zy8SggWYpF?=
 =?us-ascii?Q?vktdu9yOZnvyvlCNMIBqg9z4rS/xs7UjX0Psudkfp67b0FgJFhIJa6apDBhj?=
 =?us-ascii?Q?zIX+Q9u6pUJqLjV3KD0XSesn933nrHsBUFu6VzwMT0GOT8Js+TkCnqztSZLM?=
 =?us-ascii?Q?WuOxlKsodypxDFtO7aHmxsrTI96YOQZ0p0/q8s7FW+6RMdy+88B0HmBh0kaa?=
 =?us-ascii?Q?Cs91S7Nz52fYj012MFviA2cHpanzW55ovdmARR3sY36eUiSmex2gZOf6NOvW?=
 =?us-ascii?Q?Be/bga91nEy9UJZ9kJJdFnGYn6nDbbyGJu/CeJoknxlS9Zo/Y6AkA70/yqw0?=
 =?us-ascii?Q?8s9dYDsI9Txwet97lJCijYkdxdnu5b9uOd8NGcsGcCIC22XYLRQH3gS/Pjhf?=
 =?us-ascii?Q?Q3/46Jbd/s423xc+1tbxCqs+GcU7N6yma8xH5+5eG3oePsBf7Vphx8/8uxrv?=
 =?us-ascii?Q?aJzi6w2PcJ8aKEmSRCx5AAgedW3xmXqrFIBbeupP4hA1UdIijZkfXBovi2AA?=
 =?us-ascii?Q?glKTrrTlPkwZyDnKi9IhfzpruJBN8vU6Pm0eqz8KX/H2Rj4yXRQ0F9dY9x4K?=
 =?us-ascii?Q?pQLx6Rb9+jFjKhQBP34+Dh87ObNonxlXp95asYR2aWTvmQrlHT4CwDgh8KkY?=
 =?us-ascii?Q?kfaBOfGCh6+mRQ7rKMH8dA6N+9DxOX7POXKeP8dSIax90/DFpFi85S/peoUV?=
 =?us-ascii?Q?08LK1evyw2yFxHmq+Y5n7oYLfHrP/Q/4bU6Zu6sLEkIChc/5/hapxHOUYigh?=
 =?us-ascii?Q?oAtUtXvjT1qT7k3l72FYytDGLB5f3XE57JUFxzBQDjde2ZgZ5l4FK0f8Kmis?=
 =?us-ascii?Q?yyub9B4/R0Nh/DPMf3S0DLlR+emWF9lC+i3YX9E3EzyEcKnrMgNItBm8Zdm2?=
 =?us-ascii?Q?cyGoepqHwGX4IueFOME3VzamxCgItWswBYmOZkJybTttlqXjFqfKrjglQ9Ue?=
 =?us-ascii?Q?D7GiSTMCo7Zzf9n3JbX9+StMNzf2qjDhKUH+iAxrZeuJGp3iFnnGbWQsrkJY?=
 =?us-ascii?Q?wCL2BbTN3bw2Rnq3znpxFaptWiXAazMKXq7HQ/dHoWN+EK9KaTvxry2atCwS?=
 =?us-ascii?Q?GgYE8f9x/h8v05c2kzjJLXyfIQCYXsPyRJfHvC3I8QAurbgRl5l7KDfj8YwZ?=
 =?us-ascii?Q?h2gwet5sm5D5uTImOVdmN4yYXwrjLHdYFRTqXJUXHaoM7UZNN7JJGkB31k0d?=
 =?us-ascii?Q?vE5k66Iw1aY2uxslMnmUgmOfbnP0elZmdFxh2jW1YFBoG1kbqXSKuz6sIQWl?=
 =?us-ascii?Q?3Ry6msqvh3dXBigUkPAUiPiHl75W/Sr3o7bn1VQXANQ3RlFsFSi3Q5Jsw16d?=
 =?us-ascii?Q?9aRYffXo8QhXe7hN8riGskkcpDLT4Cq02nEUZSM39NLVjSlAGiC2pzzuvRaw?=
 =?us-ascii?Q?Ix2shR8X1L0uImuLX+r9fgMqsxaxqs/3hlnlv22I18rWBu/FpXwGfnJ1aFk0?=
 =?us-ascii?Q?eZLX4B3z4TU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?McYIF3/b8TFAW5rtPrmuqhncxZhJPkjUl6seSq3USE1lqWKcGSveCrI/UI7z?=
 =?us-ascii?Q?CAGLAPjj5+LpPbWqHMHgbT+6F1apOPbSVZfb1y6yVR1kNyfRX7cda930oTbM?=
 =?us-ascii?Q?xz2ulCahQYxFKZpfiCOtwleBujs30ZACIHM/nuZm4SkRiJJVkmvoSrM1rXP+?=
 =?us-ascii?Q?YgpEW1ZlDlhAs+3B6jOPEiCAv6wwNdwbyMUikOzNuTj/2/QnuZp0Be9hZrlZ?=
 =?us-ascii?Q?Hh+h4AywfUlwHJkczhxbaqTBm4Oa9m+/SfV/cYqU8e8m/SFibQBEjew2Dy5q?=
 =?us-ascii?Q?BVKjl+cJyF8tQ97TaOHk8dtRvqSt3u/JooR8/cXV/O3N+/wFtkDBrsEuUgT5?=
 =?us-ascii?Q?v7Fiw0kys22ICm2M+/QzS7hBvBwRa6IW3gqhx/SKjn3vx5pLzOJrrcmKnABR?=
 =?us-ascii?Q?+BCZaqPowKg23nPAwDxDZamdBTt7ZplGL1gWxUjzX4SxfX4sqvMwBWoohh0L?=
 =?us-ascii?Q?a9t74fiSx5bbyNYSI7Nv2ohSnV/frQ75J2crGE3s7LmnrOk/xzwN5k+Ojs+4?=
 =?us-ascii?Q?SHPQlUFoFK/EL+cTK28oeI/lWQ/iCt00eSAVJAg6/kyXwXXTP9/ITr3aaWs3?=
 =?us-ascii?Q?9mJGOFbRa0KXO4vD/sNnN51GimGN4Jl68z0vVQEQRTspIjNC8DPaXK/bDqVr?=
 =?us-ascii?Q?flcazE50mkSW9oZK6XOFqa+esxiNOWANlmpaLEwIuQBrvbCQeXOU8eQyTC2J?=
 =?us-ascii?Q?A8ZRJDhVwc0jZjnOnpYyxkjcnK2RG5GlQUBGYMTCIj836RGNy8JX34YWToEx?=
 =?us-ascii?Q?OVa1CU8H1+P7C5jukli4eWUDhSdkJU1GjmX/YS23b7yquulU/3htMgXeyjih?=
 =?us-ascii?Q?cPTY2aAK/Bw8bc7/CEzXht24fnkx+pYoTJlZFk6OhWS5/JZPfiZsCeITYrf6?=
 =?us-ascii?Q?ydh8TQMCP66O4VZEf7zBK46GbW256LEdaTqVgt0A9RI3+IjuOYzQNP2ng6Br?=
 =?us-ascii?Q?uXC9XqCqiX5HmzoRuex/+2PQk4Pl7gz3XbN4hR1XD6qlKKtRrqMibWNsASNG?=
 =?us-ascii?Q?NM8fxgnt4KcEetWQW4WdoRzTVCxmkPUEimoRANpLocOMZ9kFGngM1wgwaZS2?=
 =?us-ascii?Q?JzFUzQGh+IdsJj8QnGlkRFTnxUxFXO4RKNcZf/4s018D1VH4mHbPa4QvT94f?=
 =?us-ascii?Q?noB9Ja5zm+EaX/r4BHs0bYetAmyPMca8GUvrOzjRGJofflOGJZrjiB32asmy?=
 =?us-ascii?Q?WMnXOlfEWWxjoTObdKEQRidBhJSCn9h9uvP/Tf4Drcp8mduglZG0OSWUFnHj?=
 =?us-ascii?Q?g8Vq8HGAQZ7JMGaKRXlP/KCBL2YBr7oUch8oxv1TkWLluDwsnuWuYx6jsQkL?=
 =?us-ascii?Q?X2W09gGL3bl0dgLmEC6xclV1+lYm+DeilJx1nJpK50FCuOCqBDho1wqQShhF?=
 =?us-ascii?Q?Rc+Pi1KhYCPRAgVC3YyB5QQpJOqtHSnyZ6AwHkhx6fQd2tp2SUL3UmunA5Lp?=
 =?us-ascii?Q?5k7Hqaey5fV1oebBa3BrlDpwAMQda3W7fGxUuY7VMZxGDIxrCFt907fVYpud?=
 =?us-ascii?Q?gxWFGYbfug4qhvHaqHcqK3DMiIQIautlQa++Cny/5Yq1EJWYDUQgXME5XiH7?=
 =?us-ascii?Q?ZhTuWAzgw2TsCZaO2+Irv125K2d+LWnom1dBeBuMTA+xsHMEY/wi5nrVfi/F?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d4c06a-e639-4e35-9b03-08ddf5665139
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 21:16:35.6809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BK8KwlehN8hrWNpb5MNGp5TTQ8ShM0FIoqHe/mtHpYfKfikZ6Q3+3KFiGRAcLaKKnpBoBpD/O9+Z1PAK+qMwmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6745
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

On Tue, Sep 16, 2025 at 04:07:20PM -0500, Lucas De Marchi wrote:
> On Tue, Sep 16, 2025 at 04:27:45PM -0400, Rodrigo Vivi wrote:
> > On Thu, Sep 11, 2025 at 12:36:29PM -0700, Lucas De Marchi wrote:
> > > During validation it's useful to allows additional commands to be
> > > executed on context switch. Fetch the commands from configfs (to be
> > > added) and add them to the WA BB.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > > v2: Fix warning when building without configfs
> > > ---
> > >  drivers/gpu/drm/xe/xe_configfs.c | 13 +++++++++++++
> > >  drivers/gpu/drm/xe/xe_configfs.h |  6 ++++++
> > >  drivers/gpu/drm/xe/xe_lrc.c      | 25 +++++++++++++++++++++++++
> > >  3 files changed, 44 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> > > index 45fdb6cf26b5d..d86c75af03278 100644
> > > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > > @@ -633,6 +633,19 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
> > >  	return ret;
> > >  }
> > > 
> > > +/**
> > > + * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
> > > + * @pdev: pci device
> > > + *
> > > + * Return: post_ctx_restore setting in configfs
> > > + */
> > > +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> > > +					enum xe_engine_class class,
> > > +					const u32 **cs)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > >  int __init xe_configfs_init(void)
> > >  {
> > >  	int ret;
> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> > > index 1402e863b71c0..eff2645b5f593 100644
> > > --- a/drivers/gpu/drm/xe/xe_configfs.h
> > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > > @@ -8,6 +8,8 @@
> > >  #include <linux/limits.h>
> > >  #include <linux/types.h>
> > > 
> > > +#include <xe_hw_engine_types.h>
> > > +
> > >  struct pci_dev;
> > > 
> > >  #if IS_ENABLED(CONFIG_CONFIGFS_FS)
> > > @@ -17,6 +19,8 @@ void xe_configfs_check_device(struct pci_dev *pdev);
> > >  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> > >  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> > >  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> > > +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> > > +					const u32 **cs);
> > >  #else
> > >  static inline int xe_configfs_init(void) { return 0; }
> > >  static inline void xe_configfs_exit(void) { }
> > > @@ -24,6 +28,8 @@ static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> > >  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> > >  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> > >  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> > > +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> > > +						      const u32 **cs) { return 0; }
> > >  #endif
> > > 
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > index 6d52e0eb97f54..f337954066f55 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -16,6 +16,7 @@
> > >  #include "regs/xe_lrc_layout.h"
> > >  #include "xe_bb.h"
> > >  #include "xe_bo.h"
> > > +#include "xe_configfs.h"
> > >  #include "xe_device.h"
> > >  #include "xe_drm_client.h"
> > >  #include "xe_exec_queue_types.h"
> > > @@ -1102,6 +1103,29 @@ static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > >  	return cmd - batch;
> > >  }
> > > 
> > > +static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
> > > +						  struct xe_hw_engine *hwe,
> > > +						  u32 *batch, size_t max_len)
> > > +{
> > > +	struct xe_device *xe = gt_to_xe(lrc->gt);
> > > +	const u32 *user_batch;
> > > +	u32 *cmd = batch;
> > > +	u32 count;
> > > +
> > > +	count = xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.dev),
> > > +						    hwe->class, &user_batch);
> > > +	if (!count)
> > > +		return 0;
> > > +
> > > +	if (count > max_len)
> > > +		return -ENOSPC;
> > > +
> > > +	memcpy(cmd, user_batch, count * sizeof(u32));
> > 
> > shouldn't we use copy_from_user here?
> 
> no. When the user wrote to the file, configfs did the copy and
> called us in xe_configfs.c:
> 
> 	configfs_write_iter()
> 		copy_from_iter()
> 			...
> 				raw_copy_from_user()
> 		flush_write_buffer()
> 			buffer->attr->store()
> 				ctx_restore_post_bb_store()
> 
> ctx_restore_post_bb_store() will parse the lines, and save it in the
> correct format to this instance of xe_config_device.
> 
> What xe_configfs_get_ctx_restore_post_bb() does is basically return
> that already-parsed-and-saved data.
> 
> So... here we are not copying anything from user. We are copying the
> previously saved buffer that is already in the kernel.

so, it does look right

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Lucas De Marchi
> 
> > 
> > > +	cmd += count;
> > > +
> > > +	return cmd - batch;
> > > +}
> > > +
> > >  static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
> > >  					       struct xe_hw_engine *hwe,
> > >  					       u32 *batch, size_t max_len)
> > > @@ -1203,6 +1227,7 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
> > >  		{ .setup = setup_timestamp_wa },
> > >  		{ .setup = setup_invalidate_state_cache_wa },
> > >  		{ .setup = setup_utilization_wa },
> > > +		{ .setup = setup_configfs_post_ctx_restore_bb },
> > >  	};
> > >  	struct bo_setup_state state = {
> > >  		.lrc = lrc,
> > > 
> > > --
> > > 2.50.1
> > > 
