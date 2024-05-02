Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0752C25B10
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 20:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6677E10E7B0;
	Thu,  2 May 2024 20:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TsN7TaoI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4A510E7B0
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714681499; x=1746217499;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RBR/LjYKWmSvjVUkF9xKH2nG5v8t6Tz+I2iQFYQHrgY=;
 b=TsN7TaoIuiG3Xl45murKhE7XQP7P9zhgWXCoP6C6FvxRPMUfb5QqMD9M
 OUkbuxdXgrfTIVgBPMZ0buKX/BnyXAoGB/waQ0DBY995Pi0+iw3aVjD4c
 Vp8CeBhfCkY43Joa+FHsr6DL/vX5yt0x4fkKiA6I9x2pC7NbHiv5/Uew+
 jsCZ3WYszveepY6m+Rm7q6ub3YpP3pxuoitQn9OmvzZhb4jkmj/15qbQr
 s/kHhG17v5u6M1KZnhuUnJtCGIrRNWNRSE4o5CIMTTc5kmHWj0nauSSDu
 uWweDyxg3DbepCea6EhXt6uaKwD4nYbu7UOxepZlnt3FsXZsTS2FBlcxv Q==;
X-CSE-ConnectionGUID: onHteDfhSJ6CVeuAAsNYhA==
X-CSE-MsgGUID: iXZ5iBZYQyKtxgDn5jqwUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10331414"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10331414"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 13:24:58 -0700
X-CSE-ConnectionGUID: ObTK66Z2S5eWSQa1QghKMg==
X-CSE-MsgGUID: eg2Luzr8Tr2RMohhhJDmZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27255614"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 13:24:58 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 13:24:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 13:24:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 13:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CD1YJmmj4O9xtLYyeuvNg9LfOGSWhKpyCLlNkZenvSAH91XX3/vCeQnMXdrLRbgk5Ntvs5Jgb0cf4swRtK3kxVDYteqacU3NTTxhHq2OJUmkiifCyR5QnM/TmzSVZcaVyuTFYIh38QMOCVya5EWmc83KwwGnwTmT0D2VbeEG9VnXrDCBl+FukmjPTkDNKr3SHtAGrlQWUMX3rGIqGbylou2A1BvI8l9QgY0UZMpHMLcx3CVw2bJ+tpilzhfVdBJ7AISqcDaF8MvAtC78wjWMsccTIDHifZTcoA5spKD7AgPZ2IwAlh4OhBjkb6N//ZLntzpQw6brhiIRE9d0BFLbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCQMomB6eDsBRekt8MrbWYuVaLGTf/wWMo20pRit3vg=;
 b=PXDT9iqJ6c+cLoDbYlPN4cn4zGM1tz72VFTR7TrFT5mo6OPnMSqT2At4gWDAPBRCbypcx2/DNxq346MYAp+qqunCJrQv5/NC4LpR3CuFfgQUdOTaPbkDDkfkUjB22jwZ73MKfZxyypWpKqG70Tije2RtmJJBwFJDIxj3WFXzqR0AlZbEV26FUA5BxkJM4jGwQ35p444Un//6N5Tlhtji5KIJkL1lDNr+mYWrBC+I8Fxvz6e97Y/14wOlKzgDBDAcrtRrxlpIYwBwStaiwGKQMEbdA8QFK/O1hlEAjOSAZR2ItbckW0QtKHIkcWpxxL9aLYPxje85qWSluQ5+H0PEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 20:24:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 20:24:52 +0000
Date: Thu, 2 May 2024 15:24:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe/rtp: Prefer helper macros from xe_args.h
Message-ID: <p7fkbzitslj2kuxr2l3pgaps6akx3rqhh54rradq5n4uyec4co@fqu6nytaqesi>
References: <20240502195619.2483-1-michal.wajdeczko@intel.com>
 <20240502195619.2483-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240502195619.2483-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0296.namprd04.prod.outlook.com
 (2603:10b6:303:89::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: de0efc68-d82d-4623-6969-08dc6ae5ec41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UkGabcrTHd2M06aVY09wRnIhM+QeSnXS7MhXIeuUYCzTg6TexWNQbOzTmpkM?=
 =?us-ascii?Q?Ez0lSh4qQ91kvLVdVWGQ0HIOAVDONFFg/gHjZbeFN7f4taGHM7Jf8btBBYuD?=
 =?us-ascii?Q?rIVmN2z67RsiuX6C9QWX86J7IXU7A6m/q4HmBZn8egd7c0oA6YLwClfvDwBr?=
 =?us-ascii?Q?6mkEQYqRPFRFQKRWSTiw8dGC41754HZpX5OQC0zZzTXmU54kZUW1TOVCLDf8?=
 =?us-ascii?Q?37QVHM2mb83SQOj5clIdI9VmoEC4JhMUmFHDoWmrqRsERRAvuc7KtncOR5SB?=
 =?us-ascii?Q?t6utHER93kGT4c3XxtVcu+in+l+8eqZs6GkIHVu4c2fIJcEvUQroKRVQ4sH6?=
 =?us-ascii?Q?g2HM/ywYM2YAo0W0rVo/9IwLkN6UyjMJQp+3M5Mziase0KhUpmIArjsDtMLb?=
 =?us-ascii?Q?G9gXMVpy65ezctt3WUGmd55XeB0XCcjC+siKH5VH44EpT4xlxvSToBKfyPlp?=
 =?us-ascii?Q?4+Lpvw3tlkpGpeyXCtZNbEDgQRnx849f/S0cWWncxTGp91LDAhc1b7D1ppYZ?=
 =?us-ascii?Q?JLRysH0lf9+uOcR9OzgGoOiGVlPN5bU6MHkTBi5CiVbEKzeguDg57xEPEDZ8?=
 =?us-ascii?Q?FGgU4TUlS9WUOVxZCXr4I4mlgwJxo+tsVvBzHsMQVcycd3BG4imkmJbAUDsx?=
 =?us-ascii?Q?fiCWHIiI/Wy4AwuJIKMRQaBgDiAm4vlp6lMXV7EyxVD/zwN+hes+HOZAOKHc?=
 =?us-ascii?Q?98OG2Y6omLM81VobCnOt1boP5H1qm9OWyVH0+iDAcTrcZ6SN6LCnxJIWgX+O?=
 =?us-ascii?Q?nR3vuq+CVj54gb/JAvxB+VnVy1CseYCFC4h1bOOlQsLxi6OcQT6wSTuKEEFz?=
 =?us-ascii?Q?W4+uo+BhktNxIsuNa7Eo0gYSAA0R4MnUKf29YTCRQjCyE3edl+Z1/3C/yE2p?=
 =?us-ascii?Q?oiLHLLbpy4vmla2Pk2CBeqjguJtlZNK3IjqWWurmrLfHbh2xsEY46X2O40pC?=
 =?us-ascii?Q?RTae3nsuQgchVcsdcFmJVmi8Vxa1ZTBbirvmvatwaklqXLAekEkD6BEjz2tr?=
 =?us-ascii?Q?NUK363ZuLrqvF6Tb44XnY2n0rS1sb9Oem6kNYkofWfgCoZGdKq/PAkbYxK0b?=
 =?us-ascii?Q?oIH37/VUOazW9HlufGIjx2GJ9c6juT6eJ35kMyrlRB75IGph6yHnizrn3gsH?=
 =?us-ascii?Q?+Ezcgj2c4UO5t3qCIqbxBZUC0OSHupCdRRlTZ+Bn4+K6VuFltNpYbwl+mWPN?=
 =?us-ascii?Q?sgDG1jIuXZpfg1t2SVs5syewVonwyVp9PlILqatJDi2O5KgYuCYBkUoecvj5?=
 =?us-ascii?Q?T642NPoTo6/Um/QZlQe5+KdsA/WKqmvgS4LMN/gUug=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yzSX+iZ/QZqI0Pb5UF5T1TDdtz8tkAkVralyqXfwxWlXbs3f5teJKkWofvFo?=
 =?us-ascii?Q?nt0LuQPH3neWAhZh8dXyD5AphMClYuZMbb+48eC9hzsoPuYwAmbUK1o45v3t?=
 =?us-ascii?Q?t5p+SBkfgePQVntxPoZKzjDsbZw8Ip0GCB2ogNGitC3Y4ozLNrAw+nmmFwRj?=
 =?us-ascii?Q?GqoPyg81+8UqscZkes+zqoe7w2CKibk1eWrG2n4aWQfhkHMbR/f3+n6D8oV1?=
 =?us-ascii?Q?Vq7N0hU5fuBOUAda/yCGe4gXFzU5U7S6jwMZeznnMHYvfBjUKS9tnhJuHWHR?=
 =?us-ascii?Q?nbE4u6cSeUfFIYm+f+2W5PwuMTcr6OySrn+EnHLxGO/yAsJqD4ngS2VLtkby?=
 =?us-ascii?Q?9DiAgyMdKGZ1HaoR9R9zuS65QlWzvgYfLYorKI6C4hY2wtaE7N71AL6yjcwm?=
 =?us-ascii?Q?NxWVaenqMYdR3hrxMi4ZvWANtfnak576P3qINO/jL+DqQI39giRrDJytHA/l?=
 =?us-ascii?Q?oWMim5IgSCK+MxuQ9B1akT92AOg/EiCkjplXLdoLHBXEqIYfKrEA4YGBTxIm?=
 =?us-ascii?Q?e3M2yj/adriBYa7AcW+DBMFT4MHxKAYt5NF9ZzeCEmSWkY08DK3OtQW/9k0C?=
 =?us-ascii?Q?WNO28JCULoh9uKKSuOj7bcbRhbLcK/J1DM1jcNwAJ+4HMblq/AjNQWfOPxbC?=
 =?us-ascii?Q?LlHJ8RI94L0rlUSMIQqESmSxoCKYP7150Dj2vpYf6P6vJIXJQ1vwEg1yuNDB?=
 =?us-ascii?Q?HMUtyJf6f8L+BMF3tlOPdy4OhEVK7SeAPEcxt49MjmAkIq5+yN6Df5nyda6Q?=
 =?us-ascii?Q?xo6w8TUH+vZxzLmEoDsavKYGLeM9vEJrbNkppnG/Pr1ckqIMvFAIOmddQjdZ?=
 =?us-ascii?Q?Mk7QSp07uQJ45VSEHzDsRXC6b8Thm0fgj4kSEtm+p7eNssZPT+K99ixIVeBV?=
 =?us-ascii?Q?TL4OZOqeeVW5RQvkrRmpv6Kf7O7RUT2fKQPEJaG0zdYUrKFmgfWzDsrbG3Y6?=
 =?us-ascii?Q?2ZtYsd1BvP6p5/GzypB2EiqhKzCiCTB/mfk7MebSQP+QVsgb6tV5jtuLkpsw?=
 =?us-ascii?Q?Vuzrlj2cY9Gom/GMjsG4FKKBf1XhPv2S2DiQCq7N60IPoVWWT9FCVxBYauzC?=
 =?us-ascii?Q?auOheFiy1vuPFLyycR6mvZDLZARyWDFBX4YEktRPCZ16h5lg2oW9nfUuZoVs?=
 =?us-ascii?Q?bbL1pSC8ISW+DhKkaBx2FAK0wUiXbydd5dU18RFbiSFiQj/sAP32Mn5wTRBR?=
 =?us-ascii?Q?Fu1jGe9jDQgoltslYYHPRVVGciACBGKU1KsFontGzKYNRKAJiiMc/SrHO1P8?=
 =?us-ascii?Q?KK35nB1blKWs13jLxrlyXA8ylXizIE7XUr3oJDL8vExB8DbXKFsgSOphfR0K?=
 =?us-ascii?Q?1KFja5yBhVLVsxQiAiKVcho7kEIMdmhQa7IAoZacUDwzp3B9cDsM298/G+C7?=
 =?us-ascii?Q?Iw3bfg/L31kXMIBB6qfkY0wrlVaWbpOujWaiVHnYnWVHcFquqDZL6LYE0TNU?=
 =?us-ascii?Q?tWA+bG4K6oqJmMeb+G6UWuMeF8QUdtms/Hn5uYfxvAhCb9aNNIJNVQyclMpO?=
 =?us-ascii?Q?CrrGxQkJ38luKQcpY9iLRcV8X3QA8zi7KfVx6TdZt6DNVV1cesAWgEBmEi2L?=
 =?us-ascii?Q?NR6o6cDXwgqYhfPrIwWzri+duaU8NgTYUC6/E/dclcC52gwK6S9+IGiVGGiw?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de0efc68-d82d-4623-6969-08dc6ae5ec41
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 20:24:52.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qM8IfcithpBj6bo4iSkXMV4KlnI6DdFfgLpNRhmsd0vxeB4Pdnm0gNvshJHPhERn4S4f+x0T87AVnfv9k7RVQOm5OdVYlkW/Cco4Ksi+NQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
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

On Thu, May 02, 2024 at 09:56:19PM GMT, Michal Wajdeczko wrote:
>Some custom implementation can be replaced with generic macros
>from the linux/args.h or xe_args.h.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>

nice cleanup.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_rtp.h         |  4 ++--
> drivers/gpu/drm/xe/xe_rtp_helpers.h | 26 ++++++++++----------------
> 2 files changed, 12 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index c56fedd126e6..337b1ef1959c 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -341,7 +341,7 @@ struct xe_reg_sr;
>  *	};
>  */
> #define XE_RTP_RULES(...)							\
>-	.n_rules = _XE_COUNT_ARGS(__VA_ARGS__),					\
>+	.n_rules = COUNT_ARGS(__VA_ARGS__),					\
> 	.rules = (const struct xe_rtp_rule[]) {					\
> 		XE_RTP_PASTE_FOREACH(RULE_, COMMA, (__VA_ARGS__))	\
> 	}
>@@ -366,7 +366,7 @@ struct xe_reg_sr;
>  *	};
>  */
> #define XE_RTP_ACTIONS(...)							\
>-	.n_actions = _XE_COUNT_ARGS(__VA_ARGS__),				\
>+	.n_actions = COUNT_ARGS(__VA_ARGS__),					\
> 	.actions = (const struct xe_rtp_action[]) {				\
> 		XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__))	\
> 	}
>diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
>index 181b6290fac3..8129d6d9ef37 100644
>--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
>+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
>@@ -10,22 +10,16 @@
> #error "This header is supposed to be included by xe_rtp.h only"
> #endif
>
>+#include "xe_args.h"
>+
> /*
>  * Helper macros - not to be used outside this header.
>  */
> #define _XE_ESC(...) __VA_ARGS__
>-#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__, 5, 4, 3, 2, 1,))
>-#define __XE_COUNT_ARGS(_, _5, _4, _3, _2, X_, ...) X_
>
>-#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
>-#define __XE_FIRST(x_, ...) x_
>-#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
>-#define __XE_TUPLE_TAIL(x_, ...) (__VA_ARGS__)
>+#define _XE_TUPLE_TAIL(...) (DROP_FIRST(__VA_ARGS__))
>
>-#define _XE_DROP_FIRST(x_, ...) __VA_ARGS__
>-
>-#define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
>-#define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## b
>+#define _XE_RTP_CONCAT(a, b) CONCATENATE(XE_RTP_, CONCATENATE(a, b))
>
> #define __XE_RTP_PASTE_SEP_COMMA		,
> #define __XE_RTP_PASTE_SEP_BITWISE_OR		|
>@@ -59,11 +53,11 @@
>  *
>  *	XE_RTP_TEST_FOO BANANA XE_RTP_TEST_BAR
>  */
>-#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_ESC(_XE_RTP_CONCAT(PASTE_, _XE_COUNT_ARGS args_)(prefix_, sep_, args_))
>-#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_)
>-#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
>-#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
>-#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, _XE_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCAT(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
>+#define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_)
>+#define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
>+#define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, PICK_FIRST args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
>
> /*
>  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
>@@ -76,6 +70,6 @@
>  *
>  *	{ .a = 10 }
>  */
>-#define XE_RTP_DROP_CAST(...) _XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
>+#define XE_RTP_DROP_CAST(...) _XE_ESC(DROP_FIRST _XE_ESC __VA_ARGS__)
>
> #endif
>-- 
>2.43.0
>
