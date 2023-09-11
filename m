Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E9AC71153
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 03:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D7D10E104;
	Mon, 11 Sep 2023 03:52:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FE910E104
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 03:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694404350; x=1725940350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SlXLKbmi9GVALxF5CpDTCIBAPxOOrF/t2fdjcZqApuc=;
 b=C9Qio7FVLup/zU3g3lZSPOSziQ2QHaBjuQCrn06vmVqOYq+P0Xg57rHd
 SF0aJ5UHnGbxDcmjX2SH9EA33aNBIKzA3KAulvaMb+X1U/BhRDpcU6534
 Z3pRtW6WGD1MjfO5NWsmWskcI1jiaTLy+ekBYA9XXGQ1husQhhkP442mS
 0/IjOWHo/u5MOQrjPgpS2iYlHomA/A8ceIZUsgnDuoJXuVMYmy6c7sNdH
 6gbHwmtTgQlOCWvvbcI14euj8E6VEyCO2kw8C0l8zCR7PNdNrueY92N//
 YqyvLvsvkErk9+chBtNcq0exRjnyCaWnvMJxz6FhAymGc092USQdMOzDA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="376900920"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="376900920"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2023 20:52:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="736633060"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="736633060"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2023 20:52:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 10 Sep 2023 20:52:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 10 Sep 2023 20:52:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 10 Sep 2023 20:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTC38wkJ5YKJbVZu/UKAzv4mvdbbF9NsFlxorYDQYEESCNa+vfgoC5IMaJWNjdFvXvGnflgo5TShOL9h8TKSkMXMFX0Kf5vlq//nB/mhb/UMjeuEFcW1YScvEJya3wmaVS6mcMlvKtojYR2kwi9j99LDLazydj2Z1Ugb2KM0v//t3Yl4c2NHkX+p+9EQbvOTioBlzAxsEtLBHqDPbiH4KEZ2iAhwig7la9YHMlGDMKBqBqEgTzI3h8hw1cHf7lYLdpmucgIyoVj00+7IpjvSqYJx2gppMYtS0ukR/9LkHMfFa+bVJp13Ea0TakuRD5xzXGNhkaQUDwG3yJ9Qh7VI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlXLKbmi9GVALxF5CpDTCIBAPxOOrF/t2fdjcZqApuc=;
 b=noIz8It1XJCDgubZF0b+wCqcgdcINCGe/LpNAwRDL1f24Hb0QE6hmuJu/AcfyMdn/xRR/WS4Qtt/0Z0eiI29+MqitxuN9TFq0Cu/f+xopH9rD592Qk0E50ZjfM43lduNi0wTMGkjOD5CtA/LrqFHTaRhS+WlhZJQeBEZe92T19gAVdFz/5AdPhD5ZqB6ZwvQwzuPGW/I/5qHILlao3ja76PE+guvkVTRQ7sCya7iHwKZjvfqyP6bWMVI0PLflv0y2CvK9KGGxoKCqK+SGgXT87mSMftvN+JY/o0LoUg7wFilFlwGvkMEv67Ju+lA33ICjea3mswQ6kFnWnrDiYzsLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Mon, 11 Sep
 2023 03:52:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 03:52:25 +0000
Date: Sun, 10 Sep 2023 22:52:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <omy64zd5iw6sjbaiiu4qofwrlwxqdnmi7itmcz32sp3smjcqd3@wuasza73b2bu>
References: <20230908225227.1276610-1-lucas.demarchi@intel.com>
 <20230908230215.GZ2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230908230215.GZ2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 440a6b2c-2136-46ee-b3a6-08dbb27a82df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ogriXGCg8i6P39MgaAry+HWkzcv40xh7AJnxsvaptJyGCxQ4NmV7NnhN2n/uAzuf+iyOfYFM6ZBiy1eevMAYXIXTXIlJ0V7x70xIXU0cfJknf9ExmFjPg6Xw4uT42Msn/32gZePcbW0IEif+vakNJPYEg4tnKV2rSRVrCpgYDvCJy9Fptmeu7eGBoegm/2b5Ww1xNd5di+GUY6ifaEZxzjqldgpJqfD5QjrZkVFSZFbrZDWUHW/JQ+aitJcUz5TNFYrCBYuwXBd3VVwUqRypwmvdYxYFv7Q0pT4PCjUu7ST2GxyEgdfDKV6M7C/ELgooDYmt+A+Z0GXAkX3Q4B+uVo+BdKgcAauAUBlNOau2j9rxR4WYa3ciQ+l/cL7yCyQAHy9ydNfk9qpe3MmEIqGfH5bMZKdp91U8LHmuA1dllQXDwEXMXFgnAOuIusPP4On9f0nGAPgP/DzbgsiV9+hntcmBOhQjm9Jt5+WDIBO4T+cNIgay+4Y3Mt6Q9Q6eTVMM+wN0Axe8KJ9F2wBWfOztuHFR01bdrIJxsA7NWmfVhKU7RX5wfSZHIb5koaEtaP3r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199024)(186009)(1800799009)(6486002)(6506007)(86362001)(38100700002)(82960400001)(15650500001)(4744005)(2906002)(6512007)(9686003)(83380400001)(478600001)(41300700001)(6636002)(316002)(6862004)(8676002)(8936002)(4326008)(5660300002)(26005)(66946007)(66556008)(66476007)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TOXl41P0m8SKwOUTVJm9UujPuZFCGRL6Ks26+bc5/muyr/Iaw30MEBvcssk/?=
 =?us-ascii?Q?46RyaikO+fVx4NOFWIO4TmQbugl6pfn+SiHbu0lFrZb9B4pxtWjSs2roqiiP?=
 =?us-ascii?Q?tMYlGY+WCrBglWBEgw1xHpPqNV12UvxlLE48jUxoeWrEPMaLKHxUx/RmH6NU?=
 =?us-ascii?Q?CgUeNYg3WswEfpjxn7HU5nzjLh722j6F0jXFRQPJr/Sxja1RMriNLt7FL8lS?=
 =?us-ascii?Q?FPilTP88PL9h7U4Au7OmWq5C4D5Qt36KblKIflWlzORIjf1XswoBZQ1xt3kP?=
 =?us-ascii?Q?eK/+zFFQpuSooNL6XiVPNZGqVvNH44GijQmqiZ0RavSDwrG/ErtaLZhBki6E?=
 =?us-ascii?Q?dVMPdyYxTxPFlo1dq8JEFopt6iKplIq0RQrhbcWleqaYZ98c0FgZ3jjhCnz9?=
 =?us-ascii?Q?PNyR0/OVLgKWTz7tt/GnXpdBsjDKTxqQLtSEn6En86QxIUvOZJr3LtTIXGqC?=
 =?us-ascii?Q?cT+x/yaXvWskLhGAoIYNyAnVBEMQM2jGb+kv8GNpgBmVBhQ6uoJSUcHylc5l?=
 =?us-ascii?Q?FZsERY3rDFJbIAi6lLMJLosdSnJA8AOjEwgTH1m8wQJU2J+W0VlK/vF0S15l?=
 =?us-ascii?Q?0dHsKZfjZiqPdf8yxmXyCx+whHzVGYIkGrxeL+gL8sBIxjjYDToYyMl6DpZs?=
 =?us-ascii?Q?1kEDohluLTdrzMNlc0/54452HiI2L4M4yUhDP/LaEdqV0OFAak7Bnl8iNPY2?=
 =?us-ascii?Q?FHV7jm5eal/5uNsB8w4LZgfHuAq9jPOixAdi5zmdMOLz9fbVmBoa7F0tV0D/?=
 =?us-ascii?Q?kckbEpk4f/WL8P/bF70Xd7Lvem7mtoGCfhe1gOoV2BMUKd5TQKazCjK3Vrlo?=
 =?us-ascii?Q?w+lAZJ252hLeIUwi7tayeDvZI47PJxadUa9OG6jD1VXlRGBjDvwYdeu6MPjX?=
 =?us-ascii?Q?Txm4ZC0C416ZAWgm2y7LNVTG1+hoaINMn1KnELNC0BM9cbU5bkPsfYFL9xa5?=
 =?us-ascii?Q?5UPm9/DiPWlGrsqXiCOabq91AF4CCUedlyb8IuiTY0EruvdRid+rQRlxV58f?=
 =?us-ascii?Q?djtChpKNaHeKWAn+ySIeemkjeRmG3TyEUKL6G0j1iuoqvLxBQ+LfzUxDezOT?=
 =?us-ascii?Q?k9sHpB2fZLk/L4JGhTkBgx3/WrxPcqgt+FosIlrEwCgUCUOnG9YTs+kLz75y?=
 =?us-ascii?Q?pKLtcO+32qCem8Aa2HkkJlj8w0S+eORnknKIB66RedEraJCjVmrAiCsgb2aO?=
 =?us-ascii?Q?A31wDhRXp+s6LUChi+FALYqLCqXtagOlEyQksE6vSBuLTGKdCvIIa0iYQ85W?=
 =?us-ascii?Q?nVIqlYqhQyiWw0E0AHNGzGqaUVD3hM8GPz51hyNh6nhmOxZ60do8dQvzPlN+?=
 =?us-ascii?Q?WNIW4PfQDbMEbJndcttYGGjglYOyXaE1zSxsmp1YjWgLEJ9JZ3qR+u94+L6d?=
 =?us-ascii?Q?dqHtuksxXXc+GlZR1V+LcLJTlV+Ls0RfCkZrkEbYFxR6mCxTyAq5IXxseB9g?=
 =?us-ascii?Q?SodXOiRh54+CBYpKU3oY4WRdiJz89QU6j+Xi8pqNx8bDQyrn5G/MZeVZr7hW?=
 =?us-ascii?Q?I9qjNt5Nih3cwPFBygl72Gv2HT08RKjNU+wyhKJCGg9Oafy6XS1vvZFGj7yj?=
 =?us-ascii?Q?OypT3bx0iNdlZx98vYuGxWd5YBiPZbcupLFvv05kh+whIMUlUt+XryyxWR8E?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 440a6b2c-2136-46ee-b3a6-08dbb27a82df
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 03:52:25.6648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avkwAsLpUKnX1NY8hHhJ15FVjhu2N3tUMK7tRT95UadvS9T8qxfIaOB5VzDlMiz9LmaBFfL+6jkjyK+A75AakVoAxUW/0Gll6EWjJHc2x9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mmio: Account for GSI offset when
 checking ranges
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 08, 2023 at 04:02:15PM -0700, Matt Roper wrote:
>On Fri, Sep 08, 2023 at 03:52:27PM -0700, Lucas De Marchi wrote:
>> Change xe_mmio_in_range() to use the same logic to account for the GT's
>> adj_offset as the read and write functions. This is needed when checking
>> ranges for the MCR registers if the GT has an offset to adjust.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

CI regressions are unrelated. Applied, thanks.

Lucas De Marchi
