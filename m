Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC25CA1007
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 03:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3528B10E091;
	Wed,  3 Sep 2025 03:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQ+wyF9i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E752410E091
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 03:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756869525; x=1788405525;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nOZsG1CaNVRd5p6pywIea+t4KfXLcDBpxvm909EeHVo=;
 b=IQ+wyF9i2GpgUrRskj8VPctNfccrsT2kRFsplyLvhbIVsDhVUCj241pT
 Lz5BD2VvHWKCdp5JytuLlaJaBATv938opWgEYb1Q/PJLOWFz5j8cvYEsS
 r7idtQ+UyaYV3FgTWvsiDN6pcZ6c4F3+W3Eb4OQBqBElH57UIzqE5N0Rz
 yjNBvzz7QvMmg6GgAzrhmEMXFYRhN16gl0Mu126uKx6qMESmu5QuEyO93
 2pJ0gLu1oUd6cGZaHbmqytK+rlamUIJRP67LzoGczkVknkzHh+ZIhQeXl
 Wg7rY7DtKumYjLX2p/qHJsliUtwezEwup3Hhr8SYrZyA9nrNjtJ6zZwAX A==;
X-CSE-ConnectionGUID: WIMmDtBdRPywsGXETaUGSQ==
X-CSE-MsgGUID: mjGdFIKfSD+M+0MYj0OQcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69783552"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="69783552"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 20:18:45 -0700
X-CSE-ConnectionGUID: XQHWaws4RnK/Jd9cziMjbw==
X-CSE-MsgGUID: jkt1Y57XRuOzjPb9vklVXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171430371"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 20:18:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 20:18:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 20:18:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.88) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 20:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cW8wW4RUuDk6dJe67TpgssnjqvPSv1MRMcmzefmzX3z/3U+nA4P2gYFlYolXtweOeCDzlufM1EixiNbFHbNGGU98ouG24NXqLFC93oskAOs8uuf/RM6/yR6QyczsgLQ+JSUU5Qm1RSF5eZFPk/fkzZjMOXFKGo/sGql5HXmQIYGWE9IDx3T/UzSNe+Pqdy5dL93bfwUFyzmNM/NdeQDThMNudI9OeqrXf/lw1dMnZb2SYe1nnqwZNYg4YDbCToGpUWewtfbGo3qI5xPrNVKivW3U4/bZUnlkqXeyQHrNU3/BV4T4XpaZ+PYKq2FXQbNbrlIsjH3h4PvUv61XWkpmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVxjc4lTBG00cUgf4GtueRnHHC4Xgsmpmwsbu2rKkjE=;
 b=wPgx8JYA3hszFNm7WLlNlekSf1DwCH9pbwpw5wAk5kooOlGZvRyo7y09C1z70xKbtY86dHcFSU9pNdZMxp+gt3Q+Y4bQgzHpQlw7aw1bV2gqU8k0fqI4CFcqh14bLJgbk1ZBhmUj+pZfHnslhBcKkigZ6nMB6xyyTNwPFEePP8YkXUTP7RNa+lbhNJfAxMY+ZSM/i3GhTJW53+GczgqAE1BjvleQH3J/07d7i836yDtvt1SJvx8blujbDv+Y7+GrGKWDLEg5/ycMkn9XBEh0A0GNi7s+bQ4dlOKfUj55SjCAp+ITycu5bzOYcEAh5mIwWyDqDmKg+UYQBrEC0qdnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 03:18:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 03:18:42 +0000
Date: Tue, 2 Sep 2025 22:18:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tilak.tirumalesh.tangudu@intel.com>,
 <gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/xe: Extend Wa_22021007897 to Xe3 platforms
Message-ID: <yk4kxoiczhlv2e3s76qxhcxf4tahjbq2k5fcdoasf4bnwl3ada@6cyss6md6dh7>
References: <20250827-wa-22021007897-v1-1-96922eb52af4@intel.com>
 <aLddXOsbPyXeLDIL@msatwood-mobl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aLddXOsbPyXeLDIL@msatwood-mobl>
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e714619-36ca-4c9b-8a89-08ddea989553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bgN5J58Bykml9IWeGOLm1pKtgue41thsTsi3o5bSUdMvS+HqiI8qSNTh0GZ/?=
 =?us-ascii?Q?MebVfVcclzdEfwBcGv0w3MNTh6Ke+4U03gtm6q7qyY9WecUC9viHDlWFewRE?=
 =?us-ascii?Q?atlW9M6n0JkKJFHVC8mgdOPG2r/Ft3SzBZA1fomNtHYhZvfYY3qanlsbW9Nb?=
 =?us-ascii?Q?ix+kRfHOdPPJ7CmiFFJchYm2MogzU9cpY1b6K+C0pDEGaOTF5Su9v7ayZP4Q?=
 =?us-ascii?Q?3SUeIXw2HdgsZYZHAG+CS7/T8DxXScV09VPa87naZn72ilzQ+JnaxlylQfoh?=
 =?us-ascii?Q?fbWUI92A7gnctlWH2YACq7bO/WO1LLiDTXwn5IDYyuzNyw1ypPSuHaVhNEQo?=
 =?us-ascii?Q?f5DhLaWVKLl2nXlyMHvNCzSNdbVinHYYHe+YAgNHZGTGlXFl13jyRmfX3UM6?=
 =?us-ascii?Q?eiNhz2/8jR8oP2l33joAgDpKzzBaiTkIfsbp010eEui4Z/IUgGbsb7oYYHvH?=
 =?us-ascii?Q?z6P3SUOpXi/duHyHKFjeZ5XkPdEoSfrC77pv6CZJT1adODSu4bLiSNxZmCnS?=
 =?us-ascii?Q?CgY1BH7JMVxNjoPrW51NHzDtcTA3bY82WO+NDeJomvvOTS4f3lZY73Vzi0hE?=
 =?us-ascii?Q?i6JWQHJhkSGdoR+vrcwigPLxtxLHt4YIJr1QW1mga7H51Marhs/iodidnAmU?=
 =?us-ascii?Q?R4KdlZEnUNVqE7s2gAcx3qEi+X1SGlQZcUEygApfPRCrSYhjBF8/5DwhhWvN?=
 =?us-ascii?Q?G2bxSdmaR6pADkmAsf+DrF7Gicn40Z/VQx1E8Tjz1zWfkW78H7ATk1l/6wdM?=
 =?us-ascii?Q?HrOsBaWt00rmF7iMsi/ERq/PtBS3Y8rGKrUsiXrK56h+iNDWKMvjyjn3Qve8?=
 =?us-ascii?Q?TBOgkJ1NLVo6339J5sKe7qu9U2soeBb37Oy39ITDn1il1p+2ALYoL3EmrDAr?=
 =?us-ascii?Q?c7/tUiG14Sw8rbC6hc0/e8QtTpODV1LW5uzs6Cq4XX3+hWEx+xpO3vYx+UOj?=
 =?us-ascii?Q?loeAkgKNO4Z92/9KO1laMI4gKAIng7Sngcp0dhmBowC5ZSf/o3iqfLx+UK0c?=
 =?us-ascii?Q?iAhFMLKlLYLKxJ3V/NZ30e99Cn/xAP1HZfCNPewz3g0LtK78w3DC6TrwCeTC?=
 =?us-ascii?Q?/Kfl+ax1nHK6H9yvtByYP70gemafo50d5m3YJDhp9DicuxUXq27oA0lQtBUb?=
 =?us-ascii?Q?WxGJcEv1Ek6mvIOMGw/tSvD7yN0LUFYOwIwOvnXgLURWTy1NUXEhCx4jEwJm?=
 =?us-ascii?Q?gFUgwhri2+2IsM5tvJvkaK9KmYe3piFyuHfpfvKagJJXNeqegkcXBYJMMQhB?=
 =?us-ascii?Q?dU6xXZ5kOfXCVZ71S+IwbU/Dh1Pg270IQJj4E2YuWgki/MhLlP4t/uf5k6BF?=
 =?us-ascii?Q?LSrkilIDcxH1cVp7q86bBs/FyjinxologM1jaZJgaBTfWU8lYQYZy4zddabZ?=
 =?us-ascii?Q?3Ltx6BOwtgNcumLrkoidbgf/awQONMW063vmb6u5drIQ0CaPUXSHQI55G15a?=
 =?us-ascii?Q?TnYXkQ1aY0o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s2i2RKP1ZDN5Z6y9BixCIMfPPo5fxqSguwkGudCsUlflVjPgjCeKT0QzZXb6?=
 =?us-ascii?Q?67gGIMVJNZ3M84RpVFtwkI6QSiFoFDI7Np5GKRq1gT++KGJIrj+XV18+n9ER?=
 =?us-ascii?Q?AW9xj6rqyOO2mfLjN74/ZVMIh3XuKcdbbglaghtyqTUrZxLjnp/kmzg9sMe/?=
 =?us-ascii?Q?h2WDuvHZWfXU7F8E0tQ6EkBDpmLJKSsEu6TIJG9Vtmv/DDxLK6DQ4bC86+oX?=
 =?us-ascii?Q?TQ7r20NoL1PCyO0cFT86Le+aah89m6ExPTmz/SkGz1bxwnPE5nfLjw0AiEqt?=
 =?us-ascii?Q?ySPxmeB3mze6Ffvo6ujPGH3D9sZvR7hAiGcUk/YbL363zG9PwGJyIBQCB/Um?=
 =?us-ascii?Q?8wuW+q9HUDCUTHz20WLtMGBtEWp/AUUqfGO1t+028PDgHGtLbhnw+D0X7FJj?=
 =?us-ascii?Q?Oqb+9GJLjCNXBJD+N/YOZJ0d3jq1qMCj7ygsiBilMzpIoiSxKpNOwL97njFU?=
 =?us-ascii?Q?H9vGESXrTNsWdBdLa+8m11NnnLHhM30pJ4FcA3IcxP1ozN0Y0/Guiyf5k2Er?=
 =?us-ascii?Q?TITB3JzkdfbcGLFOBY8Pqgb3xBmM7eHLzHh7jBHyylu4xmEVomd8NJBoSYbT?=
 =?us-ascii?Q?aFNkT0Tbsj+iVUC99nOWEJrFftE1GL6+7AyN5BiyX1qiGYKv5orpDyqw+uNX?=
 =?us-ascii?Q?E0MS9nn/zuXWec64pPG3Cy3LtGiFqQQoxVghdsR2BzisKZdfYqHEdWQxl0hB?=
 =?us-ascii?Q?7Cozn2SSabOuno+60QkXX1CCey26j6zlgxWjFNpOIwyl2xjR3jImmOkm3Njw?=
 =?us-ascii?Q?NoDQrhGss4xyeJZzX8bPncOSAFaRRdXaYC9P10EdkFrSp9BboNjzbrmcjahD?=
 =?us-ascii?Q?EVK14967RwItpyOzifo5x7HnFZ3NQgRPFfUmzgW72/6iLdv5UJer8iT2Q9a0?=
 =?us-ascii?Q?cl6ftKvxlhS106RxiYCYMD7jjmI8nYI2/FZDmf7ITPjMqtPXpIjReuI2BwFO?=
 =?us-ascii?Q?y1XsF4K7Hx+tctI0NDQmg+8BfpDQ8f2foj15nCctPmtWa5az8hMEjG3/c+/a?=
 =?us-ascii?Q?DR8Oy8lz7EtQ7DeH2frLM18P/rcxvLzpnKifm9gTAQ9FbZ9+7Ax+cLHy5ESd?=
 =?us-ascii?Q?n0Yc1y/4t7qTCdD8r9+lnfxOxsttOSfWaZ7eJrygIMi1StV3e7Z54uvKhjIk?=
 =?us-ascii?Q?2GoezMnsIRA65R6EUEGWIfyK/MKjZpH19w/BTStSsskmWB2lW8ppsAXQEqO4?=
 =?us-ascii?Q?Rdx4s4UMXx2pozldyBefgy5m3jKgar4ZmewQ2ImMlW4hYvok5rs/dUXuH3EW?=
 =?us-ascii?Q?95G2lF+wOyWZAfg+ud3ibzQRCzVJZ7+iazm8Nbhhy5nkvcfmWbrzFFUcwt3b?=
 =?us-ascii?Q?HNphP0STi8KmIt+somlUBtvlPqPCZsDT68Qw9Nn++QWe8HnUw/qIQBInkPMP?=
 =?us-ascii?Q?WvWnnY6ctmGdDAQ8GZa/S2/9rRvUI70TTMHFlGZV50eQKpamW5cUmonLMUIO?=
 =?us-ascii?Q?N9tAZAMaLoqnBXpoYe+vAkX808HGUM1+m+VRpZAtByOkRFE4aoA+UqSk0ac+?=
 =?us-ascii?Q?TK9yWT/GFLi5EzwLHxUy7zpKm+17aop5Yadq92yKBOOw95z+09O2dqJtD7y0?=
 =?us-ascii?Q?8NHo6uteHaaIuQAQW2PO3jD53adrwLzU+2GqOFM1DDCxzqMH/7ZTZoEQeECW?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e714619-36ca-4c9b-8a89-08ddea989553
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 03:18:41.9614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QAgZMozO1/P1N6i/N7AgdRkYmvIu1A+04N3DxpL19IoUjKQugMIHApKdmPXHL6KZ22OURGhhWwVvWS7E+ZOduizYa00GkIsjEmbW4oeNbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
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

On Tue, Sep 02, 2025 at 02:10:52PM -0700, Matt Atwood wrote:
>On Wed, Aug 27, 2025 at 12:57:55PM -0700, Lucas De Marchi wrote:
>> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>>
>> WA 22021007897 should also be applied to Graphics Versions 30.00, 30.01
>> and 30.03. To make it simple, simply use the range [3000, 3003] that
>> should be ok as there isn't a 3002 and if it's added, the WA list would
>> need to be revisited anyway.
>>
>> Cc: Matt Atwood <matthew.s.atwood@intel.com>
>> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>

applied to drm-xe-next, thanks

Lucas De Marchi

>> ---
>>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 52c7df4c3afd8..e53edf1e5100c 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -879,6 +879,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>  			     DIS_PARTIAL_AUTOSTRIP |
>>  			     DIS_AUTOSTRIP))
>>  	},
>> +	{ XE_RTP_NAME("22021007897"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3003), ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>> +	},
>>  };
>>
>>  static __maybe_unused const struct xe_rtp_entry oob_was[] = {
>>
>>
>>
