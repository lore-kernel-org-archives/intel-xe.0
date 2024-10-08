Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51BECEF172
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 14:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BDC10E571;
	Tue,  8 Oct 2024 14:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aK1G+/px";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBEB10E571
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 14:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728399531; x=1759935531;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sUNiuqBH2nm1iyd3q1liQ6nhHdh1HHbL1AF1xw1pUfs=;
 b=aK1G+/px/Hh79p+FHgFIfj4VXJ8oKQDf4a1DENU7On17rQKKdNcOWzvL
 IMcwtrUmje+rJdb2GPqwNZ9q7EfzuERQA25ACPb/H2JhBAykXVdzf+TcB
 duhKH3W0Mvhmxh4lvluMqOAmR1FrqlWGaLdWquwolMhKf8NDEbJbwl5Xw
 GEy3eBcRbknadlO43GoQvA+pJEGivIuy5cYb6lRh1bP6LKl2Vo3nEW3Pl
 ayVF1NP0oo106eVjgT37JngaNzy0Fc+XZZ69Sr660jP9wpQ+4kiunf2Du
 fMrUi9jZ9cxDY3rxyX89u7agWK7NgvhJHSDIif/wwKcMAjXHQXUVFLBhU A==;
X-CSE-ConnectionGUID: besuuAudTC6sAsr+6UdiHw==
X-CSE-MsgGUID: PgLjmv4hS4iZkXdHkuX1dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27722783"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27722783"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 07:58:44 -0700
X-CSE-ConnectionGUID: Ex108cFqSuKVFjuxk+QhPA==
X-CSE-MsgGUID: TQqkBsrXRueDDpmwEoKb+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75733179"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 07:58:40 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:58:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:58:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:58:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 07:58:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 07:58:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPyRPB5VVh5/fMSJlzTyHyfbNpeBeWF1CTG6/1M9hlS7BIHS1cJYnOsjk7sUHSF0pC0FeXivaJxIuMN/8F6PhBK7P1TSDPqWuTLpJwFpKSSnesSQozGtG8bG+z9fVbUQD5GmHhf69FoFy8NLQdRDtgyhs9lCK3yVp5usepcBTJmKmsdMr7rSikJmVhiM+GNF7lyr4ZBLqiqKFFsSHg3eZ4jCNzdoNrmSY9R4SUFoTZheTW99ZEYmUR2t9bRQxnlgGvHiSqDRhf4U+5sjZIY9A4I7ghK9uZNxl9DfBswIYZqzNIy78s7G/1Urz721xkEb/qPR98b0n+zT9fTgyovPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPxQnDiPtzG+s7xZsk20F34Xn7ov48CJfbgmWsjWu1g=;
 b=MP7XuhdFds8TtNaAPWW9ihqMR96rCqwy4AjliBk/YmpSEjEwE2indDG9k1AUKqCowJNekcB7gOC+mDCDzVzJTVPpLHGOnCxzyrZbeX9qJKjchUa151GRv7BPxWwvdeZN+NUhY7LOFabt0GlmaXn67zbUoWxCWKKj35Pq8fmNew8N0AGv9hoKx197lc+oobQlA4h0EyssipB5y6oH+vPCq5VnHqOcBWjVNHWydYx5fi3KwV87/qs5i8+V/Y1+ClBXL5QXKtKkVkSoToGVwkLmL+AvEWQdI8lzliU+F6kTGHQD4XVGn5lcepvHIUj4oEEjj4lSZhA7Q6ToRl8HGkzIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB5198.namprd11.prod.outlook.com (2603:10b6:a03:2ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 14:58:37 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 14:58:36 +0000
Message-ID: <62289d21-2a98-4b4e-98f3-ff421ef867eb@intel.com>
Date: Tue, 8 Oct 2024 20:28:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/26] drm/xe/forcewake: Add a helper
 xe_force_wake_ref_has_domain()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-4-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241008071115.1862704-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b09e21b-2c72-44cb-48f7-08dce7a9afda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1ppTDNlczh5Wlg5REpEMDZDK2plbEtXVlNmTFk5ai9JS1lWUFRLNmN2RGo2?=
 =?utf-8?B?N1NNMXpaK28xOWhCd0pXSS9rbXZ5QWZRREc1YUljZXlTNGd1N1QxMEo1ZEY1?=
 =?utf-8?B?L0QyN1NiQlRDMkx0OFNsYUVTeXhpRGVwdFNydVg4S0crSTR6bzdMeEZheUJT?=
 =?utf-8?B?STJIUUlSTG9MTWpXYit3dlFtZUhSdHhZbk5uV1AwSXU5TXc0SEM4dEtSKys0?=
 =?utf-8?B?VDRCc0NIQjhDR21mWXNlYTBGYjJqZlMrL0VtNzNWcUdDZHUrRTZhZVV3NXJK?=
 =?utf-8?B?d3lXUzhUZHU4TE1WQ3FBb1MvaDVXTGxLelhxUFFvTlhlWnZiTjl5MGZLS280?=
 =?utf-8?B?d01XOTloYnJ3YkVUUDBSa2VrNkNmd1I4T0ZRd3R3LzlQTDh2MHVZQnF2citZ?=
 =?utf-8?B?dGtOS2tpb3dWd29CQ2kvY2ZVSlFKbGg4b2x5QWZzbVlIaTZvS0dhMXhWeE5H?=
 =?utf-8?B?QzBjS0g0NUlKNEtjWnhDME52QXpXem1MS1lXakxoNStnQVkyU2lpcldwbGtl?=
 =?utf-8?B?QVZzU2pZbUd2UnhVR0NrVVkwWDNSaEJlQmpTci9COEsvWDZSaXZHc1FiMnY2?=
 =?utf-8?B?M2dDbkd0RHVDUHVNVmhyT2F4MERzbzFIbU9QWWZpYjhqKzRKVzhaMHN2TmRj?=
 =?utf-8?B?OUFlWTBhQ0hwelNyVmM5N2hYbkNSMlJlRWt5Wkx1VVJZTnBmYWFNRFlPTlFM?=
 =?utf-8?B?V25ZbTBlS0paRFNrZUFOa0I5SUJEVmRxQS9TK3M4cFUyaUtTbFgxUDFobTNV?=
 =?utf-8?B?QVdwQnJXTE82Z0JwQlZlbmpyR0xqeVRwR3RKNWxGbUlGVkhkWmh0Q3dPRkpv?=
 =?utf-8?B?Q1lZV3ExYkhqSSticnMvZUh2QVI3bkdKd0Z4TzFGTDg4VnlERzdwbXdMV2kw?=
 =?utf-8?B?dm1DcjZ2SHpmWG9uMU8xbjlJY1RGUlZ4ZjFjeDZwVXBJRUd6NDZWMDF5QkZC?=
 =?utf-8?B?NWJPK3AvbFZZcy9tNkhSMlJNcTQ3R2FwZ1JJNy84UUtjT3FrUkZITnR1WHpY?=
 =?utf-8?B?TnNzYTIxWmoxTituL09ZNlFOODc5MzlOak9PalVuL1ZjS1J1YU1qOTFqcUR1?=
 =?utf-8?B?b0VxbnVSVjJTQjhZdXBlNTZyRndUQzc1UHZTTG96UjFBczNPdnFVMUJ4K3U5?=
 =?utf-8?B?SUdva2pxUDBjREc5bkx4bVI0Z1pobzZ4TmJKNmpVb0JuTHBWUWYrM0ZwZHhz?=
 =?utf-8?B?ZXJkTjVpY2FjMTZtVVp6aHhsRHpSbytBNkJEclZKREJvdFlYbS82eEhVWnBo?=
 =?utf-8?B?UXRpem92T0EzWGlWaElsMjFlSWxMbVp3UCtJc1IvZWRoWCtTNFNIQ1RMaW1T?=
 =?utf-8?B?dTJkWmk1bjFyMzFBejVmVTdVVGJ6TVJIRy9jK1NpL0RnWElyRlBONDA4WXEv?=
 =?utf-8?B?YllmZmVlTGZNSTJHYU9DMGdTZzBCTXc4c2NDY0NQNEJ0THRMMnp2elNOdXEw?=
 =?utf-8?B?L3NMaHZiQTR3b1pKQ2pCSmZEUXlIcHk4TWV5YS9nL1VMbEVmVXJHTGMrdGRN?=
 =?utf-8?B?YnpRS2Z4ay9JTnl1ZWhPaHhJQmgyQWNmdlpHQ0lUQ2MrT2EyS1huaWpJZklj?=
 =?utf-8?B?ZW1ENEc1RWkzTDlMemdNQmFWY1hnNy9iUG94WWJ0S08rYlhEZkhwTENZNHo0?=
 =?utf-8?B?WWx1VS82K1pHUmR4MkJyZ09aK3JKUFJwQ1dmNEp0YVZEMklXYzdPS3lZVW1S?=
 =?utf-8?B?MFNqYWQ2bVg1Y21Odmg4MC9uNmRSTjVOZDNCM0dCKytpUVJnSFI2V1l3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlJSdVByZ21EYlNlYjkxWHk0MG5EOFVnK2lpVVhKcU03eUg1V09yQ1NjTklG?=
 =?utf-8?B?UGhGTWx2U1FkajRTRzU0Y0tCUGRXdUNFaURESTJMUEtVL2phTCt3Q3ptamRG?=
 =?utf-8?B?V0tOY0taTk1pMVhablVIK1hiNjVoRStxRnZsalJXaXAvSVU5QXRjcTcreTMw?=
 =?utf-8?B?a1JkYW1iSml4Zk9FVkJNeEUzZkV0SkZmK1R6V25JQ1NEY0ZWZjZwV0VLUVhL?=
 =?utf-8?B?Y0d5bUFnOXluUFFScGhvQnVaWDZmZE1idDZxc2NnMmpYZ3F5b2tHNUZ0YjA2?=
 =?utf-8?B?RllGdDRYaFNXQlZ6Um9MVkxad29tVFdBVGpOblpITEd1bkdoVnlab0lXaCtK?=
 =?utf-8?B?UFNUZU03Mmx3T1J3VElXd3dpZUFScnVoelJLN0pBbDhTdlM0ZUxPdXpzK3BS?=
 =?utf-8?B?aUF6L1ZoOVZwdDBTRVN6UFdGVFQ5RGkxT3R4RFIyZDFvZkxlWEZxejV2dkl0?=
 =?utf-8?B?KytkcVZTbzRkdXBBRVMwKzZpYlRlaDAxQWs3Zy81bVNJYzkyUUNuTzlxUm9O?=
 =?utf-8?B?ZXB2UzZOSVo0L3RmYi9rTlFkUGdKNnh0ODl4c3F6ai9zbXJKZUpYU3M0U2Qy?=
 =?utf-8?B?TjBlMVBJQmpLajgwQ1c1Y3JoVExia0V1ZFBHcCtQSWVoOWZ5RVU4VGozWTR1?=
 =?utf-8?B?Qmtpbk1KbG1jTHZmWWpwWmR6YTMyRGJnSTQyeE9CbnpNMGRxMVVGTDhmMHRn?=
 =?utf-8?B?bklJQ1psc0w5KzVIL2REUlFqWUVScDZmWU5wWVZJcStFb0d3NC9aNVRMVEdq?=
 =?utf-8?B?Yjgzb05CdVFabXNNUlhsb3FHTG11SlJYTmlndmtpK2F5aElqc3pRQTdOeVRl?=
 =?utf-8?B?Z0EwbnZXeFU5SXlWdXhjZXR0QTkrNXh6TVU2eW0wYm5NblA4UXpJZG1mcG1x?=
 =?utf-8?B?blBWR1l1R0JNNktzblB0TklyMnNhVnIvTDJPZFpMVU4ycGZMRTFEdVo5Mkc3?=
 =?utf-8?B?NFRjaHpPUXpwTXpyeWNNY0MybEFhMmkrcm5nNHZEYkpVU2VyZlpqbTBoSjc0?=
 =?utf-8?B?Rng2TmUvVTBuU1dWRU1oMXl3MHpXU0dYQ3pLRFJFRmIxZFgzTDZ4aXJNbXQz?=
 =?utf-8?B?VnA5UDJXeVdxeXdlTFlxeDNQbm1iRkpPdGJybkJXRGhsSUVUSHY4eCs0dUNR?=
 =?utf-8?B?ckZka2FCWXR5Z3o2Z203SERrNjlaTmdkNlR3R2VZR29NS1cxeXpuRmltQk9V?=
 =?utf-8?B?OWRlNFpQVWZRMEVvVVR3SW1rdjFFZEJaOUJUNnBmcXAvUk11TzZHemNjNWFB?=
 =?utf-8?B?TXE5VG10elV3TUxFZVZlRHNnSlpyYngxOHVqZmJvZ3IrcmlzVUk1Rlk5RTlk?=
 =?utf-8?B?SFl2Wm5tQmRFeitrb3NDMlVTNTZ1VWhGWE9sUC9VemJLUndUT3J5VWZlditM?=
 =?utf-8?B?YTI0Zlo0NmVnczEzRjgxMG5WY0FvOXBqaUtmZVAweWljdTlRa0Y4TjZDTkFK?=
 =?utf-8?B?SjdjUXNvUjg1cGoya2NKUHkxemVLNmN2dEN3eFRJR2ljQW1DblUwNEw1YjJJ?=
 =?utf-8?B?dzlRTmxEYms1Y0hrZ0JOMGhTYVF4d29hRzBRRktZU0xyaEh1NGdYU2Z2Qmo3?=
 =?utf-8?B?bTk2Zk9KeDk4WTBZOHVUVFBPT0R2UlRQd2xjdDJoWGZ0SkNRY1JPZ2FEUmhQ?=
 =?utf-8?B?dFV4ZDF0UE1HV2VQZTdqaERtLzB2NDg2UEpTSlBkZnIyWVVJRVE3d3dFZmxv?=
 =?utf-8?B?OUlURG9jaUZFaHBOUFZOQm5ETUF0SlFvbitOTVJjYmhjbmc4T01OWWk3QVBt?=
 =?utf-8?B?cWtLZzZPa3doWS9VRC8yZi8xK1NPL3hIQkhWTmd1UVFaZ3pZOGJrY3Axay9H?=
 =?utf-8?B?V05SOGk4SW5uNERKQkh3WTNHNUpKTHF3aEJ2aDhncEt3ZXdoZVJFbUFQZkpn?=
 =?utf-8?B?c3IrRWEyUlJhUzVKMVUyN0ovVTNKYlBEK2Z3VEphMXdjVEZOSDhjQ2k2bEZY?=
 =?utf-8?B?V3FSOHlvaEx1djFNTVZJMTJYNEZoM2VuQ0RITlplWVBmZFJUdVRBcVg3ZTEw?=
 =?utf-8?B?ZGhkdHZjUWJ3WTVXaWRRdHhuQ1pDaGRmODEyYVp0elYvTDZ0Wk5BNlVnbUN4?=
 =?utf-8?B?MWlvMXV2dzlxVWE4Z1VpRzRKTFkya0FXRndZV1JYdmk3VFhsdFN0ZUJqL1RF?=
 =?utf-8?B?bGhhRWxuU0kwd0lzQnc4Q0lDQ1VWTEdnVEtRMHhVOSttYWFVcVRLTG5pUHI0?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b09e21b-2c72-44cb-48f7-08dce7a9afda
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 14:58:36.8753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mosNzNRDudHE7Wva2UL8Gw9bsk2bi19YIxmBahlYbRCjXnEq47BQg7qgKuRktIXHpjsPj4Z+ICN4aVQE87/Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5198
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



On 08-10-2024 12:40, Himal Prasad Ghimiray wrote:
> The helper xe_force_wake_ref_has_domain() checks if the input domain
> has been successfully reference-counted and awakened in the reference.
> 
> v2
> - Fix commit message and kernel-doc (Michal)
> - Remove unnecessary paranthesis (Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index a2577672f4e3..1608a55edc84 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -46,4 +46,20 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
>   	xe_gt_assert(fw->gt, fw->awake_domains & domain);
>   }
>   
> +/**
> + * xe_force_wake_ref_has_domain - verifies if the domains are in fw_ref
> + * @fw_ref : the force_wake reference
> + * @domain : forcewake domain to verify
> + *
> + * This function confirms whether the @fw_ref includes a reference to the
> + * specified @domain.
> + *
> + * Return: true if domain is refcounted.
> + */
> +static inline bool
> +xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains domain)
> +{
> +	return fw_ref & domain;
> +}
> +

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   #endif

