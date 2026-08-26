Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A7EC61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 20:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB6610E62A;
	Wed, 26 Aug 2026 20:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzldaGMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DBE10E62A
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 20:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787775054; x=1819311054;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AYvISsGxVzSA4WqAMPblgx0BZBT2b6BS4m7p64s3z10=;
 b=BzldaGMiF2i4bQXbB/FTCuPFv7wRWc7kWogwfH/t8KAs+HR5XIIC2IvT
 i4vnkSWsxAMEYeDncBcNdyBiDbvGtv5XAxZJMMibrpzb6tTcZ2OrPjUc2
 49vXEbjP/QXwyGyARwYQcgcqoC81lIWcpl1ZoBFbtSNcOf5qhm3VzNPOi
 fpxvsbJac3MtlXtX8SXvLwJ8AfSHZYD3tfW9QQacwgbBvLnJi+1cfP0cm
 4VmAazIDOCVvEN1oQR6IRBc/vgkR3oKuA1+IMa+BuDfIqBf/8nEScM3XM
 ugil2HWmYt+63bvl4TbrMEP4qsbgB+2jajXjVVZZB0z2yFSA2RCvcDbOP A==;
X-CSE-ConnectionGUID: TQR5ISIiSHqxIRxerF+RqA==
X-CSE-MsgGUID: /Jl8YEZKTfulW+0LpbMSeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88391086"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88391086"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:10:54 -0700
X-CSE-ConnectionGUID: 0GUrO/U1RG2QZZwovSuF2Q==
X-CSE-MsgGUID: yey2TXtQRsuEDwA4psQVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="272912435"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:10:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 13:10:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 13:10:53 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 13:10:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyVG8/tI7ybx9JHEs/FBZ/OTED3JETK7dhwMIZH4swidPCr6dlUgJrRnudjKerIMVfg5pxY4jMyOosi84k4QH4vbtVcFOJBhkv7wBS71O2igiSAJUnj+dJrzDmobvByKDMMziK9G6Ker3uDERwcLXkelaOgwz5jBzJmwB/oZ4tDlNV3EXot3Wp3bMYvDWOA2ncP6jiu6BD+R2XS/JAvpHA2Bn8QCcGRDsL5GZy0fhQWoCDUEbD6HAz9qm5E4R6j2fp5aacMGyvZrI92jinBvZtBtXyIeBQfQ9SvNDt1VxscAYEn0ivUzYx2fKf8Vxhirb/bBoA0oDL4HizrKGlIB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTeUyiaXFtxXlEXwblRNU05A8F4yUVuk+EIhrk//8N0=;
 b=zB6Ir8Ve4Kzk49HV3xsKC6oGhEHrWnUUCnKsNr5hZLlkzcOM9h3W7U+/pe+yHz1gyes1BvQcaWnuVa3NDoAdDd4KwpEM/UqC2jDSVY/DXyYUsmcc4A0Pn+scsTlGHff4xRgKthy8e+vBPXkYrusHh6ZQQDP3xBka/VsZhBUdRQnJeXwYSPKW1xj80ok5CIXUyoF6ozmqlxeLUW8g2bmOO8Xumiyt6Oymo9kboQsfHjndLu+vJhCgXmkVwGhNZ44XqW7eh6855EjppPtQ6BJaUYVJ4hugs10U5Kb8JYqGetyzcg3EYmjNwNNiL4XMWqi0njbMGet6YQrhDTBVVuYffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 20:10:50 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 20:10:48 +0000
Date: Wed, 26 Aug 2026 16:10:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count from
 thermal config on CRI
Message-ID: <ao9IQ3KnnwsIeZQ-@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-3-karthik.poosa@intel.com>
 <ao8uP1ykIgCjkUvF@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ao8uP1ykIgCjkUvF@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0143.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::28) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 735704c2-3b6b-47e5-eeb5-08df03ae1e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: jSr7hlxKsqJeWg8f9RUNsoqg9Jg3vZVg7svBHh2C3j/E9P1eMnNBHipBadbLO55W2J/TW0qunRk6EFF5rl3D/fCbyLK+hrZ2zXChcbH55wwoh1jbN4EgbC7zhWvEQl6+SPZFpjS8lLXQj8XLtQ1L0Q+QkNDhs+uFbTEPfiiJMtCIfvV/Xdu9+ntLvJOP+JY2MBQ2TKdCO814grvZFSFMyw76WGiPza0LwmnsJcUX2SKpTvbsVgy51eLeTgUk0K8WCBFh1OwtQJ3kshEYxMQx7W39idtPdCCHUXqo37aYEHo1384Xg/qM49rzY0WWX0nFnGoLCk9Aj80A9qPrrHN4Dk2U54O9ztK0KZuRGmQvvrpBbblMRJfx+6m08aM0sYsZUmDh9dZTBC7gQylVNpwgrXexlUAq7nu2pOejjOJj8z5bgbAz13CYs1Ol7KKrH6sC08nMPcgD+ILyEPfBXAnK1RuzM7IKUw+3fayv2WQSuDClLpJLtOhAv74dVO33TWvyARw8Vj4XN/8/yZa8/cxaVhUjKC9hpxrrd+6/WT3prcFFpFG/RXCHBoAfDvVHlECm2b9E7sBQeM6GkW7AYQGk05wqfvvxhqF/ifGrz6DzLrznzqq6084Qc2ca0VWgNsVoN11jZ6artUm0tUp7ds7K5aSsSAXpxNP/VtZy5LoRnRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gQUgLx39ns8pjIFGEH/24hb9kpdGHj9pgCiygCcWywnX5qPdSBgFAmVkZJF+?=
 =?us-ascii?Q?HzzZD9OozgWq5hlmwZVKlFNMAmHFKCIYouvua5vnDbjH3AVsJ+iYT6JIH+eF?=
 =?us-ascii?Q?2MkhMT4DsGxLhbkKwZ3rGstADoN3BaeRKDzrfohkvRHkMmonCWAd7cxxXuNB?=
 =?us-ascii?Q?UL0LlgZQLaWDq7jG+dQeGnNEiJi9zBv27mjPZBqdWQfbz8nVHbDFfttQdK6Z?=
 =?us-ascii?Q?IXiKaRbPwlVY9Q4AfxLIcG5dlwfyFJKzcohO4zUTiITHvXU5pEMr3JQEAvbK?=
 =?us-ascii?Q?Tsb7+JuksdFobmWxv4LZi8rwoLTP6haWGS0AXCOb2GJM/RiODYQ0e7L+TSTU?=
 =?us-ascii?Q?nNC53anMm3NNIH9Ne7W4j6b3ZGvhmGFN/hkXyXKBo3tyNHgYBIxu14VN/KqG?=
 =?us-ascii?Q?LEK7uyvUYOhODyn5dLAX/QiZ4gLDQ+u0KfAE9MRZ7zhDzKENqjnpCSMVVf2g?=
 =?us-ascii?Q?TnUWHCTFrgoiNpC8+K9lw7Yb7vytt4lJncsVpOn0VU0irSH1NDV1vqti+w9W?=
 =?us-ascii?Q?8m8FyrXbQzJDw0TeLI8n0PZHsgNS0GsPeNk0fmgtqjd0rAevGjetz/RIG9C6?=
 =?us-ascii?Q?x02L89UWjSnNNlWJ85/IK1wZbxdCPI57Elyc3JCnEPXpDXWjmNMlEZlWL05v?=
 =?us-ascii?Q?6VMpaD+UyaqwGXqSmRWYHOG9Qx85f9+gyZET8rX+OcMS+y8s1DxSkCrboOSJ?=
 =?us-ascii?Q?VXlVUXbRdwf+uAE1Cgo5+INYdZ/pVEqi/WPxjlq2xf6MsSG2yD7hoyfouyOJ?=
 =?us-ascii?Q?abI8LkBkPlbT/DGfBm4B5Y0GAscRTDiC7ECRj+AMcHMnQ4aJUfoO8Su86X53?=
 =?us-ascii?Q?q+6O0Kn7fnpKdmNUakb1EGx/oGFZBbxmIhw37N4GGBL+hoeIaWcIEhiICjEr?=
 =?us-ascii?Q?Hg4SgsYT+EwGuHqZwOJJqtL3hulV6vjNSilrEVgNV9nBknAznwhKz0QCv9qM?=
 =?us-ascii?Q?AjzhtJ03+LIdv0dfdVIp1xs5dd+RjlNlzlcmzLJ6J0fdNo53iXSlDsEAJOK4?=
 =?us-ascii?Q?BwUFw70qMhC22aK7aFosv3Id00gINyuWjWf7FdfkKEadq2zWMvfoojmiD5cW?=
 =?us-ascii?Q?T2PySNQhV1jglRuQyZOGZ2hhc/ouwhFBCppNB6YTMRV6NexamPtAv2+IZyUl?=
 =?us-ascii?Q?0Oo7ppAIddulSrWnWa2LX1471uZiQLTMrVLAzJpuH7jb4bzIPBf8IyC34bPS?=
 =?us-ascii?Q?uzMbIFqorQuh22uu3GZa6X86nAfbKVZvpm7wso5aCUzWwuyqouSKt65q/DD6?=
 =?us-ascii?Q?THxNZnlVpaUP9AKgtDCiYHwkheJAg5epDRbR8nU7BdlDYtZCqFRM1U6jGuqN?=
 =?us-ascii?Q?wGJ9gKMIZNPCUdipO42x8l4of3kQtOJQ95nYcivUqEt1/91Kvd+85WopFVXq?=
 =?us-ascii?Q?xirhACFkRYPVvKxeB/JyfJmJ4GgsU2oTfMzmTeM4IgS4+t11fS3yFGeXYciW?=
 =?us-ascii?Q?lXHi5v/DIkMrc4TSTXSw6a6TsRqV9m1nzYNzNEV7a9kogIlsyGsYH8Uoprut?=
 =?us-ascii?Q?2aTlnL+z0zQX8BDtPpDZjPFMzLaXGGhKlyF/QEGeQgJ91LOjO/YMbsWbf3kl?=
 =?us-ascii?Q?qiRy4m16a/jH2AQ/rAqCJtzBmMCvtSEpCrOfSSod1fcNsAPEKlQNnCdiirJP?=
 =?us-ascii?Q?u7n3S+PSg0uJjrRsqMdaYuhWcvWUix8Kham1VS5o0L1w0UaqOJ/P5G/pKiSv?=
 =?us-ascii?Q?mVEln4nNYBgkMLSwkxpho4NPPeH/gBFWTcxhN+RnwEoYBhArcUXOqaX5DkGE?=
 =?us-ascii?Q?4aqdmIkDoA=3D=3D?=
X-Exchange-RoutingPolicyChecked: d2KNvUr7UeJpBfBHTn99CuvS4oFRZ2wJFOSBD0fv4ym4b8Ova6RelfDoOOpjYlf7Z99utTgDdFstam3Xb3qTTUFR5OQFuEp/j6LCYGeg/bKoXNaSv81L4zPia0yXSuPL1Opw3SCDSA0uFvl9Nk33qyYxdDvIh4nRkjLD9tFFHBT5DCzyF5ZJxGOiK2POp9Ym1f08SiVmVUh/Uk8SxwM7H6nR8GZYWEDQlopLkhlgAzqRN16pxD6YeE5Z+CAMsQfw4SGyL5FFTW/Rd3Px5xcLlv0bw4x2OHLD4Wdc9Tqg3zQocpbjyoUH2dLTT0f2JmryYv6SLIGeBjTI9sNdm4vDew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 735704c2-3b6b-47e5-eeb5-08df03ae1e82
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 20:10:48.4671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8Yq1qOh4kxbtrbhk3mZggwpW5B3smXw0MBUrc/xRmkw+LUbjvacUqPBIFO+4JgmbWG1voSrFbB5vOquwJNV5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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

On Wed, Aug 26, 2026 at 08:19:43PM +0200, Raag Jadav wrote:
> On Tue, Aug 25, 2026 at 12:11:32AM +0530, Karthik Poosa wrote:
> > Read the number of VRAM temperature sensor channels from the second byte
> > of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
> > exposing hwmon attributes for unavailable VRAM temperature sensors, while
> > retaining the maximum supported channel count on non-CRI platforms.
> > 
> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_hwmon.c     | 35 ++++++++++++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
> >  2 files changed, 31 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > index 2c4eba4b8f8f..6e7cb250e628 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -39,7 +39,8 @@ enum xe_hwmon_reg_operation {
> >  	REG_READ64,
> >  };
> >  
> > -#define MAX_VRAM_CHANNELS      (16)
> > +/* Maximum number of VRAM channels supported by Xe */
> > +#define MAX_VRAM_CHANNELS      (80)
> 
> Why?

it is used below.

But it should simply be something like this:

#define MAX_VRAM_CHANNELS	16
#define CRI_MAX_VRAM_CHANNELS	80

and both gets used below

> 
> >  enum xe_hwmon_channel {
> >  	CHANNEL_CARD,
> > @@ -48,6 +49,7 @@ enum xe_hwmon_channel {
> >  	CHANNEL_MCTRL,
> >  	CHANNEL_PCIE,
> >  	CHANNEL_VRAM_N,
> > +	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
> >  	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
> >  	CHANNEL_MAX,
> >  };
> > @@ -144,10 +146,12 @@ struct xe_hwmon_thermal_info {
> >  	};
> >  	/** @count: no of temperature sensors available for the platform */
> 
> So now this can be "total number of temperature sensors"?
> 
> >  	u8 count;
> > +	/** @vram_count: number of VRAM temperature sensors available for the platform */
> > +	u8 vram_count;
> >  	/** @value: signed value from each sensor */
> >  	s8 value[U8_MAX];
> > -	/** @vram_label: vram label names */
> > -	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
> > +	/** @vram_label: vram label names, dynamically allocated based on vram_count */
> > +	char (*vram_label)[MAX_LABEL_SIZE];
> >  };
> >  
> >  /**
> > @@ -271,7 +275,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
> >  				return BMG_PACKAGE_TEMPERATURE;
> >  			else if (channel == CHANNEL_VRAM)
> >  				return BMG_VRAM_TEMPERATURE;
> > -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> > +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
> >  				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
> >  		} else if (xe->info.platform == XE_DG2) {
> >  			if (channel == CHANNEL_PKG)
> > @@ -810,6 +814,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
> >  	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
> >  	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
> >  
> > +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> 
> Same as last patch. Don't solve problems that don't exist.
> 
> > +		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
> > +		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS && hwmon->temp.vram_count) {
> 
> Isn't the first condition sufficient? What am I missing?
> 
> > +			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",
> 
> Can this be invalid? i.e. 0xff? And should we clamp it in that case?
> 
> > +				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
> > +			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;

hwmon->temp.vram_count = CRI_MAX_VRAM_CHANNELS;

> 
> So perhaps CRI_MAX_VRAM_CHANNELS?
> 
> > +		}
> > +	} else {
> > +		hwmon->temp.vram_count = 16; /* For older platforms, max is 16 VRAM channels */
> 
> BMG_MAX_VRAM_CHANNELS?

hwmon->temp.vram_count = MAX_VRAM_CHANNELS;

do not necessarily need to add a prefix to the old one...
just a prefix for the new one...
But if someone's OCD is asking for symmetry then

XE_MAX_VRAM_CHANNELS
or
BMG_MAX_VRAM_CHANNELS

are both accepted options...

> 
> > +	}
> > +
> >  	return ret;
> >  }
> >  
> > @@ -988,6 +1003,9 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
> >  	u32 reg_val;
> >  	u8 temp;
> >  
> > +	if (vram_id >= hwmon->temp.vram_count)
> > +		return false;
> > +
> >  	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> >  	if (!xe_reg_is_valid(vram_reg))
> >  		return false;
> > @@ -1516,7 +1534,7 @@ static int xe_hwmon_read_label(struct device *dev,
> >  			*str = "mctrl";
> >  		else if (channel == CHANNEL_PCIE)
> >  			*str = "pcie";
> > -		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> > +		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
> >  			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
> >  		return 0;
> >  	case hwmon_power:
> > @@ -1645,6 +1663,13 @@ int xe_hwmon_register(struct xe_device *xe)
> >  
> >  	xe_hwmon_get_preregistration_info(hwmon);
> >  
> > +	hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
> 
> What if vram_count is 0?

then we probably already skipped on the vram_id >= check above no?!
But better to check indeed...

> 
> Raag
> 
> > +					      MAX_LABEL_SIZE, GFP_KERNEL);
> > +	if (!hwmon->temp.vram_label) {
> > +		xe->hwmon = NULL;
> > +		return -ENOMEM;
> > +	}
> > +
> >  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
> >  
> >  	/*  hwmon_dev points to device hwmon<i> */
> > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > index 94575c476e3d..e1079eff72c6 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > @@ -57,6 +57,7 @@
> >  #define   PCODE_THERMAL_INFO			0x25
> >  #define     READ_THERMAL_LIMITS			0x0
> >  #define     READ_THERMAL_CONFIG			0x1
> > +#define       VRAM_COUNT_MASK			REG_GENMASK(15, 8)
> >  #define     READ_THERMAL_DATA			0x2
> >  #define       PCIE_SENSOR_GROUP_ID		0x2
> >  #define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)
> > -- 
> > 2.25.1
> > 
