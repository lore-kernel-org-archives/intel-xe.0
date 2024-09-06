Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91525E6FE27
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 15:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A21610EAAB;
	Fri,  6 Sep 2024 15:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EydDhGDl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27E610EAA9
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725637421; x=1757173421;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Jan0IbP45UtfxP1ai8dsHcR8rJySm281S5Eu+bKTlp0=;
 b=EydDhGDlq9dzLOQRA9dCMvpFFfNvePoKEaYobdl0Y/k0lU6jjgyuKwj8
 tGiEMVNE7HQiVDKqSI9nlED8TnLlSDxwlIg5u058PBhcdFT3EvBfM0Doo
 I1LfQF43TKauIQFyWFjvRBaNBw3CJ4Fd/DZ4rZfRp6286AwMtwYcKfEe7
 Qz06UBq/aROnvHyTW60tWYLeyGm66RL5MB+M+abRKT13FjgFDw00qWa1u
 b4J6Zm2FELd51HZb7rqQRSCoRVEHuJdVwW3eP+TmdIljCZACTIJ/ojiZc
 HHUbG3QO/deV0BrSfbGdSqsY56ePgphgWEF8wKecZ2Rg+Q+e3rUC1zFxn Q==;
X-CSE-ConnectionGUID: pXxqRv9iRCmfGI7x8rUmfg==
X-CSE-MsgGUID: ZanreQjJSsGYzHd9AxpmiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23905580"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="23905580"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 08:43:40 -0700
X-CSE-ConnectionGUID: 7wSUAb5OTTWIHshb2EGC1g==
X-CSE-MsgGUID: 8QEL/gIATzKr7FJo9A1fMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66734890"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 08:43:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 08:43:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 08:43:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 08:43:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 08:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMp6vXhwI8cn3T/RRjYdDJ06AxBAFHWzKUVRilT8bD3kRlEPCr3s4thb8cvGBeRRlodSNEgzWasNrgZp/u2/o/xJza/MA1dh/QaRONZBlTKCVaJq5xBEnNM0RttPlUOARec39K9muYIyD/mK7GNgeV+9PL+LG+m0ZJr+uwrorTf6i27jlk44zKWSNsbihYFYwkYTeyE8CEqomFwYXC0I4XjtPq6ZOGO61K+n8MJLbSkwL5VvE8Mjj3hdy4bAZvLUUNoFfsWUb29YIncaiuvXlF5mqf1SnP80wbNihp3QFN7xGiymmCKTgH1GHRPwzsFLk9CI5+TWChpETcSSLiuppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUbdZJEJr0V8VJi++lgmhRcFLE39KdeFalyua0EWmoY=;
 b=T3FGTL8HUe/eI31y/qNP+RJu3suOvI6lY6xWl0PteE9+UBAzsldoaFppUXt7gtBhGPD4vKOfOHmE6imVegV92eq2lpbVV6SEpUP8tVx+9y3kPBimcXMwSfRf72ROATwLMBsBsd9RJMMGbvVKJ+hN/dT8Z8By6N4yCitvweMx00ENfNZ4DUilhO1+vG3KVSPUolQYhiwJTOcxc7osxdFE9Wel7O/Xc1PZuGIz1efJRdnQ4ov5jKx5N9cSsBzeXHMjoXD5lKTsZQeVMwXZS4ywJBKulgF7eWAdtfybnUw5soGSf915b9CEqQb/LJ3KQbVXsUWNqbs+2xxz9K3uXwR6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 15:43:35 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 15:43:35 +0000
Date: Fri, 6 Sep 2024 11:43:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Wire up device shutdown handler
Message-ID: <ZtsjIZD7hGvJKK5m@intel.com>
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
 <20240905150052.174895-4-maarten.lankhorst@linux.intel.com>
 <bqqgufbcacxf7ix5nsveuvb3lr3equnm7otlkr5opw73f3are3@hu3b7zr2dko2>
 <baf6e316-7d01-4503-91f1-07422adf583b@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baf6e316-7d01-4503-91f1-07422adf583b@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:303:b4::12) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: cbccb453-e6c1-4ea5-6b89-08dcce8aa9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?kykZYoEAPoRXfE7P1eNNh8vAulgKNvsfANi1sJ2krdtiF9LJP9ygA7C+Lu?=
 =?iso-8859-1?Q?QNoVc6jSMBqw/bazm28uwJp9EFmkhYGFQvoIRKSHzIQGozCkyIefnGobcZ?=
 =?iso-8859-1?Q?c2LzpFc3Kt+e5EN743v+Lpz70ej/yhtE2acbxYRnikE9VDsuA8TBNpJwGp?=
 =?iso-8859-1?Q?/sMv9tCFgeDFt/T+aC9oMihcfRKbRWRCO5h4ta37iFvY0WSFI50TAW/WpS?=
 =?iso-8859-1?Q?J8dS4AHMBTPqfK1u8EZ0OIcWny9o/JXL/PVPjFd5YCmHoa2E9+lLvVe/fM?=
 =?iso-8859-1?Q?3KAGqkS8vGdxHJP57lp3Wyn37LghSPYMASS1j2XTQsrzO43JdWX/vqw4C/?=
 =?iso-8859-1?Q?6368k7z++PrJp3bMC4uETm+9epVAYawHgNuMSshcbLxawrysx2ru2I4nlS?=
 =?iso-8859-1?Q?b/KKopyvP8XcHQhPms2XSyyCt93tRWsY4KY2aQ6OByDp+bM7D6802oa8Ke?=
 =?iso-8859-1?Q?JslbDWfzS6TKajEQz2ruO1jNpwwnP56p2tRIODiNlyftl+UMAZpZ9ZLgV+?=
 =?iso-8859-1?Q?iq702W7h6Ul/F5JSyMiboY6xfLTScabUJCfnO+/zdtkaS7ZJUiTmzT6v7A?=
 =?iso-8859-1?Q?JmRobkY4n30UQPIALNbmFdJUO/KEH71iGLKNpkM4HBiHmBVJFVg2ZJvxdv?=
 =?iso-8859-1?Q?ggjdEV935Ewp4kq11V4HN3CMyTUVIwMWO/GrQ2Wr47r9ycU/Xks9jt+gtZ?=
 =?iso-8859-1?Q?b/65+dh8u9whg6HH+RzU4Ia06L6uRfyvSotkPtkb6SaBb0LaZtFFAxCZ3L?=
 =?iso-8859-1?Q?QQ4uNqOuYzKTCZuWbhrrGf4roo9tXdn3Nog5rQ5tHasDGDturZGvxOjLfT?=
 =?iso-8859-1?Q?M4Z4Z2gQO+ag9zCEr3I5If1o281DrLaOBZKM1RJhhrw+iclBFkYgMTIVn4?=
 =?iso-8859-1?Q?Wda8Vku+WDWYUsP/M1rXNwQR+6dbRLOeMVLL65g/TH5Vh6b3wCbe4YnBSI?=
 =?iso-8859-1?Q?e2Xgoqb6oQ+oV3IYQh/auSdaiwbX9Vx9MumShZanB0Pt//sQuDX+I9HxNX?=
 =?iso-8859-1?Q?Ss6yqimz6X42u9af4r61zK2ka05AIK6qoHTNk3OkMnZxW4Sf14kUKOSaDj?=
 =?iso-8859-1?Q?GCXF23ccCSwldYIFmGSZJmXlT02kZV46SXA3BnmyeI0bYtuLGbc04Q4q7s?=
 =?iso-8859-1?Q?2Fvfps61sT1iugVugylCpM5bWnPkS9eYZXCQHYzYvvBB8h5QorzCatznRQ?=
 =?iso-8859-1?Q?7manoVQ625jSuMNZgCbHz21hSEeWqsJFbAXIJsoOouZIcCn9elXAMVMRPB?=
 =?iso-8859-1?Q?XylwRfcilrJDOk9Cao7ixj24+RbWPJWrqHivRhOoVShyJMHEwxPlFaC4cQ?=
 =?iso-8859-1?Q?kR9iDyJ52+18LQTbDHYN+tlSpx3TJkOdtZUUrr64t1mQNzE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OhgJUXdWze6AxQn5ptE3vnft5X2rhD6UX8AgloixzwAyzcvWpolGSoGI+J?=
 =?iso-8859-1?Q?6OqM/tq3Knpaf1qmBnbQm90euxu9urWLo7hOm+ftB2WEl10FS6hcGJTokz?=
 =?iso-8859-1?Q?K82srshMUJY28E1IQa4S6ctcTDUDbV/9LxsgpixiFcsTw6rFY6yq/1NWfG?=
 =?iso-8859-1?Q?a2udFX6OewpyaAb40v4GXNp0pN8NwpSGoknBB6OZUGZRYUYlpYosaDMLDe?=
 =?iso-8859-1?Q?V24PyVBYuSzjkI6EMv/2WCWMyUdwUfNg+rm4XnprwpZVXP3jTqLtLdiZAm?=
 =?iso-8859-1?Q?IdY5aD0F2iQoTYUUDGiHlRWwNtxM94y73KFbz76cpf/YfwY+WyBYecWxrf?=
 =?iso-8859-1?Q?uhQh18PnNUDExBVdMJSKWLu9zx5SJuEV6S7Zuz67KnNFN+pYmU6b3RmAHK?=
 =?iso-8859-1?Q?VL7Mim4FJSdj7uIFD77SgDDZ6eqssYHTmE2A42UYepUsN7IVPXGiCp1UDG?=
 =?iso-8859-1?Q?LlnhO5MzC8J1oxwkXqzQlneMZ0YyOIWn6rs1EqNUgz3D8A0IM2tAS5SLVH?=
 =?iso-8859-1?Q?aNTX6n1Oh6GJhMuv17mLB0BJNcz+qHabBR20Iogw/AkjijeTFXsmixVYun?=
 =?iso-8859-1?Q?PQZbLAyJ3bFrlPqSGQGBDaPRDq2mZAXvCAhwb+wDqLAQfOSphJbGCRCgzx?=
 =?iso-8859-1?Q?iYxjofwCWOFn/7Gul4myMWdqUG5EHwpdzTboyi7kBnOgclYpd+SIJPCkz3?=
 =?iso-8859-1?Q?Y6ddgDGQLW580dAp2hH0rgPaFT3LH38vxUg+nN9rV6LLEqDe/nqmVxzY0O?=
 =?iso-8859-1?Q?CNT9AcV1broNt51Jju9WH3nY4xZbuzQgYYSm8DqHhiCF1Lh36KidBHN9jn?=
 =?iso-8859-1?Q?h4YKLHenP294vEuX9elBIC6SqKGKNZduOqhlPai7yZldOtrbSxNoKcZr6v?=
 =?iso-8859-1?Q?weMKqcFIRf0fs1bj+ecND5FzACWi1pk5jshNFKFAICJt1mAe4lNjYaRwrs?=
 =?iso-8859-1?Q?nsJvnoET0G0Isi51HD4rZCqfN3SiMgzXSBdiY3Tr2a8yvJZYfM+aVanMrE?=
 =?iso-8859-1?Q?bFz48j0cv0sYenmCkoBxNLz6Hwlt0aA5PJu4w8beMJOAvIGMlgHAXWYJ9c?=
 =?iso-8859-1?Q?UWdZaQ8AyhZ34yO5UHRPo3O/naIy+CFbJH26b+HpvARVfBlFk2c4D2/2I8?=
 =?iso-8859-1?Q?UcMakuvt6J+aH2f44xCZtpZX/pMxw+KZURWBHD54153COFF+iteePqlePh?=
 =?iso-8859-1?Q?YfeTV8Xgn7bDXaKp/Q9mDny9mhwjHLn6brLe6QQfsOfqM5UETvIV2fbi+L?=
 =?iso-8859-1?Q?jXU2czcXFfdJy3olUB+TbZrmVM1+Xz1hKAgwBKG8rjwzeT+4tqdg4a8R9s?=
 =?iso-8859-1?Q?xpe3BmLZksn2M9uFdzwrLQMfx0gL/WsWVBb3QoeLBtPbG+TfzB5exZLnxW?=
 =?iso-8859-1?Q?kKB4CJjhabnnLGv09364ovMwOCq1Ogi33wsDH5wp9PGuOz/2H/l58jQSvU?=
 =?iso-8859-1?Q?1TyVa0K+IUH+mqDih5MzZajuDbdEUxx/KMizeADwG4fCEZtInYuHQ7zAse?=
 =?iso-8859-1?Q?UdSx9rKBTyqjZjG3IkwyfZV4/8J3HDvdPrUS29uSxlWO1krflv7IfSK/IO?=
 =?iso-8859-1?Q?hVNszDIY+6fl8BLhjy/lQf2gp/MP3S/1diOAIrJOJxOuc6YOwiZbQoM1a0?=
 =?iso-8859-1?Q?NKbY8lcPiXH200s9C96YE3ylLwrhH1mAgvmH1YqnUU15AxyzPisOt/3A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbccb453-e6c1-4ea5-6b89-08dcce8aa9ac
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:43:35.1256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZK29fMLwjQIaI5GtX+MW0/JjUGcZPcndx3rVvgX7QnBqAXFQ0kbDoyJ3yPV+TDOaB5HNmTDxONBSGvpCkXAT6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
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

On Fri, Sep 06, 2024 at 03:37:32PM +0200, Maarten Lankhorst wrote:
> 
> 
> Den 2024-09-05 kl. 18:52, skrev Lucas De Marchi:
> > On Thu, Sep 05, 2024 at 05:00:51PM GMT, Maarten Lankhorst wrote:
> >> The system is turning off, and we should probably put the device
> >> in a safe power state. We don't need to evict VRAM or suspend running
> >> jobs to a safe state, as the device is rebooted anyway.
> >>
> >> This does not imply the system is necessarily reset, as we can
> >> kexec into a new kernel. Without shutting down, things like
> >> USB Type-C may mysteriously start failing.
> >>
> >> References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3500
> >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> ---
> >> drivers/gpu/drm/xe/display/xe_display.c | 43 +++++++++++++++++++++++++
> >> drivers/gpu/drm/xe/display/xe_display.h |  4 +++
> >> drivers/gpu/drm/xe/xe_device.c          | 40 +++++++++++++++++++----
> >> drivers/gpu/drm/xe/xe_gt.c              |  7 ++++
> >> drivers/gpu/drm/xe/xe_gt.h              |  1 +
> >> 5 files changed, 89 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> >> index 33071ac3bc12d..0cb8eef1b095c 100644
> >> --- a/drivers/gpu/drm/xe/display/xe_display.c
> >> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> >> @@ -350,6 +350,36 @@ void xe_display_pm_suspend(struct xe_device *xe)
> >>     __xe_display_pm_suspend(xe, false);
> >> }
> >>
> >> +void xe_display_pm_shutdown(struct xe_device *xe)
> >> +{
> >> +    struct intel_display *display = &xe->display;
> >> +
> >> +    if (!xe->info.probe_display)
> >> +        return;
> >> +
> >> +    intel_power_domains_disable(xe);
> >> +    intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> >> +    if (has_display(xe)) {
> >> +        drm_kms_helper_poll_disable(&xe->drm);
> >> +        intel_display_driver_disable_user_access(xe);
> >> +        intel_display_driver_suspend(xe);
> >> +    }
> >> +
> >> +    xe_display_flush_cleanup_work(xe);
> >> +    intel_dp_mst_suspend(xe);
> >> +    intel_hpd_cancel_work(xe);
> >> +
> >> +    if (has_display(xe))
> >> +        intel_display_driver_suspend_access(xe);
> >> +
> >> +    intel_encoder_suspend_all(display);
> >> +    intel_encoder_shutdown_all(display);
> >> +
> >> +    intel_opregion_suspend(display, PCI_D3cold);
> >> +
> >> +    intel_dmc_suspend(xe);
> >> +}
> >> +
> >> void xe_display_pm_runtime_suspend(struct xe_device *xe)
> >> {
> >>     if (!xe->info.probe_display)
> >> @@ -372,6 +402,19 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
> >>     intel_display_power_suspend_late(xe);
> >> }
> >>
> >> +void xe_display_pm_shutdown_late(struct xe_device *xe)
> >> +{
> >> +    if (!xe->info.probe_display)
> >> +        return;
> >> +
> >> +    /*
> >> +     * The only requirement is to reboot with display DC states disabled,
> >> +     * for now leaving all display power wells in the INIT power domain
> >> +     * enabled.
> >> +     */
> >> +    intel_power_domains_driver_remove(xe);
> >> +}
> >> +
> >> void xe_display_pm_resume_early(struct xe_device *xe)
> >> {
> >>     if (!xe->info.probe_display)
> >> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> >> index bed55fd26f304..17afa537aee50 100644
> >> --- a/drivers/gpu/drm/xe/display/xe_display.h
> >> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> >> @@ -35,7 +35,9 @@ void xe_display_irq_reset(struct xe_device *xe);
> >> void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
> >>
> >> void xe_display_pm_suspend(struct xe_device *xe);
> >> +void xe_display_pm_shutdown(struct xe_device *xe);
> >> void xe_display_pm_suspend_late(struct xe_device *xe);
> >> +void xe_display_pm_shutdown_late(struct xe_device *xe);
> >> void xe_display_pm_resume_early(struct xe_device *xe);
> >> void xe_display_pm_resume(struct xe_device *xe);
> >> void xe_display_pm_runtime_suspend(struct xe_device *xe);
> >> @@ -66,7 +68,9 @@ static inline void xe_display_irq_reset(struct xe_device *xe) {}
> >> static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
> >>
> >> static inline void xe_display_pm_suspend(struct xe_device *xe) {}
> >> +static inline void xe_display_pm_shutdown(struct xe_device *xe) {}
> >> static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
> >> +static inline void xe_display_pm_shutdown_late(struct xe_device *xe) {}
> >> static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
> >> static inline void xe_display_pm_resume(struct xe_device *xe) {}
> >> static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
> >> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> >> index 1a0d7fdd094b5..a2ce7454794f6 100644
> >> --- a/drivers/gpu/drm/xe/xe_device.c
> >> +++ b/drivers/gpu/drm/xe/xe_device.c
> >> @@ -383,6 +383,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> >>     return ERR_PTR(err);
> >> }
> >>
> >> +static bool xe_driver_flr_disabled(struct xe_device *xe)
> >> +{
> >> +    return xe_mmio_read32(xe_root_mmio_gt(xe), GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS;
> >> +}
> >> +
> >> /*
> >>  * The driver-initiated FLR is the highest level of reset that we can trigger
> >>  * from within the driver. It is different from the PCI FLR in that it doesn't
> >> @@ -396,17 +401,12 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> >>  * if/when a new instance of i915 is bound to the device it will do a full
> >>  * re-init anyway.
> >>  */
> >> -static void xe_driver_flr(struct xe_device *xe)
> >> +static void __xe_driver_flr(struct xe_device *xe)
> >> {
> >>     const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
> >>     struct xe_gt *gt = xe_root_mmio_gt(xe);
> >>     int ret;
> >>
> >> -    if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
> >> -        drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
> >> -        return;
> >> -    }
> >> -
> >>     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
> >>
> >>     /*
> >> @@ -447,6 +447,16 @@ static void xe_driver_flr(struct xe_device *xe)
> >>     xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> >> }
> >>
> >> +static void xe_driver_flr(struct xe_device *xe)
> >> +{
> >> +    if (xe_driver_flr_disabled(xe)) {
> >> +        drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
> >> +        return;
> >> +    }
> >> +
> >> +    __xe_driver_flr(xe);
> >> +}
> >> +
> >> static void xe_driver_flr_fini(void *arg)
> >> {
> >>     struct xe_device *xe = arg;
> >> @@ -798,6 +808,24 @@ void xe_device_remove(struct xe_device *xe)
> >>
> >> void xe_device_shutdown(struct xe_device *xe)
> >> {
> >> +    struct xe_gt *gt;
> >> +    u8 id;
> >> +
> >> +    drm_dbg(&xe->drm, "Shutting down device\n");
> >> +
> >> +    if (xe_driver_flr_disabled(xe)) {
> >> +        xe_display_pm_shutdown(xe);
> >> +
> >> +        xe_irq_suspend(xe);
> >> +
> >> +        for_each_gt(gt, xe, id)
> >> +            xe_gt_shutdown(gt);
> >> +
> >> +        xe_display_pm_shutdown_late(xe);
> >> +    } else {
> >> +        /* BOOM! */
> >> +        __xe_driver_flr(xe);
> > 
> > is this just so we don't read the register twice? Not really necessary,
> > is it? Otherwise let's please add an xe_assert() so we catch in CI cases
> > that this is eventually called in other paths that shouldn't.
> 
> I'll just go back to xe_driver_flr here..

either way looks good to me

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Cheers,
> ~Maarten
> 
