Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4123D3B7EA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 19:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EC610E190;
	Mon,  8 Dec 2025 19:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="guLG4+Kg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F8110E190
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765223619; x=1796759619;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p7wlpWQuYKzDE6DtxNBzWkegeday2ISNYDTEPiGIxNk=;
 b=guLG4+KgbgnmW60FG3vG3dLHVSA1H9UCiuGf2umtofi2HC215MnT5Y/G
 Yt68A5eabqbHVLumEHi4n42oIojXaXtKFa/v1Ntg8iO3dDLccDzQl8Hta
 gDVnhFGhwlpEYaGdNXhXqbSyizqGL0CG5txzH9Eg6o5BiLOWXFtIJvy1G
 MgNBYxK4GP1nRhZBRy1M5KvEhuKyhomWxqemNp6LvCjjg3J5B3lwBgyQp
 RPtp8jhQbzqHNciKMfHbHMSUfOZFppmVFBXDMI9kcI93xhEaPDEStIxfi
 B4RdiKTYkT6m3WQyi3399ZXStqs0JDrS1WxX9IZh0vl0/Lol9UfyQMyo7 w==;
X-CSE-ConnectionGUID: BijrGbqCSWyZZPKUxO/oFg==
X-CSE-MsgGUID: TNgoR6f3QmqI5yoY6OFWmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="84779749"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="84779749"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 11:53:39 -0800
X-CSE-ConnectionGUID: mQ9B+QftSyiy0ISk8TFknA==
X-CSE-MsgGUID: x9EWjHHxQBCaGNsCWmfRPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="196483871"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 11:53:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 11:53:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 11:53:37 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 11:53:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8BuLR2VAq0PYQIqcKGWRDlTPe7WjMKBeItJGNuE3rGlmtjsG78kJgrHcDSbTy+6TlCHmKhLFy+5WXViUTePF53WWamU/hKj+E3FUrMvhRyWR6Kg9x13tBQSfDNADV0IEmXsitYPKCpfBdUBGMpSatjyerqvIRKq2zH94kRW09ixDqX6OPZwjexU0rUe42jhjn6pJ3mlVUCOYCS2mV5YmjedU+TQYtGMM1NcFfgGEWShvTZb3gabOBOvszW6YWMXBJUcOou+6gwtZDiSiJh7/Xd0HI+rfg7zJt4QqdjS5rE2ydBhJAoJ2T4c91VCd7zdzFdpzFXydhi0MORf843CRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVYOn5x+O+JfNpPHd7H21lpDX4Af7hRlWBNBxmukCp4=;
 b=eY/M7U4SlL/Udl1+fkOgEZIDjBRpLU/HLyQHDh5HUlb4sZZ6xSKRXMZJY1uA2BKO3tWkms+S+BGA7/RRaZlHc/AtfyKE2whBS0vy3jbWb+5NMQYg3JSKXBuRsun7sWt3Kdf5ehnqTuMlG8CBKTHPwCbSIuBzAnkJCkfjaR1uGq/sd4umccHcp5GIaMiLjMB5dlVhp9uFO63iCfJo2kbYcYDg8RnqhEIr+Z1A3lfE0bBPb90Bv/MbRnhxGprgXutLsJgcHnyIvcB0secdlzDIKni5xjU+PvBPNjKmq3E5bvumZK21pnZVIV8HRoVC4fHyWZqrjm90OtTFwex/BvlvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB7072.namprd11.prod.outlook.com (2603:10b6:510:214::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 19:53:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 19:53:30 +0000
Date: Mon, 8 Dec 2025 14:53:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/oa/uapi: Expose MERT OA unit
Message-ID: <aTcstlSxNvhYcY6w@intel.com>
References: <20251205212613.826224-1-ashutosh.dixit@intel.com>
 <20251205212613.826224-2-ashutosh.dixit@intel.com>
 <aTbJDZhEMqU8Rg62@intel.com>
 <87345k6b8q.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87345k6b8q.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: c3233c87-6243-4135-5c22-08de36937602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pb6mwex5ZovjwByu2RN+bHP5fLVmE9Ff//4KDtOUVoYvgXpNbQS/2F0S5Dz9?=
 =?us-ascii?Q?VW9ic04bw5p58fxLxT44mLZ6K+aHNnUraouOmYbf+fDUJ01rpxXkYh8pQV7u?=
 =?us-ascii?Q?5cwq1xikS+p5+UNqnKQzwYsO65OAjnuaMKnc6+94h0eTg/usIjS7xCTUxasR?=
 =?us-ascii?Q?3jeISPbvvsGs5R/KAUM5+AwWqw1pEtmxQZBkM9oCdDdspXo5B5/SctmtYlhx?=
 =?us-ascii?Q?vbAgqoPLywpMYKcZ5gl+l04Ryym1sNK7d4cqGBM782fCikh4KBaGRUhrZBKM?=
 =?us-ascii?Q?xqIobwDvDd6eqiQ9VHZOuiG85TEU1bwein6mj7BCTZdNxEntmOVH51xy28T3?=
 =?us-ascii?Q?40FTBAedMq8R0+kdHMUHstZdd73FhGpuTN8AJiT9fmdIQj00qNh5pWythtw2?=
 =?us-ascii?Q?6MmKni/SCWr7il5A8bHmvrVUJQV+5MSJcz8mX7LOjoJjDGESLArfLUi8hKAy?=
 =?us-ascii?Q?5sdNd9tqTHUi4krk8MDLa3xcdveTYopYvcLS9G5wawATCGFsMtB58jBZdu2J?=
 =?us-ascii?Q?QAXmy2aE5QnEOZgxc8yrFAVrNbZXdbj0uF7/jtllJ1NMw8PzqlhgVWCjoDzV?=
 =?us-ascii?Q?FdogXSkgTY8DvBAmxwB22KpwjL7oY8Gq9RYNGYdHwAAxWw6IrmO4IiGqalwC?=
 =?us-ascii?Q?41sF+HB+lZusklBlcWHD8LMcREaEysK+4i9Ltzd8sISi+bLJfl75xxAjBTCa?=
 =?us-ascii?Q?ipQvQq8LqIeTUd0Hne6xgruHIE3FV3OzjVXRRtvtbNnd8hWLadfbUfDTNcX9?=
 =?us-ascii?Q?a+A7XKhr/BWg9GYklhbn7KkkMk/7U/gyq4lf/y6diwGUVxz+Wd/mAr2bU+pW?=
 =?us-ascii?Q?eh7p/f1x5KkaVOVuf+EyGuJu9rWCj4zGk6Uw3+ew2Xrr4nC3uTZYjzOokEK5?=
 =?us-ascii?Q?L3rcOUoNB1tFBgaAeI8anoGVNfFqVqrbj2x2t1LYbaMfP0It/V+eU2YgDM/g?=
 =?us-ascii?Q?u01YtYALUfQ3+0sC860d8vcQRr4sXgsD+wYYJYNGigtFwAlzjr+OjAaBDqBt?=
 =?us-ascii?Q?CGwpGiYybXQfOLG5h54LP/UymPWFHxSkMPpY379uWGtKSFJ8l6NDLyNv4qXQ?=
 =?us-ascii?Q?tQsGlvfAMUNZLNKPM6tRyAbwhaF5rNqqKXnUjbvJFghTMMxCXeUrTGMCxeAk?=
 =?us-ascii?Q?Gi89Can3gYuWj8L4QTey0FzaiJ90lz7lhMWvnLndxch8n5w5ly7Hc3kG4oCY?=
 =?us-ascii?Q?8QmlBlzisEo4pOvo4Z804DaociBW2lLGKz/EQCh0aYdeRftWNdErmO47NW+c?=
 =?us-ascii?Q?ienGEspeVhbGywcI4ntsP262jSIYc75uJLsZzkZ5XgGU9IunGK6wzeRuntji?=
 =?us-ascii?Q?NjBHJDjndGdCr5w/Fi3xRuIgz3c6tJXwlceELxhRDA2XLM0ZUHIAk/yKRVpV?=
 =?us-ascii?Q?slOs6mTjjC/xc45rdpnti0JxfKqPC/94vC04Ekk0KkoE3pyt8/k9U3cZPN93?=
 =?us-ascii?Q?vp+XKIKOWyMJ7MEdYB4bG7SUdQiLJAFR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?26LdU58SOmErZUPKoEi0HPP0FoBTbVx01kF8Iqv6rH2+fgh/aUak+Ci/B3yO?=
 =?us-ascii?Q?84ZeBodiaG38bK6O57A2xM6m5Yj3Pw7HNxH8Tey9hAPI51USeWsaccionpTA?=
 =?us-ascii?Q?R7Umf4Yp/CcNJ/ICEiZkwlALm/O4oSEy0GMaphP7rp2+FOgZNgDVUjfbJG0p?=
 =?us-ascii?Q?7OG+a73sa17yso909WahysDtw1DN9UlZullN24NxYC7VmmnXsK72wrqB6ZIn?=
 =?us-ascii?Q?TNPKkBbksRQ4VnyI/DUqCqbshvpTqLtqtXyS7ES9F3nBx3eyWGLXTOD4UaOZ?=
 =?us-ascii?Q?Z+VFoJmok+c1AiODmXn2cXFC1UZI2vAbpkjic08uXvWfPZ0Byzorr2DzZFBC?=
 =?us-ascii?Q?+XLVjPUasJoobulJMAQu9hg4spocTMA3H6l8GtXopG+7onbrf0Krr33u7gxK?=
 =?us-ascii?Q?NMR6nd7CdvzgPmkhKMe8RuQqnHhfq6iqK0HiYuiDMfxFatBz5FxJiyXn+pk+?=
 =?us-ascii?Q?tH1OohEoO14uQAeQR/VxqPsS5IjwS2X3czlTv7cUXM++ZJ730fwAYbNDE2Sq?=
 =?us-ascii?Q?mgwYLsE9eAQU5SUVek4hAE2wIkzlw0ii5rxqHnXdgNVTVAHa0rJNuERwFrko?=
 =?us-ascii?Q?okj9+Q2Z+0w4UVfhEqnSXH4kighI9UVAfu0Nuuk8IY94xpQ07WbrwHoyHDJv?=
 =?us-ascii?Q?DNlXGBHkuRRuTXHzYQYXq/F7E/hzF45pLMk+AMMS8cPBkHCm+/QRn2HdRkL5?=
 =?us-ascii?Q?Wzmm7VCd9oGEYJSfTOj/8I9acGPj8HqbjbsI0P6x7b/g5XT0jaCiyHORv6fb?=
 =?us-ascii?Q?N6ssY4rhmtwibc6WTkfeHLQ3xkoC/UHcdxtRYzVNMFYInj2Se83tygU2Z+kw?=
 =?us-ascii?Q?P8UOzRIpzfh8gBajsD2BvAewtsVQn1KA/5nxu5Bvbk1Hdz7oj3NaRjNU0N/p?=
 =?us-ascii?Q?+wkNBVXMdXXYBL/cnZL3tiCW4JpQLOZOXhzGLx5ibqTUgeQjE5SUjweS/qpY?=
 =?us-ascii?Q?/V3/hebn4t8tcG8OBI9ITGklvdEuOaw2Nc9nG1d7Yf3+3Olc6pF0R0iU8Obc?=
 =?us-ascii?Q?zOVVrHuJZB6zNdQyl708vLO3zAQh3itma2K2jmzCBMGH6bu260F/glEnH310?=
 =?us-ascii?Q?8zWbsEzA9eERIvvYOaJdj1qj+vmQh9/8TvuDP23Mb/NUKFitCL/nZFny8lFy?=
 =?us-ascii?Q?t8WkRqpCfPGVT1n6wfPqp5Uxx0pIsAgZAksJhNHAzVDQMmgxmmm/ehHU69km?=
 =?us-ascii?Q?OIszfGvfPSVxbc2xZDNxVqkMlO98qXPJxq3U2rgFS2vtb8O5oms+gbFHp6xP?=
 =?us-ascii?Q?6SEAAhm3to33kZ5G6Fh7s7zN8fLdgHpDW/FYSICCSNIdpuvDiJ4Thj9iY2NY?=
 =?us-ascii?Q?xByyDn65hCt1jCj1FcxbDXQWBvgwD266YVE6fp5rS4Fnx8lg1R4ma5cUGxeH?=
 =?us-ascii?Q?dKS+Rbpw+OyUVRpCHvOqfl09bVdNjBg+GzxLew01LK/t/Li+eXU+HGiPfrkk?=
 =?us-ascii?Q?LvB5WBWOPXbm4WYM0TH//s+BZ2PW+ES4N6ydw2iZ9dflUFs5JG26Vyaogp1X?=
 =?us-ascii?Q?nT17yJoi6OdBg4qOlpu2g+FuaC84vk803FO6D0Kgw64BSIvzG1DtrGJTv3XA?=
 =?us-ascii?Q?ZR5HnrA3iDYBfrjnt7IG9zKJpaUGM8v2+D3GoIzS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3233c87-6243-4135-5c22-08de36937602
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 19:53:30.4591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xX0CqbDF096rs4gEFnwkjDgEC1wwdMtrhfrsIoOJycHOThYw1CK2A2yqpcYxiaBBvyZ1lwUAPpMXzGaFWnUeBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7072
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

On Mon, Dec 08, 2025 at 11:10:13AM -0800, Dixit, Ashutosh wrote:
> On Mon, 08 Dec 2025 04:48:13 -0800, Rodrigo Vivi wrote:
> >
> 
> Hi Rodrigo,
> 
> > On Fri, Dec 05, 2025 at 01:26:11PM -0800, Ashutosh Dixit wrote:
> > > A MERT OA unit is available in the SoC on some platforms. Add support
> > > for this OA unit and expose it to userspace. The MERT OA unit does not
> > > have any HW engines attached, but is otherwise similar to an OAM unit.
> > >
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 876a076fa6c0c..f520462c28643 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -1675,6 +1675,9 @@ enum drm_xe_oa_unit_type {
> > >
> > >	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
> > >	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
> > > +
> > > +	/** @DRM_XE_OA_UNIT_TYPE_MERT: MERT OA unit */
> > > +	DRM_XE_OA_UNIT_TYPE_MERT,
> >
> > And who&where is the usage here?
> 
> Sorry I just merged this. 

No worries, I just force pushed it out.

> I will provide the MDAPI UMD pull request for
> this when it is available. Hope this is ok.

Let's re-merge when we see the usage out there.

> 
> This functionality (memory access counters) was part of OAG OA unit but is
> now separated out into a separate OA unit on some platforms.

Yeap, but any flag or anything that changes the uapi we do in the defined
order:

1. both kernel and user space patches are sent out together and reviewed
   in paralell.
2. kernel code is acked by user-space developers (apparently not relevant
   in this case)
3. kernel patch lands first. (Here we have the user-space review already
   finished and ready to get merged)
4. user space patch lands right after.

Thanks,
Rodrigo.

> 
> Thanks.
> --
> Ashutosh
