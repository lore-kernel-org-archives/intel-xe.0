Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A752CC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 18:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632EE10EDBD;
	Thu, 13 Aug 2026 18:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVYG2Nag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6A310E9F7
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 18:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786647072; x=1818183072;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xd1Vwp2ToVy2c1wfTbbDP8jnbz9LWKB1l1dH/Ktz9dI=;
 b=nVYG2Nag2Xf8gCOALG++TdGnwOrM8gBURqCNYk7jt+FnzImU6wVI7m92
 QJVtvGzSEbL0DcJWglqC5hLSQcZ5gPejxclwWCnac04FfXjh6ZE1az8Mb
 N06p0Mj+ull/XJ8GMp7v1bPg4iOfqTyt4RT3qHE8y7yVUVG/2SfntnCwN
 nhfpZfQr6F0wHXypF6IoKXZQckZtEYvPMsSY5yeOkW35TLoCYY0U08Cpr
 7sofgdJg9qOQrjHMSAq43wyIcbhLqHCDqYyp/HchjHhDmy0iqccsazhTq
 rGJJdZ8BXRObLkub3pmTF1qVRd5uAgwu50LkdpPUL/xV3vtYJkHkIu8ts A==;
X-CSE-ConnectionGUID: zLanlZICR9u7UfFuxNQstQ==
X-CSE-MsgGUID: tcMlnhrKRIGHtr19iZDxTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="74768450"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="74768450"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 11:51:11 -0700
X-CSE-ConnectionGUID: Qzt7jOP7SDKhyjGwxbf+Tw==
X-CSE-MsgGUID: 2hmt6NIZTwOwkUtMZmRZEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="266018063"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 11:51:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:51:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 11:51:10 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:51:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPH2xm+M40sfi1tfv7fZZjNv8fHDkDsodHmWH47BJxvWWiWohvQizd8GM9QmnkTXDLX0PbwvO4SgixsXmNsqD2K44A8burZOyUGhuiqv+hQzH+bFl+7JkXTBts2Ke7TLhHy5xTWem77EOQFvaNni2Z0KLbou9euuQZ6/OsKIWbggVBWrZvO/9bsSI9U+bkM+eHCq2x2l4qjfahAD+pwnNkCw6hA6MgAaUFVjsxQdSsBJfgKeX+zoL9jjoJk2G5LRFjK5B4mLxyccTF0lOmsqWXi+Vh+yNZh1hTh4O+4gPABnZOeqoJxWTuRUgzKE3uBBrUR5iyr4eIBu3KwLY7gbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMkDaPnFOhPCOXI5D/SYRrq0DxNc6Wic1gn9D1CvT8I=;
 b=nm3BE+Q97+cjA3fAcjqr+WBWU6aMHXRlL18y2VEgFoE0jxANnfaLpNWGs7z0f6Pa3yu/kpWECaDZ1GqJsRMCkhQ9hs+NZKhacPzanrldDcwY6e6s98ZT5n99Ll17M5Kc9H50nSZxbUqRzsSjtvJ95wkfUdwJtFzTuJvlw0gkS8QnO4T30eEWIc9F0agoF5IHacIZ8ca+50SXmuJG6y6YLOiqPSn6+OqTYWGPk2hPYucT0PSj7yFWIpTAzQf6vpqqHodqFKecbCtntTtUUpcUf9oaMzJh3H33K9HLlI1F3u0H9m2gq6+ZZTy+gn5JBHm2AYsh9Mfx37ljhv84ZWtBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CH9PR11MB9902.namprd11.prod.outlook.com (2603:10b6:610:345::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Thu, 13 Aug
 2026 18:51:08 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 18:51:08 +0000
Date: Thu, 13 Aug 2026 14:51:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Yoni Levitt <yoni.levitt@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Raag Jadav
 <raag.jadav@intel.com>
Subject: Re: [PATCH v4 02/32] drm/xe/log: Add structured SIGID error logging
 infrastructure
Message-ID: <an4SGIk8Gz33xkby@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812191450.11690-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CH9PR11MB9902:EE_
X-MS-Office365-Filtering-Correlation-Id: a7724357-b7ba-4f04-c8c2-08def96bd604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|3023799007|6133799003|5023799004|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WEsgcA4iNTtRUWISIe8W6HP955DZwcOccwkeyZMQLW5QrOOQZQad43CN+snYPIk2GbWUDdWbStTgCQXH15vhj0EaGaCHpjPCJSXWd78qolCvZKeEqgii4cEQ7TEqvwdI+JCuon9g68fFYhWPnbi9hgjKhfKJp5B3+raDsAjyldZNLA58CoEkjPfgj7QBYZL5SAraikLQhD6B5ZeecESD065yrQiE6v+CmvLOMcUH/JTC5+hrWfi5QpyXLURXbnIQ8GrzNx+0BF1B7PgUURn+UEQ6Qovyo0hLQ9x3OXN2D3DS22VrBZHN/yw9s+3tHN+uy5CrkLBLOaoV6oLLC3VC58GXXQIxYoVsDyg5VThwlXk2YTogUUfposNZYCwYwNik/OTS6vKzEk53CbWrsm/YkRMP+KaN7U85f/MqhFMvJh/9lpFTtzf8qhkxw+gZWycEisf1ZDoVrLVZ4FGRH71rBBJI47f9TLRKpi6LOfjAbnA7sbMXtStxp3QAGcMH2pV8PTdoE0u734vxLLtQ9+uhyM55WbWBqLoKHx+Y9zaEJEp0f+WMh5ekIJW7jZcz1hVF8iZXEYBd0DriuiRS/b7ROXoORLTpgeo2q6ViuT5gpqtG5G4O7S+40Oa3+tulXiSJWMqBR3MF9m//NwOv+1xRTzMgJajRYIHLQJ6UKmtNVO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(3023799007)(6133799003)(5023799004)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?snpgj/2TGBwc6vQqmh2TM0CexH9Q8IL3D+csisXQql5yYekwGTNTCyhFbo?=
 =?iso-8859-1?Q?/VbU3EAGe4yc4EuNfFJw2h3PJ9/UvxnJ1VK59/jkUo7wftpvXA/fAbQN5U?=
 =?iso-8859-1?Q?O0DeQj/bWt4Qrg1I8EQuMN/MENnBtAih8NfFozII27B/hzZp1ZD6p9xyYS?=
 =?iso-8859-1?Q?PDdS3iZvYggahALHZgzGCT/pfOy4Igm3vn2cf85Q4/vrcY48vcudGzGhzt?=
 =?iso-8859-1?Q?5t/GXBRMQ/VOL2eNfVHLuwD6j+18x9k9vduq3FRFL2wNiPwttmk9CVf7tn?=
 =?iso-8859-1?Q?vkTX0IDtNLvwkumJmVlrLpkdf9EqhjV1XGmsWPHZ6oMKVTE/1jMnDM25ea?=
 =?iso-8859-1?Q?T75CgRRFDMmCXkZnNdaGt3XNYukaMDTpL/8iueGxjSZgbW8VpIvLWBGTEq?=
 =?iso-8859-1?Q?Qq2/M3qeeKi3soLR0bvdppNcr23tyRqx6zanx8s2/QbhxeBkyOYY+dPYHR?=
 =?iso-8859-1?Q?mjhSTA22SbEk6IK3aMJf0+IohSrJLPpM98V50S8dPjXRFxPAiRdEyoeNIe?=
 =?iso-8859-1?Q?ghJlAL3fUAEa7SMoQ+mB8xWNIl/G+50Jj8V7fgORo7N95o1zC1rts2jHta?=
 =?iso-8859-1?Q?IYj6W7d1U8M8nDqG9d2xQ4weDvudGj8TQoc0p0pGg3IYTHy0jPuJINbnFg?=
 =?iso-8859-1?Q?DFFWV58csxDM4/A+Yx8D/DfpHyKxkeNl+fY5hsyZxAbqSzZnAYvcw6gAso?=
 =?iso-8859-1?Q?2nQ1HmGdY2OhFTIzbsGZKLCmj5kbi5y86hRmrqwCbRt7ZZ3teKBdUHSXvn?=
 =?iso-8859-1?Q?pPWGC9+KyHorQsAqvGYNEOVdTe2fWpqnOTSKypZN/t8iWENNOpFvCk7/by?=
 =?iso-8859-1?Q?BUUtHCFflNXCkUaTHnAFZgcgHiva4If8RyZ+7wGWgfDYX1GWqKaxlE8X0a?=
 =?iso-8859-1?Q?oIVA/vGZfhGy2c7ZJ1i29tgcaiKPR2dcVWKIlTV2dW/89eZo8B881jP8xR?=
 =?iso-8859-1?Q?4YG4ZAIzhEcXl+djz0pzrs2VzCN05WgX4Ufc71qTMi4PWH5HFNG7Jq7Lmm?=
 =?iso-8859-1?Q?HlDDmlWUTq9uCVoshgHMYSADMRdYpYxzEzP1lWByk5f0N8L9/IyLL+lC5+?=
 =?iso-8859-1?Q?/1NK3D1yjcNd3pX54oOCux8Nt5yuNP3vs8Nuw+663fX2bsoiu4yvTWbstr?=
 =?iso-8859-1?Q?6Jxrp4LC93410/sYFJz3RYtCDEv1bulB0TA0RGh+JTE8KZ9E26/0lj7pPQ?=
 =?iso-8859-1?Q?XkITnqXup465IVBHVrnPEsa7WRELKFYT/Ss0kalN/GY7WzZB+/cq8eQMb4?=
 =?iso-8859-1?Q?E1tyGncJHLS8x2gWRqUVAeiXb+CildVioI84UrHdqcR0/vsdXRTdzL0M7Z?=
 =?iso-8859-1?Q?QT/mb+w9iVxZ6nN/tVRXJ+LhpKEQzwUJ5LN4r01J0Xnnby90dwU3v+x2bm?=
 =?iso-8859-1?Q?j3INkkb9LE8Zbc0U34pahoBs+kSjz8VMAo6454ISnpXN9PeM/+yL1F4jhm?=
 =?iso-8859-1?Q?lwJOxpK91k00AQtTOsLcoAnQmiHMnl9BUT/jTthcXqljZpdqHbSBM6YE8b?=
 =?iso-8859-1?Q?GpOK7vroEDiWvixlYZDt7jonJ8KfSSPaFQ63cWhm8wyiUt/6tJWMBk1xzI?=
 =?iso-8859-1?Q?Uig/Pr+S4ctRCVFzdpnwxeJewvzlT6vVZMhg8/5263L8RRKNbpbj6WOBVx?=
 =?iso-8859-1?Q?s/90NfuDHL8xq7yenmEw8dU1MkK2e8ypOyO8gj5H8QicUvUGe/eFxITenx?=
 =?iso-8859-1?Q?yZoKyt+s429TV8E5ne42vwY4cKSjHT6Nmsq+Dt4rka178vJjFu1yNKP/65?=
 =?iso-8859-1?Q?A3050LX7iGXTnuAZn8PaxH2u5r1NRdt9PXC/t8k+1fQaQYkQrP6LGrVoju?=
 =?iso-8859-1?Q?fRQVJuh0Yw=3D=3D?=
X-Exchange-RoutingPolicyChecked: QWEc8IKJ5D1nUx2ZGNyOoKvdlHO/FIUw7oo74G09Y5OT5c6WQBDkBc73X4oKAXMO93/k61feAKeaUCzz0vJ1F+le8VYJT+L/Wj8TPY7zbwCi5x1Nl36a2/Q5voF2ObpLjOuhIrv8sCQUInQGfJ6ASczgIARy3ESJ1n1NCzleGnUiYwXM4W46C3Yf5OwIp4efYWk5WSsOcYLPo680lgMHVF/TeIkPsnnwWvnLj8lOEgYDIHeUBcYQefzE0/Tm1Ya4SBGm9qzm5YtPU7eQr+GKFrTZXcQI+R67sIC68fWGDkDcN7MXLm0YTmS6WO2on8JStfirlkBLHq3W2hoLHPt7mQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7724357-b7ba-4f04-c8c2-08def96bd604
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 18:51:08.2683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5Jq2W8n3FhBG5vZjLOqdPnjJSNaPs8WqCi6z9NUHMh2v7lqYmNFBeoZdC9PIjXKyvomzjqYICn36lYYx2PBPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9902
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

On Wed, Aug 12, 2026 at 09:14:18PM +0200, Michal Wajdeczko wrote:
> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> 
> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> strings that have no stable shape. That is readable for a human, but it
> gives fleet tooling nothing durable to match on: the wording changes
> between releases, lines can be rate-limited or dropped under an error
> storm, and there is no consistent way to ask "which recognised fault
> just happened?".
> 
> Introduce a signature identifier (SIGID): a small, stable integer that
> names one recognised Xe fault site and serves as the primary handle for
> triage. A SIGID maps, through published end-user documentation, to a
> description and a recommended action; the driver only has to emit the
> right SIGID next to the usual human-readable text.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Assisted-by: Copilot:Opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> ---
> Cc: Yoni Levitt <yoni.levitt@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: CORRECTED is still an error (Michal)
>     prepare to decorate dmesg with comp/loc (Michal)
> v3: update SIGID DOC section (Riana/Aravind)
>     warn about unknown severity (Mallesh)
> ---
>  Documentation/gpu/xe/index.rst        |   1 +
>  Documentation/gpu/xe/xe_sigid.rst     |  14 +++
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 159 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_log.c           | 138 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_log.h           |  20 ++++
>  6 files changed, 333 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>  create mode 100644 drivers/gpu/drm/xe/xe_log.c
>  create mode 100644 drivers/gpu/drm/xe/xe_log.h
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 665c0e93601c..0247a255f7e6 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>     xe-drm-usage-stats.rst
>     xe_configfs
>     xe_gt_stats
> +   xe_sigid
> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
> new file mode 100644
> index 000000000000..45d84a62f185
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_sigid.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +========
> +Xe SIGID
> +========
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :doc: Xe Error Signatures (SIGID)
> +
> +Signature Identifiers
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 44ed055439d4..92134709d998 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>  	xe_hw_fence.o \
>  	xe_irq.o \
>  	xe_late_bind_fw.o \
> +	xe_log.o \
>  	xe_lrc.o \
>  	xe_mem_pool.o \
>  	xe_migrate.o \
> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> new file mode 100644
> index 000000000000..93967183ae51
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> @@ -0,0 +1,159 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _ABI_XE_SIGID_ABI_H_
> +#define _ABI_XE_SIGID_ABI_H_
> +
> +/**
> + * DOC: Xe Error Signatures (SIGID)
> + *
> + * What SIGID stands for
> + * ---------------------
> + *
> + * SIGID is short for *Signature Identifier*. It is a small, stable integer
> + * that names one of *recognised fault site* -- nothing more. It is the

read better without the 'of'... or one of the ... sites (plural).

> + * primary handle used for triage and maps directly to specific report site.

s/directly to specific/directly to a specific/

> + *
> + * Numbering
> + * ---------
> + *
> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
> + * in the order the fault sites were introduced. Values are stable: once assigned
> + * they are only ever appended, never renumbered or reused. A retired fault site
> + * SIGID value is deprecated in place, never re-purposed.
> + *
> + * Why this exists
> + * ---------------
> + *
> + * Today the driver reports faults with ad-hoc ``xe_err()`` / ``xe_gt_err()``
> + * strings that have no stable shape. That is fine for a human reading dmesg,
> + * but it gives fleet tooling nothing durable to match on: the wording changes
> + * between releases, lines can be rate-limited or dropped under an error storm,
> + * and there is no consistent way to ask "which recognised fault just happened?"
> + *
> + * A SIGID answers exactly that one question, identically across driver and
> + * firmware versions, and (eventually) across other Intel devices in a node.
> + *
> + * What a SIGID is not
> + * -------------------
> + *
> + * SIGID deliberately does not encode the detailed reason or the outcome. Those
> + * are carried alongside it::
> + *
> + *   SIGID    -> which recognised fault site is being reported
> + *   severity -> how serious this instance is
> + *   errno    -> the failing operation's error, if available, shown with %pe
> + *   message  -> free-form human-readable context
> + *
> + * Severity is independent of the SIGID. The same SIGID can be reported at
> + * different severities depending on the instance and the recovery taken.
> + *
> + * When to use SIGID logging
> + * -------------------------
> + *
> + * The xe_log_*() helpers are for these recognised fault sites only --
> + * important, operator-relevant faults and events. The driver's only job is to
> + * emit the right SIGID next to the usual human-readable text.
> +
> + * They are not a replacement for ``xe_info()`` / ``xe_dbg()`` / tracing, nor
> + * for one-off diagnostics; using them for ordinary logging would dilute the
> + * fault stream. Not every ``xe_err()`` needs to become a SIGID report -- only
> + * those that correspond to a published fault sites.

s/sites/site

correspond to a site (singular)

> + *
> + * SIGID log output (dmesg vs. the machine record)
> + * -----------------------------------------------
> + *
> + * The dmesg line stays close to a normal xe error message so it remains
> + * readable for admins; the only stable, machine-matchable token on it is
> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``).
> + *
> + * The full dmesg line is not an ABI: the surrounding text may change freely,
> + * and lines may be dropped. The durable record for tooling is the CPER record
> + * carrying the same SIGID (generation is a planned follow-up).
> + *
> + * How to pick a SIGID (the uniqueness rule)
> + * -----------------------------------------
> + *
> + * Pick per *report site*, not per incident. Each site emits the single most
> + * specific recognised SIGID *for that site* -- so the question is never
> + * "classify this whole failure", it is "what does this site detect?", which has
> + * one answer. A single underlying failure therefore legitimately produces a
> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
> + * follow a fault from origin to final effect; it is not a duplicate.
> + *
> + * If a site does not match any defined SIGID, keep using the ordinary
> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
> + * or over-broad classification is harder to retire than a missing one. When a
> + * new report site is genuinely worth triaging, add it to the list below.
> + *
> + * Usage of the existing SIGID reports must reevaluated according to this section
> + * after making significant changes to the site that emits this SIGID.
> + *
> + * Scope: software vs hardware emitted signatures
> + * ----------------------------------------------
> + *
> + * Some SIGID represents fault sites that the *driver itself* detects and
> + * reports from the software POV: probe abort, wedged, survivability, driver-
> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
> + * These are the only values the driver assigns on its own.
> + *
> + * Signatures that *originate* in firmware or hardware are a different thing:
> + * they are produced and identified by the firmware or the hardware itself
> + * (e.g. via their own records or error counters), and the driver merely logs
> + * them as they are given to us. They are deliberately enumerated separately.
> + *
> + * The two driver-detected firmware report sites below (%XE_SIGID_RUNTIME_FW,
> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
> + * observed a firmware problem, not a signature reported by the firmware.
> + */
> +
> +/*
> + * Top level Intel Error Signature Identifiers.
> + */
> +#define INTEL_SIGID_INVALID			0
> +#define INTEL_SIGID_BATCH			100
> +#define INTEL_SIGID_RANGE_START(n)		((n) * INTEL_SIGID_BATCH)
> +#define INTEL_SIGID_RANGE_END(n)		(INTEL_SIGID_RANGE_START((n) + 1) - 1)
> +
> +/* SIGIDs 1xx are reserved for Xe GPU software and 2xx for Xe GPU hardware */
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	INTEL_SIGID_RANGE_START(1)
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		INTEL_SIGID_RANGE_END(1)
> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	INTEL_SIGID_RANGE_START(2)
> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		INTEL_SIGID_RANGE_END(2)
> +
> +/**
> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> + * @XE_SIGID_SW: Software component failure.
> + * @XE_SIGID_PROBE: Device probe/bind was aborted.
> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable.
> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode.
> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC.
> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl.
> + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset).
> + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault.
> + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault.
> + *
> + * Each SIGID represents the report sites the driver detects and reports.
> + * Values are numbered sequentially, are only ever appended, and are never
> + * renumbered or reused.
> + *
> + * Firmware- and hardware-originated signatures are not listed yet here.
> + */
> +enum xe_sigid {
> +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
> +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
> +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
> +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
> +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
> +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
> +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
> +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
> +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> new file mode 100644
> index 000000000000..ae4f6e33f5b8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_log.h"
> +#include "xe_printk.h"
> +
> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			  u32 component, u32 location, const void *data, size_t len,
> +			  struct va_format *vaf)
> +{
> +	/* TODO */
> +}
> +
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> +}
> +
> +static bool is_sev_error(int cper_sev)
> +{
> +	return cper_sev != CPER_SEV_INFORMATIONAL;
> +}
> +
> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
> +{
> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
> +}
> +
> +static const char *log_sev_prefix(int cper_sev)
> +{
> +	switch (cper_sev) {
> +	case CPER_SEV_FATAL:
> +		return "FATAL ";
> +	case CPER_SEV_RECOVERABLE:
> +		return "";
> +	case CPER_SEV_CORRECTED:
> +		return "CORRECTED ";
> +	case CPER_SEV_INFORMATIONAL:
> +		return "";
> +	default:
> +		WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unknown severity %d\n", cper_sev);
> +		return "";
> +	}
> +}
> +
> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> +
> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +	if (cper_sev == CPER_SEV_INFORMATIONAL)
> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> +	else
> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> +}
> +
> +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
> +
> +	va_end(args);
> +}
> +
> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			   u32 component, u32 location, const void *data, size_t len,
> +			   struct va_format *vaf)
> +{
> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> +	const char *sev_prefix = log_sev_prefix(cper_sev);
> +
> +	/* TODO: add component/location details */
> +
> +	if (IS_ERR(data))
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> +				 sigid, sev_prefix, data, hwe_prefix, vaf);
> +	else if (data && len)
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> +	else
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> +				 sigid, sev_prefix, hwe_prefix, vaf);
> +}
> +
> +/**
> + * xe_log_emit() - Emit a structured SIGID log entry
> + * @pdev: the &pci_dev device
> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> + * @sigid: signature identifier, see &enum xe_sigid
> + * @component: component identifer

identifier

> + * @location: location details of the @component
> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: length of the @data in bytes, or 0 if not applicable
> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Emits a dmesg line that includes a single stable, machine-matchable token
> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
> + * when @data pointer is set, either the error printed with %pe or a packed hex
> + * dump of the @data binary blob. The dmesg line will also include printf-style
> + * text message.
> + *
> + * Note that the full dmesg line, with the free text message, is only a debugging
> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
> + * The durable machine record is the CPER carrying the same SIGID.
> + *
> + * Note: generation of the CPER record is a planned follow-up.
> + *
> + * Examples::
> + *
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
> + *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
> + */
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +
> +	va_end(args);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> new file mode 100644
> index 000000000000..d475e816ee0b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_LOG_H_
> +#define _XE_LOG_H_
> +
> +#include <linux/cper.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +struct pci_dev;
> +
> +__printf(8, 9)
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...);
> +
> +#endif
> -- 
> 2.47.1
> 
