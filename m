Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39068CAC58D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 09:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC45110EA5E;
	Thu, 11 Sep 2025 09:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AITo3EPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEF610EA5E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757582454; x=1789118454;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xREXuSkXaQfh3EP6TaZ6ll0RqiPj0w8JVsgLkYU18yk=;
 b=AITo3EPMurvUfbzyURRbtnU2egagtcsvxhICIv8TUWIRLi4bASXYTmbo
 /mBmxncHQm1wGpEnQvlb6whCbKUWHBy5i35vlb0PcYHY3zvQsMt7NQg8x
 gT67HiPSq3pNsr9iaLm4JVlt0XgYJTKrTqG2PwjUA7xwkFHl7AHPGBYuc
 g57nrBpEWXn6p36kO4s7wPPjoltQdcV+sWbonSG0QFI8pauL3Szzqfw6o
 xCgQgGYDPDGADZcY0j11Q+EFdbtrjRnPuP1T2OENQQa6fFHTPrejSyPbs
 6zPP4dVyinrgrPjTdJR6gkWlcX7dJ5qCrutVEJjyWqiNsOC0/sFn0Wlpk g==;
X-CSE-ConnectionGUID: QDE/ELTnRu2XSg2ISS4Ezg==
X-CSE-MsgGUID: L5HpKH6+QMmJ1JbGwd8KaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="47480887"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="47480887"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:20:53 -0700
X-CSE-ConnectionGUID: 6iUq0tExSUSttddU3mdi4w==
X-CSE-MsgGUID: wrMDPqStRBO7TW6bJ0LhrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173210517"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:20:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 02:20:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 02:20:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.51)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 02:20:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsG6VlB5mHd7qAQ/GCKob6+d1aekaoI7hAVNKMs5jx290EGLZd9OD25BrDtmdjZCGfZwDZXCnue6qtHGgDAck7f3DrSkLl+fR+fbK5eiI4ifqU5l61MwIGlkr1Q6eR9Wj6kcXwg6AMR7+PDQb8Rm+PUk6xSpKd11Udm3HMRDcZpk2nUxP/aRK7ksjCS1YfJcGZJRgy0+smeXuaD1ZXKk0b3jFvD5gSiy7diqBxpdz/ybASspOsmutqUJ0avCo676ijakVhAv9lUUPYp3Zi0hD//VWp65Wo1WEbiY31OENVV5RzfnHNMoErc7GBZD8dyAPklI14SnYJ9rewMD9IvfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQbilIncRqojxZ1JLyYCGA0lP09BbWQZbcadha2L9gE=;
 b=dGiVAz/vpotCn9Pf9NaLqqxmw+eXB5E4RtB0/F5inZr+TWhiTuSwfEIHlelYQfoK5Mg0t30rjPdqwLlJci3NFmXeHVfuDR1oVmZfnhFanfELc4w+T5tuewbn9IeIfBFfsb6IMVKuh/WNKJVITdUV6UMOmZmfNNGHIJhnskQW4HssFpTgz2ykxHx+YdWA8lxACgJ9o1ROQp5DnktohtMnOxx0SsfxHzWLoCAUMd9b7VEkSdLHmz+XYqbyfX4SbWfFaKTS/KIPsSRby7Sfe79pkaTizriBm8Zb45cg4vvGAFG+EBLjEP8mA7SIAeguOgVH+zp0Fim2kqD5hIZp8syW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 09:20:49 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 09:20:49 +0000
Date: Thu, 11 Sep 2025 11:20:45 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Drop rounddown_pow_of_two fair LMEM limitation
Message-ID: <20250911092045.bpfyq7zegzlzng33@intel.com>
References: <20250910222439.32869-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910222439.32869-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: TL2P290CA0005.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::15) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a924b1a-194a-4e32-1ace-08ddf1147f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnBmUzh6U3pqSkhnNmFvWit5UG9pK3ZlTHFCVFJZTlYvVGVma2JVL1RGbzVP?=
 =?utf-8?B?UkhHanU5V0ZvVHp1eXRYT2Q2MnJmYlkrSnRMdUtKTFZDQjExQm9ycmJVRmRT?=
 =?utf-8?B?OWJEQTlHMXFPTElVZDlDOC9SanNWV0JiLzlVcFhSNjlKK0RnRWZGTjZhODN5?=
 =?utf-8?B?eExoU1dVeEpieEl1ZzBLeTVjWkJkUXczOUgrTjdTbnBBUGZGVFowbyt3L1d5?=
 =?utf-8?B?S0F2ZEJOaHkrcHJDMGV6L3UwSTlRR2FZU21QVm9hTnZmL0l3OEI5SlJ1MlZr?=
 =?utf-8?B?dVZwdFpzbnhjcTBEVXNkSE9keGViaFQwK1NpNXRPRjNReWJIV2lGdXBCQ0ZY?=
 =?utf-8?B?L1BvWmNwRnRCVXBqdU5XcUZFTnlnd05YK3I5K1UxYW0yZDlsWURJZU9rR3RV?=
 =?utf-8?B?MzlaTlRNc1dvTGhuT1Q1NDZJaGlxaFZPdzRCWW12VVRTR1QvVys0c0FDS3E1?=
 =?utf-8?B?eGMvelFNT0Q3VlhVdnpxSEN0VGN2ckY5QjBsblNMV2prZEYvYXdsb21RUWM2?=
 =?utf-8?B?aktYaXNOQ2IveEs1SjVsSUxROUt6YWY3ZlhTTVRVeU9vZGlaRGJQd1ZOOFFp?=
 =?utf-8?B?ZFFURkQ3U2IxR0JqazFKaGFid05vdEI3Y2kzTDZHcXkzTll4cG1Pck01N0Qw?=
 =?utf-8?B?QWNHeXpTZzcrcTdQRUJsaVkyNWkvQ0lISnAraVpSSy8vaTRCc3JDTFNYYlIv?=
 =?utf-8?B?ZlQwMjI3bUVoejR4ODh6d3pWeE41N2UxWTVONlY4NDlVVTZVQzQrcjV0MVEy?=
 =?utf-8?B?MEQ4aVNoSlZQSlVLT3ZTVTRrUWU5dURCck1WdDUwN0JUVWxkVkRrYTJKTTlJ?=
 =?utf-8?B?eHAxUjRqZU1DbHg0UmVxbWdtc3R0eFdBTUV1NHowczVuVFZTbWhPaDlUTkZk?=
 =?utf-8?B?dW0zNEZTSnNaSkVNS201UzQ0NFYzeWpDV29JS1VTNWc4OUF1UkxHNE1na01z?=
 =?utf-8?B?M0t6K0c0VXBVY3ZPOU11NlNQOUtXS2RsYU1UcWNyN3I1K25ISTVOeWpVYkR1?=
 =?utf-8?B?OWljNGFHZktzUVhPeVA0YkROSFBIclJzaUpOaFgyNHBBZG1ycC9QVlZaMGJL?=
 =?utf-8?B?Y0N1WWg5QkpzWGdRdXRTbjh3VldpZFArVFNJTHFzYWZQbS9PeUxsTjRrSXVs?=
 =?utf-8?B?L3ZySk0yRVM5dStaTVNSK085czRmYUxQalB5VWNGL3VBQmM3b3M5UmY2b3Zn?=
 =?utf-8?B?S3RyeG1XTVhROFdjbkU3dnhuL282WVZoUDF6T3EzR1lNUVZYR2kxd1UxZmt5?=
 =?utf-8?B?Q0xwdktSOTRtUTZudEtnMDhqK21tNkdMVmcyd3cwcFVhOUcwQjJUNEhyeDZq?=
 =?utf-8?B?bEo2Y000dUVjblI5Vkg0c1JjM0NiVXJoWjdSTmk2cGVKSU1vV1Y5am16MTVu?=
 =?utf-8?B?bXdleWFXU2JGelFFYVFoamFlekdWNFhMYmw0cCsxS0ZnUFNtRU14QUlmZS9n?=
 =?utf-8?B?Q3Y0RUdBVzR3eS80OWF3UXJnRVhKd1lOZDZnYlZxN2RSKzhFMGZ6aHZJMFhT?=
 =?utf-8?B?WkRjQTF5eTYwUmxjR05hVm5oaGMzNWg3RzRJTmkwMkVaNFZ1eU5TSjJuem5n?=
 =?utf-8?B?QXU0NksvL09UM2tOWHZPOHZUQmhlU0NhNlBQcEhnc3JPNnJMZmxpZTBCWklV?=
 =?utf-8?B?eDhEL2NPdit2WnlOQWtrWFNiOTZOZ0d6ZFB5cHQ1TnhVaTY3WG1BMlNjL1VZ?=
 =?utf-8?B?ajlaVEVBS2NoQ1dqbFBTSms3TFpSQlZLV0dDWnlYL3BWaWNTZ3Bla0lqSmQ5?=
 =?utf-8?B?eUx1RHYzRE8xSVNsZ3dCbFp0YjZlTVhrYzlSTDhienZXeEdOSTF3TnArT1Fy?=
 =?utf-8?B?N3dIMkZIK3VMTmdtSUVhblhiak5sZXNkOENscWIwT0pmQlJMRG0wYWNOc3hI?=
 =?utf-8?B?cXRRcWxDYXVhNkNQQkpHNzVlS016MFlack1rZ1M3UFEzY0NCRWdGVGlzVUth?=
 =?utf-8?Q?GNsNa7r23Q8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGNPR24zRS9odUpWZUQ2VTF6ZlJ0UUlJcDN6MHI3eGc3SFBYVnQ0bEFuZEJ0?=
 =?utf-8?B?QnhQazVZL2JEYzhiaDJtTGkzanVXa2l1VW5jYUNZa0Qwc2EyaFBkeU5LNlBX?=
 =?utf-8?B?V1hjQ2EydnZZNU4zQlFsYThyajdrUEVDeTlwbXc3a2J6dlRJSTRRRUxSREt5?=
 =?utf-8?B?VmF2YlgvTnRjNkRlbVA3enpYSWJ0VjJ3T05qSmV5cFVlTTZqekdKZTlrZlZW?=
 =?utf-8?B?ME41MmVGL1RvMEJ1Nkk4ZnpCbjUrN0krSGE2alhlRFNCZjgwVW9xRitqbmRF?=
 =?utf-8?B?eXkzNHV5ajF0WWJpTmZXcWJzdGtpT2ZwTm5hVlFaNlFXNEN3QUtYd1ZnN25I?=
 =?utf-8?B?cnBZTmcrOUNZMy9ETWpSSlIwOVphaG1leG05UkVaUFNqcWRaa1JwaERKTU85?=
 =?utf-8?B?dG9NYzdBYmVGSFNKM0dXYWZ4TFpON2ZnWGM0OVB5dVI2UXdWOXdLVEsyamU0?=
 =?utf-8?B?aXV1dkg5Y3ZjNnR5OFlIem93bDROcEorRWJGbUdyZThibitDV0xtdVJzWHhR?=
 =?utf-8?B?NnhJTFBpdGUyUFpqMkVIaXFXUDZEOXUwdEdFUk1JYmdyWnI3NUNSTDZDdVB4?=
 =?utf-8?B?NEw1VG4wU3dVYWU3NGZqYUhpekNqSDg0L3hZdlMzQ0I1MUJHcG93dkNlVU5G?=
 =?utf-8?B?c0F4djFEMERXcGgwYkEyZzlodCtTQmZ5WXpoZnNOY2JKWENmMjFEaG5pdmJO?=
 =?utf-8?B?RHBQUDhocDhmMGRic1I2dHdqNDNhcTd0c0tHZ0JKUzNhck03aEFDQ3Z2Z2ky?=
 =?utf-8?B?L3c4ZlMwQzYxTnF6RDRxRmtZbURlVEFpOXhnYmNlZ0Q5bnRucW5hZ1F5SHJS?=
 =?utf-8?B?Z0FBSlFjN2dNQ3YwSTdsQUNTWk0xQXFxYnRyK0thTndsREV5MjZJNERka1JQ?=
 =?utf-8?B?WkNsUFNBSWMvM3gyaGZEU25oQTJ4V1pqbjd5Yzl6dit3ajNhdm1JNjZ6YmFh?=
 =?utf-8?B?UWlTTUsrRnNiM2VSdjdQRXRYNTk1bmQxclQrUW1pQWpVMVBvOG1jVTNTdFQr?=
 =?utf-8?B?QWVKbTVhMThzUHphUDZSYzVYUnkrL1NVWXBJaDl6VGx2Z2N1NHNmM2NpdHg5?=
 =?utf-8?B?alRIVWxmTDBWSXRCUVB4UDJpRjhGVUhwaFBRT0JobHBQWThyN01KdngxN2oy?=
 =?utf-8?B?M252VyttY3ZDUzN3VmhNdjAzUTJNQVd4bmIwRHlEblNscUtKQzhmenozRnZT?=
 =?utf-8?B?UnFrWW5IWTgxY2FCREViK08rUmt4UHptdTNJQWc4OStLbmRhV0EwNURvUlIw?=
 =?utf-8?B?Nit3cWd5aTN3WCtqRFZjS2pXRXJZU1ViSGU4eTdUckRVcHpTTGFhd2RKNlY0?=
 =?utf-8?B?RkJaL3JOYVd3cWg0ZlpBK1FuYjVxN1d6azBSR21KOHlnYVgrZXFjWnU2eW91?=
 =?utf-8?B?WEdJYUdITFI4WWs5MzZHN2Vicm91dkNoSXJGQlg1R2wyd29XNjNoVTZ2VXhi?=
 =?utf-8?B?bXA1d2l4bmJUYm85Y2RoZ1JZNzRUdUYvQ01FRVBaZlN0alEvVE5LRTAzUWhE?=
 =?utf-8?B?dFk4NnkyemNRM09ETUFscmQ4ekZyOFhnMUdXY3JkK3VHY1M2SEd1dHV3bFJu?=
 =?utf-8?B?YnlRVTdPblN6ZS9yZnV4bkdKY01ET2xDdXM5QjhhdWhkK25JQzlqU0l2VzJq?=
 =?utf-8?B?RGI5Ym1WTzcvYTNySzJXZDJ2bW1UamVCMjZNc1FjL0tScEpXRXdpa2tjLy9t?=
 =?utf-8?B?M0E5MkxLMmpMd1MwYStIclNhbHN1WjV1dXhQMW5YbXc4MzJrNGhwSCsxRTdi?=
 =?utf-8?B?QzBaZ3lvRTgvOU1EV2ZFSmNrMlc3clUwMDdSNG1Xd2Qxd3lPT2svcjhqY3lV?=
 =?utf-8?B?bEllaGpYOFlWQStwZ3lhRU1Ic3RQQWlUWjhDSE9XZ3g2d3l6ZWxRdGZaWmwr?=
 =?utf-8?B?OSt6bjFlN2JHMEZmMG1kL1VCNi85dVloSHdKeU9vN2RaYzJQNDIyS3lLMlRn?=
 =?utf-8?B?b2N6UDMvT1ltRjdqS1RFOUpzR0RqWTZiWmhXM2xuZ0lpam4wVERtM3ErdG4x?=
 =?utf-8?B?d0QrK2V6Zk1TR3NDdnUyVFFPemJRSTNldk1jN2RoUFFDZXlHNXhzZklzVERw?=
 =?utf-8?B?dWx5dUNuL3JwOUZ1a0FNZ1FvY1BqMkxqRnV0aDNSWVFSSDlMQ1ZNNjQ1a1pi?=
 =?utf-8?B?c3plTXozT0dSaHVqRlNQRG51Q0QwWU5oSmo3RSthZk5zMmxxTHdmNWpZeXZr?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a924b1a-194a-4e32-1ace-08ddf1147f58
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 09:20:49.6249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/qQES36DL3QZC01P/+Ghb4jxMvDRrHM50Ruw9OjpNq4UM19aCbQZ0LPyGpZGZ8Y8Lxfed4EMAYrg607nIIy41Isym0v+PwDBoWV0ct6gWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7971
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2025-wrz-11 00:24:39 +0200]:
> This effectively reverts commit 4c3fe5eae46b ("drm/xe/pf: Limit
> fair VF LMEM provisioning") since we don't need it any more after
> non-contig VRAM allocations were fixed. This allows larger LMEM
> auto-provisioning for VFs, so instead:
> 
>  [ ] GT0: PF: LMEM available(14096M) fair(1 x 8192M)
>  [ ] GT0: PF: VF1 provisioned with 8589934592 (8.00 GiB) LMEM
> or
>  [ ] GT0: PF: LMEM available(14096M) fair(2 x 4096M)
>  [ ] GT0: PF: VF1..VF2 provisioned with 4294967296 (4.00 GiB) LMEM
> 
> we may get:
> 
>  [ ] GT0: PF: LMEM available(14096M) fair(1 x 14096M)
>  [ ] GT0: PF: VF1 provisioned with 14780727296 (13.8 GiB) LMEM
> and
>  [ ] GT0: PF: LMEM available(14096M) fair(2 x 7048M)
>  [ ] GT0: PF: VF1..VF2 provisioned with 7390363648 (6.88 GiB) LMEM
> 
> Fixes: 1e32ffbc9dc8 ("drm/xe/sriov: support non-contig VRAM provisioning")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 6a9a752fe24a..6344b5205c08 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1629,7 +1629,6 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
>  	u64 fair;
>  
>  	fair = div_u64(available, num_vfs);
> -	fair = rounddown_pow_of_two(fair);	/* XXX: ttm_vram_mgr & drm_buddy limitation */
>  	fair = ALIGN_DOWN(fair, alignment);
>  #ifdef MAX_FAIR_LMEM
>  	fair = min_t(u64, MAX_FAIR_LMEM, fair);

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
