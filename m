Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25932C5DF85
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 14:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95D410F06F;
	Thu, 20 Aug 2026 14:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8lx9C5x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC7E10F06E;
 Thu, 20 Aug 2026 14:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787236798; x=1818772798;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qisukEI+Hf9TrAAwk13YXBbLCmvzFFY7WEAyDw9Z0Ik=;
 b=k8lx9C5x+gUey0zsBH8v7/gGEeAmz6ak4pUkYFd8gw65ZCIW3DQbUuZA
 8/9HCq3+wbOqeb1fCCPJ9I9hiuPMugxArdmKE02x4SjpUP6SzEY95XFP/
 tTKLtaIX7405j+varkNebdtqGYfPXy14D+s7iGcPq+qdy3lI2Xjb3nxC3
 xj6pfaamw5aDbmdt06gA3L3UxA63JCz6JI4IvOVTbtGIjBhmujqjpq/3p
 SlYTV/rMHV84bks5OtbDxd/3WnFGOTGk78Wc8lu5cdIc73dqOJOV9i75h
 Nnu7dfNFDrpmiBKqkPdJUvA+SxqIwT7UPo9ey0f5M86SVNefCwMIZrONu Q==;
X-CSE-ConnectionGUID: VuzG4ZaHQ9uy/gVTvUsa3A==
X-CSE-MsgGUID: /zQbjzb0T9yIt+GbI/u+TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87894671"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="87894671"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 07:39:58 -0700
X-CSE-ConnectionGUID: VHGomUdiSie6OJOjCQP7CA==
X-CSE-MsgGUID: BpTsipCrTGCJVDq8JCcIGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="289570777"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 07:39:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 07:39:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 07:39:57 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 07:39:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhYguIm7mmeCWt19xAJTmXs/l7dyc7mRO12H28PoWpq0LP6VeXjKUm03vqOpubFmtRZmVGvfrN3yuG+nVwRcmD8OO6qZz9PaXUQh6y0N+gPSCnqtw/EGBIwVxRNnUQ5mUn58zvBwx8lh+bNaksb854lOabyinxvGYe+D5u0FIL4lF0sW4ebR+cvu2mGh8jrB7xEbfPsGW4oy31HpZ0ZqQdA8+iF7a3jGId1FmazBnfuB3rOThMt600PuPd5aXo1f+UX4BrkDhQUiLjqu8Tg6OW4tUiMc+gtuB0DWnH0xav7l4Aats7k37MQzSCvKTmQVDzwq9gwuwJyXLTuRhaFhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tOUh7kx+DWtvr1++Il0wfM2jG8+BmMNGyng8K45Xt0=;
 b=iwUCOmJDGmbiMAtrjIcFI0Nad7xfB68gb5lA4/ms6RjLGF4zNo4lIn9wt3H/ovQ2d5T4z9r9SrTbbz55SgFV2hgCBnPZ9oabXVYLs/de+4ifT9y8tU5xGDdrcCaJqAzB64QVOYJklhXO27El0O01BDQYtZ68UbApdWyX1FcDZPW/Xj2apeVPrvi92hLlMLj/WNMBogvQ7+VYkbtMBCjMzfUClLheLMb6ZdhwFC34dIfUINTKNLeXNj/8AqkISiOzGbaVDV2bycCMAoQt2saDW2QijcywUslHlld1Q4zhx7GrpGl0WKX8zqfqcd6eeQ+PHMB3FO/en0F+t7cGNVZj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 14:39:55 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0292.024; Thu, 20 Aug 2026
 14:39:55 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH] drm/i915/xe3p_lpd: Update CURSOR_BUF/WM masks
In-Reply-To: <BL1PR11MB5413D244A3C7F42C53ABA076E2D72@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20260724-xe3p_lpd-cursor-dbuf-increase-v1-1-42f2faae2fb5@intel.com>
 <BL1PR11MB5413D244A3C7F42C53ABA076E2D72@BL1PR11MB5413.namprd11.prod.outlook.com>
Date: Thu, 20 Aug 2026 11:39:52 -0300
Message-ID: <87y0e0am9z.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: bea002cb-fc33-4ef9-34c2-08defec8e698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: vEpEJlr3sOeUSe28Vd4P99bGdemyjB+VhaS+wxgmHxPmS5gqk9M7WD3Eb4aGb9sSaTzWaKJuU1zcJxyF03Y5uutGo9zjcApjUP/0Vkd65959KV6OiEVu7TACy26/0Wbf1zYN/RGWFuYsmp/IsIpIrr5p2HsdrzduhVPjK7b0n/8Sfo6dVb89i4Mv2qs+BbjYv5gxvDLxfvYhey54hKCyQa0fPaLh1oJHlrgafE4v+uJEBOaEVq+c0rpbpKPDDbB9j3VwJ0A7i1JwVVSXMn5l0hywX2zXP6Z/1a4SBukNS5dZs7h9E3t1qoJiUIRdbAmnEBVmeri2sa+UHauynHuCfhRdSa0Oqbak39vz9bR3jk9lf8IqMSZ7RFIfc8xuvVWIgS2yER1EY0cYJT1VijessvS4tf7RhgAG8uo5Xjr3NspmbrtcUVEEK1fdv8RpV451w35NQjmELg6S8dZcks9omFcQ8FlR6aSgzmWLnBxhLdcTuvj8wZh4FXn2dZo1OZl6Fu98AuEu26+02d8i/cuRpqT1jYa4E2O6vXcEIcaUQwR8GZsknyU3JidKSWTzKzZOvti29nYNxRcyVSpoOZpSwHm8QoWTR8VSyR5h7BY5LZkONlrSoM/69m7RAxLPvahuPRPkgWXxXYIKGx86cAV4x53SlfqkHpbtoaCiHUS39ZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?55LU6qo8nmTXTZ8OIUAo1nBbu7mBHjbYyoduWoh1aucMuwblxwe3uio1d7uF?=
 =?us-ascii?Q?QBRXZt4ttpVqcgVi/tQn720QWSLrJF/bjW0UqXfVjjfv1FocFhoAp5rOQx+D?=
 =?us-ascii?Q?Gh0VMoKEyjtwlVSDtfmBGlkxTozWx8DBEPUCyU/WZ3GLksTB3bc3CPOOEZke?=
 =?us-ascii?Q?dyVhmX2kOpcGpyQo9FtU1O5Sw4x5lNji6+8GCRgc8wOXRsrrrkij1T5uw+xI?=
 =?us-ascii?Q?e8w8cG9wJQYQkX0bnGo6eFJ3DL6AaHRXit7pYrFrCoRxt56ADVrJN4yYKhXI?=
 =?us-ascii?Q?Lc2iDwc+413p+dv6CGiqSo5enr5U5XT6ljJ59kwf5x+/XGv4HYkPFI3mPPYx?=
 =?us-ascii?Q?ptl5f16hCqQdzk602soT3zhQ0dYrCD3wB8BYF2HJjSijY9j7vHE3c1502BKC?=
 =?us-ascii?Q?rVTYGpgcjjLMpZVdWnWmBhqC2QZGWNS5/6sGecBo5Q2JkFFTjIrRpdtMgUOq?=
 =?us-ascii?Q?opjzoyva6DvBM8XU8VPxK+9HW/TfF+1b4hM/HEC7TnZb2YEGl0rH6dqpqE12?=
 =?us-ascii?Q?mQdUnY5F5es0pxzEjuB2gZ22LyrB+tPtEiwVY2aZpBEJmYkYhx5M4qrljXuS?=
 =?us-ascii?Q?+lGVIvIjTvzx+Iel7oV2KtTB5XfA86l/vPSNap9rZ+Z32WHNqv5/+Ib9b85Q?=
 =?us-ascii?Q?Q0WlAye0vCVhDLJKzcHd76ZkqtbJNjgrdoyG3rJfKVgJCDnceuOiH7J+bXOk?=
 =?us-ascii?Q?rSOImqGHUc9gvLwEypa1ouckXSbreKN9LfWHbEZcDKtKOwFtD7Xbxjw1WPMy?=
 =?us-ascii?Q?1CTWpblqR2j5Ju1lnhzPaS5yw+VahRBcRpy195QsKKUcGn0gLGTKL7rSi2MD?=
 =?us-ascii?Q?pWIONuU6pvjPGVNeFzl+r/tlebueB4fmSLR0E9k4g4ceCUEracWaGhCEiBD7?=
 =?us-ascii?Q?32Fzf3CXEHR0bFOQNt1oo4ml3byqpNNbSQcApYCBZde4Bq34RfNUJ2wOfBOh?=
 =?us-ascii?Q?ow+Qg0K5/mATOFdvorjhjh/erjrh5T7ccKx5Z6RgZ9NpSMEWsZSZbt0x38C3?=
 =?us-ascii?Q?acXLGfITUyqvAHsMB8C0TS+HBoapOS7KVNFjS7OSFsrUWrM/jWaY4wCyPKky?=
 =?us-ascii?Q?h0O1w2PBOrWAj0DtKyXS4b/Rpv8nA3kQyI6j4FqikbY3tyLlD8h9UkOtmqT0?=
 =?us-ascii?Q?1aNE2YMVaNAkqWjvVcyYCH+g2sMS2a6Ig5u+Uw+aiLVqygaiRjetxcHZtPvD?=
 =?us-ascii?Q?UNJQa0F5fKQ7Bq7LOke4GYUnZKIXGcXFEuztLVy+Tzs4yP3KOPPXSVQBMZYk?=
 =?us-ascii?Q?EiCBwVUEAywIddWW1zdrBTjQcxUa0bPRi6+bK/bFRYddDV76O4Gq70WyXft/?=
 =?us-ascii?Q?oyS/AHUnTSE+XXzxu1GarkViUkdC9rUAilNnHvkB8zijYDgGzBhU1PrP40HK?=
 =?us-ascii?Q?Z1w0VzyIpwFhlNOLXid89M9ME2kOog17KQNcgNMI0LeoIwg8UnkzfjRV6i3f?=
 =?us-ascii?Q?fclxrfgNJeJsBkWjHS5tillXitflvfn3ybBxjeDxxFRHY/RfCrdhXsz2fy2F?=
 =?us-ascii?Q?S7j7p5hAR2GQd+PRfzGcqWVgDYJGZ7n9JPZb4Ei3wszL8FSmuFDmJCr2zo5Y?=
 =?us-ascii?Q?XvU0pjHuM1WqfSPnlfzPBmPb1xiT4QwhUfV/x/wiRBUrmoDJDVYlnIL0N13q?=
 =?us-ascii?Q?YSg9YgeD0OVrnnap7nc6XqOfMXrDHFNimjPh5V+WktTO3N0rsP+WEbQzQXVP?=
 =?us-ascii?Q?c/UsHnUM8wd4WQdwDp/IdwSEkdOQuZdX7IqaR/JngJL6mZY3Du6PllMbf4PP?=
 =?us-ascii?Q?kV16muS+2w=3D=3D?=
X-Exchange-RoutingPolicyChecked: i7htGLVdcH0H40Y15obpYpcz1KjYDMBYk9Fsxz6Npy5BHCULYqVk0Xsf7h60DG0Yx9dDbHrAwSW1Ld8rXw5O+6nqCWdWtqlfyN94FQY2r3Y+QB6+xzmNE92XmOCQBOIiAckgP8uNYLL1AY4ob/UPLiH0b0kP0BWHJPcIgaiqYrPF7JbpCzJkARrTzNw1T2ZXHt6rowISvd8VdVF61+57W+4cz82djRn3KsRowmAZ9B3JWycbDD/vv2soPzxTVTNHGz1fdUA8jH39lO8+4WPH4/s+k4A3dxuJvgpN8v/57d8vi7LGolCO8Y5lVtD+wezETo5rkD00G7hB+/BFPNFphQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bea002cb-fc33-4ef9-34c2-08defec8e698
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 14:39:55.0710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ha1usAlHnvVZroA/TLoBPdomm7rH0s/5fqOZ3mokBurFlcXVm5BML7wZchw4yXKsLK0nQ2HVuU3eHUuH2KNNug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
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

"Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com> writes:

>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Gustavo Sousa
>> Sent: Saturday, July 25, 2026 12:05 AM
>> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; Sousa, Gustavo
>> <gustavo.sousa@intel.com>
>> Subject: [PATCH] drm/i915/xe3p_lpd: Update CURSOR_BUF/WM masks
>> 
>> From: Suraj Kandpal <suraj.kandpal@intel.com>
>> 
>> Xe3p onwards CURSOR_BUF/WM masks have been increased. Update them
>> to reflect the following.
>> 
>> Bspec: 69847, 69880
>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
> LGTM,
> Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Pushed to drm-intel-next. Thanks for the review!

--
Gustavo Sousa

>
>> ---
>>  drivers/gpu/drm/i915/display/intel_cursor_regs.h | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_cursor_regs.h
>> b/drivers/gpu/drm/i915/display/intel_cursor_regs.h
>> index aaa66331063e..da2f9630ae2d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_cursor_regs.h
>> +++ b/drivers/gpu/drm/i915/display/intel_cursor_regs.h
>> @@ -81,7 +81,7 @@
>>  #define   CUR_WM_EN				REG_BIT(31)
>>  #define   CUR_WM_IGNORE_LINES			REG_BIT(30)
>>  #define   CUR_WM_LINES_MASK			REG_GENMASK(26,
>> 14)
>> -#define   CUR_WM_BLOCKS_MASK			REG_GENMASK(11,
>> 0)
>> +#define   CUR_WM_BLOCKS_MASK			REG_GENMASK(12,
>> 0)
>> 
>>  #define _CUR_WM_SAGV_A		0x70158
>>  #define _CUR_WM_SAGV_B		0x71158
>> @@ -98,10 +98,10 @@
>>  #define _CUR_BUF_CFG_A		0x7017c
>>  #define _CUR_BUF_CFG_B		0x7117c
>>  #define CUR_BUF_CFG(pipe)	_MMIO_PIPE((pipe), _CUR_BUF_CFG_A,
>> _CUR_BUF_CFG_B)
>> -/* skl+: 10 bits, icl+ 11 bits, adlp+ 12 bits */
>> -#define   CUR_BUF_END_MASK		REG_GENMASK(27, 16)
>> +/* skl+: 10 bits, icl+ 11 bits, adlp+ 12 bits, xe3plpd+ 13 bits */
>> +#define   CUR_BUF_END_MASK		REG_GENMASK(28, 16)
>>  #define   CUR_BUF_END(end)
>> 	REG_FIELD_PREP(CUR_BUF_END_MASK, (end))
>> -#define   CUR_BUF_START_MASK		REG_GENMASK(11, 0)
>> +#define   CUR_BUF_START_MASK		REG_GENMASK(12, 0)
>>  #define   CUR_BUF_START(start)
>> 	REG_FIELD_PREP(CUR_BUF_START_MASK, (start))
>> 
>>  /* tgl+ */
>> 
>> ---
>> base-commit: 8d8b015ca4cebab74621f83c223eacce22cc6f0e
>> change-id: 20260724-xe3p_lpd-cursor-dbuf-increase-b8473ae029e0
>> 
>> Best regards,
>> --
>> Gustavo Sousa <gustavo.sousa@intel.com>
