Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3E7F54AD6
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 23:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B832210E19A;
	Tue, 24 Mar 2026 23:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ca+mosSh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338DC10E19A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 23:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774395386; x=1805931386;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TOUQzZrZma6yDudFO4cdhIS+WtkmvBic5wImCHnq0uE=;
 b=Ca+mosSh4nOwyNEWGVOkZMgXqLI2+abOKfABdGguN8nx93XHJ7GX3ym1
 hj5r71g1e1z+D7YyVbQknQNqhQ1WMk+4voGDLYn7FMVFrQxO+uoWv45gW
 7RPi80lItwHo0yLmTrZVbrl2iDJMZxiwfVJnb4SSse/etN2eENQ8DQWFT
 RG22lfBuqXe/2N/tXldSC4h+OdASRkBjHM0uhUos9F1hlshGr9lGAgJIA
 PuHsIrc4rVu4OS25tZF6fLflxIgU+5TTs0FoxFiBY+GQQV2vre4n9QN/A
 Q4oHBWc3hDfiRjk+JKOdgeXQeH9mrslqnseSgpZMiPUyQpf9MKmUs5CSW A==;
X-CSE-ConnectionGUID: zOho37J6S96sH9fBmOvZcA==
X-CSE-MsgGUID: 0ytr7vSVRxewf9+FMD5Glg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100873576"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="100873576"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 16:36:25 -0700
X-CSE-ConnectionGUID: uSDbDgNNQk6dscwDgf3/TQ==
X-CSE-MsgGUID: 3KW32Na9S9eY/6N++CJl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="228555179"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 16:36:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 16:36:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 16:36:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 16:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxMuRb1JvvU+u7j+srYMOJdGjQ90c1u5LA8Ww1ZrnYqH+C91CBPdhuji/sL+9LZsUKV9XZ7q+nvtt08nCvd16YLDqYLP28aXE7DieKwUa7YkQG9plvkRqSYn+iw7U+lt0MkFc0kIU2doYg8NRa6a7HqBTrx+JjWEw7XHiSAPMMDnmAWfk1g22rPaFMi3CXJgG4BCEUihlRGyz4Ay4Q6basr1FEDczCSsBaWi5SNXKdXbBPNkf183lkTNONe+dBa8T+s+AEnsC1BUYcehC6WKauhU4opTN5TCTrEyYWg8SeJNSurf3Mk8yBbEJec+WrUQ+ugUGvG1zrzbHvCHiLly7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWt+xICi9zyzZU+cDysj3Ase4IT7ObqnvLq2cXahNAw=;
 b=J+bEaY4NlGWIj/LKpMxJO8prXbmTMjKlxcEOjCJkYjqCre7EulzWCXnkE+7IbTdx9oZpv8UxDNRe8xsIT4uhy1JtMcKjNZIhJHup2fMDdNa6EdaOvnKU4s0LtOJjt/xxsHdBYc3HTBkXHYyPUgCMMkcmWiKrzJpxemUgaETen6ctKBImKozbedVOmTiZndimVDfUVKE53oklN3DlWJ+ZMYp5fVuH4dFvU/gYJLBR74q+22+RDYHbskoPO3+wElQkMVc2kF7M9owqpeqhRlR4MquF0RLTjjoafqyKkMGeO469En7RPYFgM/WO+Pt5WpQBH5NP/30VfyvMCoGqL8bXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA3PR11MB9225.namprd11.prod.outlook.com (2603:10b6:208:570::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 23:36:22 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 23:36:22 +0000
Date: Tue, 24 Mar 2026 16:36:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Yang, Fei" <fei.yang@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Message-ID: <acMf8wr1wfHoRoWE@lstrano-desk.jf.intel.com>
References: <20260317232133.4106716-1-fei.yang@intel.com>
 <6a481f4d814c4247dcb62929b72e153ab7905cc7.camel@intel.com>
 <ab9/o3gr002U28RM@lstrano-desk.jf.intel.com>
 <BL3PR11MB636276501728DE765677A4B49A48A@BL3PR11MB6362.namprd11.prod.outlook.com>
 <acL5x1AakzkokUzt@lstrano-desk.jf.intel.com>
 <acL7D7MVf5F32C++@lstrano-desk.jf.intel.com>
 <b253dfa6eb00aaa61f57d7c9694fec3fea68b79f.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b253dfa6eb00aaa61f57d7c9694fec3fea68b79f.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0292.namprd04.prod.outlook.com
 (2603:10b6:303:89::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA3PR11MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd5112e-515f-4249-823c-08de89fe2811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: /nDWOHGZyF8DEzsrPJ5htMvvNX+V6L6LYrfQ9heodjSWlPCKyP3/Mtf3U3ytQnY/nNyOdpuSpj/vc/YUs4XLHQFVe3SZTZs+ilwTEwWuR+hT+BUW9eNGuU1HcoqYIXlcG12LS/Ky+DzwZGyDI35nSu6JAzh3qEnxwxdXc5urvs5RLWMpns0dDz5LvKCZK0xCauI9PTTEg9+8Sm+oJiDx+FWuq35F8WJKNt46oX3ArkkYwDKscpHgfYKJTLtWkrTxIFxFVrNXIomiSMmzC25NHgiMpKmU1ignFlVlDbd4h7GHusfu3BMny3WH7UxHRT2aro5PN165YX5JE3gus5hDj2XXVp7wbjr9UCssrDA28djKuC4216v7as/PJt9m4/D40+aIfQmDvIt1ScCq0hOFhTiTaYmpFPcOydDMQZhkmUYNPlutga85sL4Yg4JJ0BXtH3mgNQfCBidHkE/x/jaOw/Np9mNwfzfVJ/WqCDy1jdJ7lyRCpaeX+82vuI/enonS1eIw/pMEEhON3JBc3Kf3Uj4D53XouBD11NC0PaREEC6HFt/8Yv9Bu3ktaLTvxqmVt48f+lCaHDBJitLhhABvVBUVLcj6/8J6aRHTGSPINo9jX+4v4UVsr03f7z4EcSejgH4QF7sMat3MXUAxT0HeR9mkFXJnbYqR9pUtNtDPCg2moEKnE3HS7FEWh9WcttKO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGMvQmNIMitPTDhXZ1ZoNFQ2aHB1MmNvT0N1R0NoK29OUEEzVEFoYy9wcGQw?=
 =?utf-8?B?KzY1elkwdVZKQ3NhR05yR1BnRVpwZktOQkluUllmYWtEUUFTTURnWllqckRx?=
 =?utf-8?B?cnQzY0ZxYWdhTm9seTRoWWk0cytVYkJFa1E0UVVEM1dtSVdLQ3dsMWNsejBm?=
 =?utf-8?B?aE9tVnYzYjMxSGpoaHlBa0FLT1lWMVU0VkVJb3dLdUthb3dGb2R5S2JkaGV3?=
 =?utf-8?B?dTVpUVdBdGRwSVhLTnJxTmhWQ0ZsN0taVkVpdnQ3aiswdjFYWDhpV2kzZERw?=
 =?utf-8?B?cmlIQjFiODVDS2ppbTlqOEtjSkFXSUFNSFpYMWhYMlJWeXdMaHh1MUE0T3Nh?=
 =?utf-8?B?bFFMYjdYUTZ6U292QlFQcHgwSzJvdUFvbUZWVi96M0JNbjVXVG9nT05ZanZJ?=
 =?utf-8?B?ZUVuaTdZVnYyM3daN2pZOGhmTlBJa3hDN0dtbFlQYVRCOFZWWWNCRitkYkFQ?=
 =?utf-8?B?bXVUYUlEanI2SDJkOHczQUk0Um56MkdTdTNvbXZDZkZMc1R4ODFxTGoyVFJK?=
 =?utf-8?B?eGVXb3pxbjh0Wmh0SVV3MUN6NVRYTXg1T0xVVVp2OWJZdG5wNE5qb1RBYjN1?=
 =?utf-8?B?c3Y1cHo1d3dWVVd1b0RCU1VIMnpNQjE1ZDY0aGNJVEEwS2ZUVXc2NDk4MEh6?=
 =?utf-8?B?UXRNUFRENlBSU1JNTEtPYmZXTFBRWDI4ZzR6VUxENVNnS1R4L05HZlFvOTUw?=
 =?utf-8?B?ZDQyaUFaSk83RDcxQlVrYXY3d1p2ZC9rWngyeUVTRkQrUXFERHpySEpsaWZq?=
 =?utf-8?B?clJnN2FCbTBtRDc4dDVGRWRtOEdXNkFURHRyMkFjamNSRGFtZ0N2bXp1M3pU?=
 =?utf-8?B?NmMrOHVPQXM4OVdwdXd0aDZVNE82R1Foa1VXaVRTK1hMQUVwYjY2VlFFV3Ez?=
 =?utf-8?B?RTFRZ3RmU0c3OUVTQ2NEd2NEaHc2MEFwV29mYVNzVmZHdlQ4Y2tzdUlkS3FV?=
 =?utf-8?B?OVZkbjVvd3Q2RzdXb1d0UTJWS3pMNEVWL3FGcnNFdVdiN2lUbWhjbVJuNEtq?=
 =?utf-8?B?VWdzQ0xKcTJuMmtCY1dHU0VqRU96U3RFbkNtTlVCKysxMHhPQjhlaDgzME02?=
 =?utf-8?B?Yk96Unh4cmU1Y0l4YTFBUExLa2pWTnE4QWJEWjRhb2pTMEZpWVVQRFhuWmRP?=
 =?utf-8?B?TCtMcDZHUHVDc3pDOTkwclRxNTJzN1RhOE1lOG45L1plL2hseTVqRXBFNHV3?=
 =?utf-8?B?aUJxL1Y3T1BPeS9la0dRbjdLNFpicHphdWxqdmhuYmd4Q0JQMnJCekN1cGdv?=
 =?utf-8?B?cVBwSW1YaEVFWXltVDZiemI5ZUs1aGtWNkF2dlYwclErTmoyb08ySnRlTzZK?=
 =?utf-8?B?d1Zhd25pOE9TOTJQbTRxUGpvN0dkM0tWV3V5YW55Vk1UQnBtU0h4QXNpanVO?=
 =?utf-8?B?em0yTkhJbE8xWXBaWXhGRlRoRjRQSWVXUGo0cDc4VFJmVEFkN2syeHQ0ekZU?=
 =?utf-8?B?VjN6Mi9oYVBPRGxvS3BMaHQ4dEk3aHhzdUlLUzAvMTBZeThqQW9PcHowenpJ?=
 =?utf-8?B?eTRRR3RPUjlwa2V2UDhJell6dWJ5YXBsS05Pa0tYNytLZm1aU1kzY3pCWHkv?=
 =?utf-8?B?Z3JXdkZqcUJiRE8yNm5WZmFYdGx3RkY1SytFc3FINzJRSU5YRmhiWlZHTHFz?=
 =?utf-8?B?Y2ppZUNoczFlWTR3U0JCNDlBNGtrRWhad2ZDZUdZYmI0eVBlbGVEVzBGYlFr?=
 =?utf-8?B?YlR5Qm5XZDdUc3JReERYT0orWGpMZnluMjNxTkc2b2lETklRU0NtRm9URUZQ?=
 =?utf-8?B?TC8yN3RDSkNYVHFvOXdDQzBSSjQwRElyaVdUaTJVOUFiNUk4UGx0Z1VITkpZ?=
 =?utf-8?B?TDlnTDJmcVVJek12eUtJSy9TeTdDdGRhWGN4MFdEVHdyV2F1VEJZREtsY0ho?=
 =?utf-8?B?ZWdyMXpPRlloMkNoOFJtNnlnQWtKRWNVNHBSU1lpMXoxajNhRENEQ2pVL2xY?=
 =?utf-8?B?Q2NTeDdBZ1pRNE15eldmZjdnWDdoUkxSWFFLUksvTVFBNEEvMHc0UHZDdjk5?=
 =?utf-8?B?Nm5sTVdTWnhZWnEya1dZb3ZlNldRU0tFODJRQllHSmRyNS8wM09WVGFqMjBV?=
 =?utf-8?B?NTl2MWlJU3VqUWtPYW8vUmJ1K1k0UFQxZExnQkNyL1BZVzFLeGVMSW1xbnpP?=
 =?utf-8?B?UjRwZ09BYXVYZWZhUkxmUUQ0VGd4WloxajZBeStpRDdpd0k1NW9pSjVMZEpK?=
 =?utf-8?B?clBEUkZoRHlBZmtMbkZFNjQySC9TS2x5TEQzamtjb01WaFU5RysrL1RtNjRp?=
 =?utf-8?B?K2FPa3A3aGtTN2l1RllRNDNvS2wwME9tQXV2Y0pOekFHellTNHBRbXVvaXRN?=
 =?utf-8?B?ckoxTk1LaXh2RmxHNVpTdHZWanhVT000bEZRU1hQN2FFdUZCeW92R1RyZjNr?=
 =?utf-8?Q?tJa7KsUspkS3N9Uo=3D?=
X-Exchange-RoutingPolicyChecked: Qd6eID8I/5+ud1fwSNuJDOnkqeqWN7LCEC6ym5+xiKryNfkHQH3rw7m7qEdG7qDQMXUNw1is9a/PoJELi6ne1cmfMIS3a5gS1omGugDyfVpdjvqqt9DrF4zca+vrSxfolSH+8vPTEAzs4YXTV9jYyaJSK6035RaV2VY0FKhsl4l8KwrEqbofSMi8BH8cCMse9sPJXURzFy2qBdannpIfxoRjYmnuvs8rDwwYZvH7SGzFuc7KOxEv9WeJEWJJG6Du+9Mf8+ALbtdzB7ZgslHmbaH4fwgWzrap51X82TPzBuU+czqvj7VScrK3AgAYkykzeAAlF1HYOTzbDrSxifelNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd5112e-515f-4249-823c-08de89fe2811
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 23:36:22.1647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKjHfsUGhBr8Ls0EnmQ3j1B5r1VN7P4YFOF8GWRISrtd6Z8NLuqm/lT6kQ72O3xoh2KDAP/6YtobL0q8e1Q8dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9225
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

On Tue, Mar 24, 2026 at 03:10:41PM -0600, Summers, Stuart wrote:
> On Tue, 2026-03-24 at 13:58 -0700, Matthew Brost wrote:
> > On Tue, Mar 24, 2026 at 01:53:27PM -0700, Matthew Brost wrote:
> > > On Tue, Mar 24, 2026 at 02:39:54PM -0600, Yang, Fei wrote:
> > > > > On Tue, Mar 17, 2026 at 05:28:14PM -0600, Summers, Stuart
> > > > > wrote:
> > > > > > On Tue, 2026-03-17 at 16:21 -0700, fei.yang@intel.com wrote:
> > > > > > > From: Fei Yang <fei.yang@intel.com>
> > > > > > > 
> > > > > > > Hardware requires the software to poll the valid bit and
> > > > > > > make sure
> > > > > > > it's cleared before issuing a new TLB invalidation request.
> > > > > > > 
> > > > > > > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 15 +++++++++++++++
> > > > > > >  1 file changed, 15 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > index ced58f46f846..4c2f87db3167 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > > > @@ -63,6 +63,7 @@ static int send_tlb_inval_ggtt(struct
> > > > > > > xe_tlb_inval
> > > > > > > *tlb_inval, u32 seqno)
> > > > > > >         struct xe_guc *guc = tlb_inval->private;
> > > > > > >         struct xe_gt *gt = guc_to_gt(guc);
> > > > > > >         struct xe_device *xe = guc_to_xe(guc);
> > > > > > > +       int ret;
> > > > > > > 
> > > > > > >         /*
> > > > > > >          * Returning -ECANCELED in this function is
> > > > > > > squashed at the
> > > > > > > caller and @@ -85,11 +86,25 @@ static int
> > > > > > > send_tlb_inval_ggtt(struct
> > > > > > > xe_tlb_inval *tlb_inval, u32 seqno)
> > > > > > > 
> > > > > > >                 CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt),
> > > > > > > XE_FW_GT);
> > > > > > >                 if (xe->info.platform == XE_PVC ||
> > > > > > > GRAPHICS_VER(xe)
> > > > > > > > = 20) {
> > > > > > > +                       /* Wait 1-second for the valid bit
> > > > > > > to be
> > > > > > > cleared */
> > > > > > > +                       ret = xe_mmio_wait32(mmio,
> > > > > > > PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
> > > > > > > +                                            0, 1000 *
> > > > > > > +USEC_PER_MSEC,
> > > > > > > NULL, false);
> > > > > > > +                       if (ret) {
> > > > > > > +                               pr_info("TLB INVAL
> > > > > > > cancelled due to
> > > > > > > uncleared valid bit\n");
> > > > > > > +                               return -ECANCELED;
> > > > > > > +                       }
> > > > > > 
> > > > > > Is there a reason we aren't waiting after the write to make
> > > > > > sure the
> > > > > > invalidation completed? It seems like we should be
> > > > > > serializing these
> > > > > > and at least making sure hardware completes the request
> > > > > > rather than
> > > > > > just sending and hoping for the best.
> > > > > 
> > > > > Yes, this is correct—we should after wait issue *if* this code
> > > > > is actually needed.
> > > > 
> > > > No, the issue is that software cannot issue another TLB
> > > > invalidation request while the ongoing
> > > > one has not been completed yet. Otherwise the hardware could
> > > > potentially lockup.
> > > > So we need to make sure the valid bit is cleared before issuing
> > > > another TLB invalidation request.
> > > > 
> > > 
> > > Yes, but we signal the TLB invalidation fence as complete without
> > > waiting for the hardware to actually finish. The locking here is
> > > also
> > > incorrect for MMIO-based invalidations, now that I think about it.
> > > What
> > > really needs to happen is:
> > > 
> > 
> > Ah, this actually another weird corner where we take down the CTs but
> > GuC is still using the GAM port...
> > 
> > > - In send_tlb_inval_ggtt(), if the MMIO path is taken, acquire a
> > > per-GT
> > >   MMIO TLB invalidation lock after obtaining the FW
> > 
> > So maybe 'Wait for the valid bit to clear' here too but this still
> > isn't
> > fully hardend as the GuC could immediately use the GAM port again...
> > 
> > Or perhaps we go straight to my suggestion below - when reloading the
> > GuC issue MMIO GT invalidation...
> 
> I feel like we really should be avoiding these MMIO based invalidations
> wherever possible. It creates a lot of race conditions like what you
> suggested or even parallel invalidation between the GuC and KMD while
> we're tearing down (KMD lock might not be able to guarantee the GuC
> isn't still invalidating).
> 

My guess is the issue calling xe_managed_bo_reinit_in_vram on some BOs -
the GGTT don't get invalidated GuC side and it reloads with stale GGTTs.

> Can we instead rely more heavily on the GT reset to flush the TLBs for

We likely need a MMIO invalidate whenever doing PM resume events too
as memory can move without PM refs (CTs go down when PM ref == 0) if I'm
not mistaken...

I'd also like the GAM port interaction broken out in component like
xe_gam_port.c (with a dedicated lock) in this seires [1] albiet way
simplier as we only need GGTT invalidates at this time.

Matt

[1] https://patchwork.freedesktop.org/patch/707237/?series=162171&rev=1

> us? And for the GuC memory specifically, maybe we do a full
> invalidation after quiescing the GuC during hwconfig load (the first
> time we load the GuC during driver load) and before any kind of
> reload/reset?
> 
> We'd still need to cover the case where hardware is fully hung up and
> GuC isn't responding, but then I don't know that we really care about
> MMIO based invalidations since we'll want to fully reset the GT there
> too.
> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > - Issue the TLB invalidation
> > > - Wait for the valid bit to clear
> > > - Release the GT MMIO TLB invalidation lock
> > > 
> > > Without this lock, two threads could both observe the valid bit
> > > clearing
> > > and then both attempt to issue invalidations, clobbering each
> > > other.
> > > 
> > > > > This is early Xe code from me, and it’s questionable whether
> > > > > it’s even required.
> > > > 
> > > > This seems to be required, otherwise modprobe would fail at
> > > > golden context submission,
> > > > [  480.237382] xe 0000:01:00.0: [drm] *ERROR* Tile0: GT0: hwe
> > > > ccs0: nop emit_nop_job failed (-ETIME) guc_id=4
> > > > 
> > > 
> > > I’m somewhat surprised by this. A better solution might be to drop
> > > the
> > > MMIO GT invalidation code in xe_guc_tlb_inval.c and instead issue
> > > an
> > > MMIO GGTT invalidation whenever we reload the GuC.
> > > 
> > > We can defer trying this until later, as it is a riskier change.
> > > 
> > > Matt
> > > 
> > > > > Typically, if the CTs are not live, the GuC isn’t doing
> > > > > anything meaningful in terms of
> > > > > referencing memory that the KMD is moving around (which would
> > > > > require an invalidation).
> > > > > So this entire flow of issuing a GAM port TLB invalidation is,
> > > > > again, questionable.
> > > > > 
> > > > > So I'd suggest move the wait after issue, plus throw in:
> > > > > 
> > > > > “XXX: Why do we need to invalidate GGTT memory when the CTs are
> > > > > not live? This suggests
> > > > > the GuC is still in the load phase. Investigate and remove this
> > > > > code once confirmed.'
> > > > 
> > > > The issue is a consequence of an earlier failure which caused the
> > > > CT to be disabled. And the KMD
> > > > sees a bunch of TLB invalidation timeouts.
> > > > At this time I would expect a GT reset, but that is not how Xe
> > > > behaves (the ole i915 driver triggers
> > > > a GT reset on TLB invalidation timeout if I remember correctly)
> > > > 
> > > > -Fei
> > > > 
> > > > > Matt
> > > > > 
> > > > > > 
> > > > > > Thanks,
> > > > > > Stuart
> > > > > > 
> > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > PVC_GUC_TLB_INV_DESC1,
> > > > > > > 
> > > > > > > PVC_GUC_TLB_INV_DESC1_INVALID ATE);
> > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > PVC_GUC_TLB_INV_DESC0,
> > > > > > > 
> > > > > > > PVC_GUC_TLB_INV_DESC0_VALID);
> > > > > > >                 } else {
> > > > > > > +                       /* Wait 1-second for the valid bit
> > > > > > > to be
> > > > > > > cleared */
> > > > > > > +                       ret = xe_mmio_wait32(mmio,
> > > > > > > GUC_TLB_INV_CR,
> > > > > > > GUC_TLB_INV_CR_INVALIDATE,
> > > > > > > +                                            0, 1000 *
> > > > > > > +USEC_PER_MSEC,
> > > > > > > NULL, false);
> > > > > > > +                       if (ret) {
> > > > > > > +                               pr_info("TLB INVAL
> > > > > > > cancelled due to
> > > > > > > uncleared valid bit\n");
> > > > > > > +                               return -ECANCELED;
> > > > > > > +                       }
> > > > > > >                         xe_mmio_write32(mmio,
> > > > > > > GUC_TLB_INV_CR,
> > > > > > >                                        
> > > > > > > GUC_TLB_INV_CR_INVALIDATE);
> > > > > > >                 }
> > > > > > 
> 
