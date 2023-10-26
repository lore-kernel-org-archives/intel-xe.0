Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0A5C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 14:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E9610E7F5;
	Thu, 26 Oct 2023 14:10:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C836F10E7F5
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698329425; x=1729865425;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=0JnVuFQpeKGwKJPHJNKsjHKDX2cOLTAK2roS5OsgEKY=;
 b=dCykCUO1KkhIXOTWk4wbEvfA9GCTokJRH+M58KbVycRDhcOA5jmwqINE
 Buu+I/D8wnl42Gcet/McYUv2loZp2Wnf285lmnR4sEXPPI3qxWIsiprst
 lZpHXwNkdGYPIx1oZMz/S+YlXbjEO5BQLidWYUEwFNDfWIqHBJlgv1l4O
 j1JC5KQFpcUW014OIOL6t5qNHXOjrvOV+YA6aBf4L4ldNWf49Z8u1JfHt
 DmamQUc2dGgZxKgxnwLFTkXnpfArw15WO/44gD+cXylFvt2j667XPAUDx
 Y+vm28X3Lp0NCyvWuWzhwxSl87tLow9IrOlQ9EHBj2iRsihWMTKGBkjEa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9109641"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="9109641"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 07:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="875959822"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="875959822"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 07:10:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 07:10:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 07:10:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 07:10:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 26 Oct 2023 07:10:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoZTmdjpa9WLPqsRspS23VsiAdFxrQhzA88wWPPNO2LYcVceSHkB49BIFnR6tdP8ZDH3q7fPF7Sq+brLoG5ABwPvTjbboLyCm15L3yQvLrsCAugOzrHUVibcf3GHU3H8n4IrYKGhAqFXbTF1n/1W4cWoX+sx/BuI/bww8oAagbswxwdXmY5b649x4fU1YLsS4JxA6mf4S/Wu3a9T9JtOK+HFWdeSABIeGTxxYd2OBYoNhsb8ITI7isvUctgjZ2Io8lTO4eEKY79JeiVd9MHtMAP4UhXhrN1DeB+GMuzXYLZoN/SRA2i9c9OaXsqD64uo9D9YSGcClnDJbMMxqDONxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsLyWSWKHp3uYsk/EkJ6J3UmNb0wex07B8LZYZcp32A=;
 b=mhxrhwv6/7JLmzNgpoez8f4xYRGAkWBwlFnDpubHCCYYh5sSPzNUOUh4sN9AEfbEZCvmwlqtinoR7z7O+ljrqkOf9otQDW4lnlOHbyXExrvrEx4F5SBN52+M9GGR5HaNpi9phlhSqgh3cx6L/OffmpUaP8kznDDWuWmJYXRstps7Rb9ZFkPsriCc2tQS8ekeMLQai4CbqK7Cn8gYu67hpO3ddRfZokyJoNANqGeZrKXM/QCSyE2/LvafUI6m7Od7S6lzlI83ZLIlNffXpKxKW8M6DqnXBKY51vxF0JTmhEykAI2YNAvJoEOrNAxi0eqz4t6nfASpmD/6DYpOoxoCRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by PH0PR11MB4837.namprd11.prod.outlook.com (2603:10b6:510:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 14:10:21 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6886.034; Thu, 26 Oct 2023
 14:10:20 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231024220739.224251-3-lucas.demarchi@intel.com>
References: <20231024220739.224251-1-lucas.demarchi@intel.com>
 <20231024220739.224251-3-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 26 Oct 2023 11:10:14 -0300
Message-ID: <169832941486.1500.12082880042818649394@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|PH0PR11MB4837:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3fef30-c1d6-4641-f520-08dbd62d4998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: im70r3LBDcPT052Q84M3RIU6ZJ6V2b7A/y5M40wmNZxls6nHe6B4kRfC3KKasrsW3YPawm5ma5Ofs2Ru9D7b3Mn3VdGyPjIFdsInESwV0SrK2AQdyj+T9rLb7OiHEvroB+JAPxRWtnKe6t6TnlL5+H5vn+rLxQJsWZ2SQoz1rKnq6P1X1+Jonrry5qYEFpDLThNB0z5rc8Y2oz59PCwsULo7tMvPT3MINpS5tpnqzPjlRiilsBAtdt4FZGpUbBjACDVjr8GR2HRuINfd1lk6mEAGFCzrm0rFlW2xOEtOyIZYT+Kc3VkaZkwJhBEkgRGZp88SIF3wUPMMBTZbs4zSsPFemdD4kUHYr8LVjIGZO/e//Cw7vx/7iYI+OHMym8prxWOkNxNsIu0HLjNWjd4Vm8mUzTf4eOmU3CFgMx+8XzoZrF9W4LXqDdicsaH8tryZ44PbA1X5mQk8EEwl6hoYppZyXfpU8gQZBQP4mFe4wsLoE3XgjmeStggFQihdaMt3fTEpXtNH7rZn/5tY6dMNaoOVztGh9YktervhxgiKKMABFiKLBbydKCDdLTPYH4Vm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(136003)(366004)(39860400002)(346002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(9686003)(26005)(107886003)(6666004)(6512007)(6506007)(8936002)(2906002)(83380400001)(5660300002)(44832011)(478600001)(8676002)(4326008)(6486002)(4001150100001)(41300700001)(33716001)(316002)(66476007)(66556008)(66946007)(54906003)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjc5V0ZnY3BBYjNoYWNKOE5yUHFmMzgxS3l5V0E3dHVLV0ZNaHBic3hMMnU1?=
 =?utf-8?B?aDNVSVVwQWU2UUMwZ01TZElxWUltcERmUkxlczk5SjYybElxcEZ1T3dNQU81?=
 =?utf-8?B?NXFUa09SUTFGV3lJSVg1UXgycG1VcTNxMXhUS1ZtVnQwZGJvTi9XT3h5WktT?=
 =?utf-8?B?Zk1tNytsLzY1N0x6T0ZGOVNaeElha05BMVNIWFZrR1hUMUNrNGtDK05rakda?=
 =?utf-8?B?UmxTL2N2S1JMbzFNdC8zY3h6MGpvRGorYzhFR0FJU1FZUWtZaWYwWTlScTJH?=
 =?utf-8?B?bjF3MU54SVhNRk5qVVJ4Q3VKand6M3gxeEhjeXNzUFAzS0JkUzIrWXFlNkU0?=
 =?utf-8?B?UUNFMmZvdHQ0eVk0QTZHMVg5ODNpeWF4aUx5QVNtZytKVTIwMzQxc3NWSmRZ?=
 =?utf-8?B?NWNMY1Y1OG5FaExueFhZejMrdzYzRW56YmRwWkh4OEtxVUNXNUhQOERqMlFa?=
 =?utf-8?B?bUNaUDlLNkNOMHJiM3Q3eHFzU0hSeHZtREhMY1BGY1ZnK2MxZC9UeUlwbHB1?=
 =?utf-8?B?S2JYYXo3WXZTbHQ5Z2E2RWcvUW9pYnU1WHhreGFSQXpneXZ4aDhZNWtVTGxx?=
 =?utf-8?B?MWxXa3JFZGxLRklheEZtUWNZWXBQcFViald3Q0d2TzFMbXZzMzlZZHJWSXU0?=
 =?utf-8?B?Qy9SVzloOEF6dWhBbG9HT3E4SVdlKzlDMTdhaDNUcmJ6NDRPWDBYUU5PdzQ1?=
 =?utf-8?B?LzhZWHNGRFlTakNJdG5ySDMwQjU1bkttWXZCc0RHckhxMkZBcFBiU2doSFZB?=
 =?utf-8?B?V1o0Vkh3eGpmMTdtOWpWUXdacVpJdVJnNDVZeE01NXZSNE12eGY4Wk1CK3h4?=
 =?utf-8?B?OTFFOUU0K1pqTmJ1MXV5M3hJbUNHOU10L0JjRnFUZWNpaVNuRzJyWEdCQkxn?=
 =?utf-8?B?Z3lseWZXWW8xa2ZkOU9BOWNkY3ExTlNkU2k3Ym0yd3JoZWdUbHNOQ1Yrc2Ez?=
 =?utf-8?B?NGZWY1BPemxqMXFHUmVub0NoZzJFM01Kb0dLS1lZeFNYV2g2TUpUUEk1R0Vt?=
 =?utf-8?B?dHNraTNpVE5xeFdOSWUwSWxRU3ZqbTJEVWZod0tETE9PNmdVa3JRZUNVU1FV?=
 =?utf-8?B?SFkwSjRBSUI2azdLN2pEQUIzK0syOUhBOEpyWFpxTjJ1eU5kLzBjUkxMZUMz?=
 =?utf-8?B?SThUdXI3dTZMSHJWSlZhRE92VEt0WmNVVzhFTm5BSVdob1ZCZ3dNWS8vZndz?=
 =?utf-8?B?WFhvV2J1bGM3Zk12aklTWjFjclZ5cUJmUVFaNHptUG1XUlUyMnRSNDduSFRF?=
 =?utf-8?B?cmVyc2o2Zll4VXZHL0ZBNTYzaC8yOHpXMi9FZHJ5KzIzU1h4cXc5UXltQ21W?=
 =?utf-8?B?VFpQQ1AzSVF3VmVSMEtHMFJpeXhORnRBeHJwWkJ2c2ZmL0xCN0xCd2oxc3JG?=
 =?utf-8?B?RTc2b0lUNDVUZHFMSFVrY1F1bysvdjZUZVBFQ0Y5NTh4YUR5MkU1NENOMy9B?=
 =?utf-8?B?Q2FnNkJPRmswQjFqU29CR2xma3Z4TFRleFpibzU5UWZhalh3dmpHSUQvSkdj?=
 =?utf-8?B?VTdrMGI2WUkwL0tYancyMG1PTURzQkszUERPQ3pBYXpmR05mbzE2LzV5M3Bl?=
 =?utf-8?B?S2JGTkt0cnpnMHk1bklZVjhoZ2hnU3BBWWFsTWM4eFVRdFYvMXBXTytTRUZC?=
 =?utf-8?B?VnBRaWhmWGttSXEvWnA1bjRhSHNJWFFXaFMvZHZocHdvZkxIODA5REp3MDRi?=
 =?utf-8?B?ZWVDMkw3amZCZFZJa0V0QVBwYmZWRnJYTEJoOEx0KzhrNXhteDRVZEdMWDNr?=
 =?utf-8?B?VVNjUGJKeWszTzdUeEhqaGZIQ3dsNWNTYmFWY1ZmMHdacyt3R1grY3ZvU0hr?=
 =?utf-8?B?VXpMenZVcDkveVJyLy96TVQ0dHoxVUtlSTF3MzZ5Z3RXMUtCTnFQNm5KbXFL?=
 =?utf-8?B?Z0JrUVVvakMwT3IrV0ZUR29IeVZSaEpnVUwwcXp2Z0JtT1ROUld4VkdCSURF?=
 =?utf-8?B?M3Yzblhvd2RDbHhjQXJWNUlXNHlGbmZSVnA4cHpKTU8zOEozdU5rcUFGNjNX?=
 =?utf-8?B?dXptOEFPbkp2MUVYbWdMNzdSYWQ5dDB4T3pWdzY1b01xUjF0TEgzWDh0elFI?=
 =?utf-8?B?K0F1ajlrV0M3U2toektNb2kzVXhvamRqak9tZndlRjdsSzl3ampFeDVJd2xX?=
 =?utf-8?B?eTJWVm03MzI4VVFXbjMwL0pQM0hIWWl4THFqcVNWZG9mdkpRczAydk9uL3ky?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3fef30-c1d6-4641-f520-08dbd62d4998
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 14:10:20.8064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7/DMStueObtwqhYNKoFANqIgLRpNujgIDGHoRkNLwk1xcc+uwCCghIVLAsPNOgsM8Eyll3572a6G5vQGUGC+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4837
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Add Wa_14019821291
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-10-24 19:07:39-03:00)
>From: Matt Roper <matthew.d.roper@intel.com>
>
>This workaround is primarily implemented by the BIOS.  However if the
>BIOS applies the workaround it will reserve a small piece of our DSM
>(which should be at the top, right below the WOPCM); we just need to
>keep that region reserved so that nothing else attempts to re-use it.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/Makefile            |  2 +-
> drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  2 ++
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 24 ++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_wa_oob.rules     |  1 +
> 4 files changed, 28 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index cee57681732d..ef9d954f5a75 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -37,7 +37,7 @@ quiet_cmd_wa_oob =3D GEN     $(notdir $(generated_oob))
> $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rule=
s
>         $(call cmd,wa_oob)
>=20
>-$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $=
(obj)/xe_wa.o: $(generated_oob)
>+$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $=
(obj)/xe_wa.o $(obj)/xe_ttm_stolen_mgr.o: $(generated_oob)

Nitpick: It seems the list of targets is sorted. Maybe we should keep it
that way.

On an unrelated note, I wonder if there is a way to have the dependency
on the header automatically detected.

>=20
> # Please keep these build lists sorted!
>=20
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/reg=
s/xe_gt_regs.h
>index 55ceadfc30b0..d542a4e2e6fa 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -155,6 +155,8 @@
> #define XEHP_SQCM                                XE_REG_MCR(0x8724)
> #define   EN_32B_ACCESS                                REG_BIT(30)
>=20
>+#define GSCPSMI_BASE                                XE_REG(0x880c)
>+
> #define        MIRROR_FUSE3                                XE_REG(0x9118)
> #define   XE2_NODE_ENABLE_MASK                        REG_GENMASK(31, 16)
> #define   L3BANK_PAIR_COUNT                        4
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/x=
e_ttm_stolen_mgr.c
>index 79fbd74a3944..b23827534ab9 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -11,6 +11,8 @@
> #include <drm/ttm/ttm_placement.h>
> #include <drm/ttm/ttm_range_manager.h>
>=20
>+#include "generated/xe_wa_oob.h"
>+#include "regs/xe_gt_regs.h"
> #include "regs/xe_regs.h"
> #include "xe_bo.h"
> #include "xe_device.h"
>@@ -19,6 +21,7 @@
> #include "xe_res_cursor.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_vram_mgr.h"
>+#include "xe_wa.h"
>=20
> struct xe_ttm_stolen_mgr {
>         struct xe_ttm_vram_mgr base;
>@@ -112,6 +115,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
> static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_sto=
len_mgr *mgr)
> {
>         struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>+        struct xe_gt *media_gt =3D xe_device_get_root_tile(xe)->media_gt;
>         u32 stolen_size, wopcm_size;
>         u32 ggc, gms;
>=20
>@@ -154,6 +158,26 @@ static u32 detect_bar2_integrated(struct xe_device *x=
e, struct xe_ttm_stolen_mgr
>=20
>         stolen_size -=3D wopcm_size;
>=20
>+        if (XE_WA(media_gt, 14019821291)) {

media_gt could be NULL here.

>+                u64 gscpsmi_base =3D xe_mmio_read64_2x32(media_gt, GSCPSM=
I_BASE);

By looking at the description for this register in the spec, it seems
that only bits [5:0] contain bits that are not really part of the
address. Shouldn't we take this into consideration?

In that case, I'm not sure how we should interpret the bits [31:6]. Are
they the really lower part of the address (requiring "gscpsmi_base > 6")?
Or do they map directly to the bits of the address and we should
consider the lower [5:0] as zeros (requiring "gscpsmi_base & ~0x3f")?

The description for the BIOS workaround makes me think that it is the
latter.

--
Gustavo Sousa

>+
>+                /*
>+                 * This workaround is primarily implemented by the BIOS. =
 We
>+                 * just need to figure out whether the BIOS has applied t=
he
>+                 * workaround (meaning the programmed address falls withi=
n
>+                 * the DSM) and, if so, reserve that part of the DSM to
>+                 * prevent accidental reuse.  The DSM location should be =
just
>+                 * below the WOPCM.
>+                 */
>+                if (gscpsmi_base >=3D mgr->io_base &&
>+                    gscpsmi_base < mgr->io_base + stolen_size) {
>+                        xe_gt_dbg(media_gt,
>+                                  "Reserving %llu bytes of DSM for Wa_140=
19821291\n",
>+                                  mgr->io_base + stolen_size - gscpsmi_ba=
se);
>+                        stolen_size =3D gscpsmi_base - mgr->io_base;
>+                }
>+        }
>+
>         if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(=
pdev, 2)))
>                 return 0;
>=20
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa=
_oob.rules
>index f3ff774dc4aa..752842d734be 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -19,3 +19,4 @@
>                 SUBPLATFORM(DG2, G12)
> 16017236439        PLATFORM(PVC)
> 22010954014        PLATFORM(DG2)
>+14019821291        MEDIA_VERSION_RANGE(1300, 2000)
>--=20
>2.40.1
>
