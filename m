Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C466CC43602
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 20:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763E510F919;
	Fri,  3 Jul 2026 20:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3HE3TDC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F89210F919
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 20:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783111845; x=1814647845;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vXO5mSX1dF7Tof1AsazxCTiID2RDKICms6sUwklVQ7Y=;
 b=e3HE3TDCRXNPRyayTpqRa8WnT7TefL9DjsmupcO70iNhmHOo5GgK3g6e
 VZ/y2H2gK8kITmcf87z6hqIK8Zg5wWa8P8hQbCabiF92NouPw/cnVcZlr
 gXZS9H2Us5iYrmBhPhvTtAOpBKZ1IaFX7UKQJsRs8JYuehb/80EPW6kL9
 iiwxV+9o0PQPmFV0jqj+vG5qHUu/OKsjmQau/f9iD5YRwBwwBeFuhro4v
 nQ7wWApNEnUEPDVypBQn6dulopUHukqn0kUeYK8tjgv/fHgVbBGZSPJZ7
 lHL9VUTFvG0JQEJfeUhk2jlxfYTNRmgOIALlxiGyaezPjJ6HuU1XTOHXj Q==;
X-CSE-ConnectionGUID: qOzktfXcT123Il0qi0Lvcw==
X-CSE-MsgGUID: tv0bJq/5Q8KPTdPOYRYaPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="82966310"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="82966310"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:50:45 -0700
X-CSE-ConnectionGUID: CzcjpsqaSmOWgybO0+Rw2w==
X-CSE-MsgGUID: BNcAMpHOSjG24bJlS7MdIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="246811100"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:50:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:50:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 13:50:44 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:50:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0Vuha/kReukhVC9Qxwjo8QWV/bXNDmRddtPeEDYYo0qxI0/l0mZEd0kdLUXq1qAs0svxFgCDELpfYzXyvEfXyeP1W6ZRk6kEpnHN6v3TvJRHEFxDs0SpwJ1t7IyDsvZTzck7UZ62dleVDlxX3F6nGmBRljtYt4ujrDTu14mdQtlYh+ABmNunv0dLJotdwWamvKY+2c+2ZcXb2SiD4e2VBSuh5JyCDr8mBSN84kFWvSSg6WqBVcA09jzoNY1Br7CZbOSaZwMZsykRiauCvDMemfOrIyq1CaIGaSgdUK4u4f0ZxIlWCHUpFhKh2IKkZNYjld6Gr6lVdxJFjFIOm6bUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ew8QNhXmFtgov0dsjjnX9RIXs9nLLCQsdl2/MH49/M=;
 b=tvLw1KE21H+A9p2EsAGmWpHDj0vwLhBwsTryapa3qo8ZhoRLt6cmTqVwaFA20BlbkWgrEoxxwvyNibitA6+AYbF0kVEPZxY38D++4CZ3pIWfU4d4Y8Ypm+F2++rLErVunRczmmXTUGh/VsmYJfgYE5/ekCAoqBTE3qjiCOlJISYK3ep0RRMTjTA30o7QgkFTARoY0JMly+CeDregz4yfLGDhnjMgUyneXD/2DYkb8SneJfZHduLCojb5oInZD3lZKvMrU4njC+KfNmWbBCU8V8Rdeqd/kWpKpx/ET//C9TUfX4pBbGJ6XM9jKzi4+pvUOyfeMVRWMaKFNMpdCE7GyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 3 Jul
 2026 20:50:34 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 20:50:34 +0000
Date: Fri, 3 Jul 2026 22:50:30 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/13] drm/xe/pf: Handle migration descriptor using KLV
 helpers
Message-ID: <akggde71jagi4TfZ@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-14-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-14-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VIUP296CA0133.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34a::6) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|DM6PR11MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 14586577-9ee6-413a-9200-08ded944ba9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CLaA0GxOsmzSs96SGhBYAS645u85MIRsgY+iob6E+Eist4UjS2Z5XubSQhjVm8UmZ6WX8g8UB9cHriy6by7D1xqKSv+VtB5pl7g6cItWUqGbqsZsSjdMsu5UtHtKW4apGXV0Rw/Ub7keiqr/xjLgaNrAWAzPrizciUjxLlJc3rJjQceZGUMEKCB35U3IcAMsbkDH9n9XFVqLi8Ha8M0Sa2vkUViF6CEXOE0AMu1bWQfWX1QD7M+BfsdvhDVS8DzCDR6eCsyGHBE9ICmC7xBkavDyqqGDSfc32Uf+INtLksLIhH0RBpD5heaT/emi32fp3+LXhMrtMg5JjZL+afvdV6xdv/1ghuXVq4K/xf8WoXGh0u3+tIINtb+NJm1B+OE/zC65R6EXLBfJLmPpva6J80MVYiEBpEdYihZ6UmTjj8PMEbdRNYSkWNvTldG0oBYJzSRjAhRPEEX3uvtZBf2AGbOCxAq0IujfroG7SGJp/fz860yedjZoFWxn2pAQeNrju20pzlVdM2AK3/vuiLMFaHQn47/itT6Yr4Afyoo2fKn0J3WuSVh1Cnp2n5PfAdaEFhiLGfVe4Cccv5IiQ8OP6TF6C9vg6ewOxIJ4RczzNnrjBBI1toIBSDHzp66eBPgcH04ghfgZ3dbPrzn/wMhFWwsHDtGiqCK6Uspc2XIBr30=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M01QQUpYZ2xqeXVaM2R1dmZyZ0NZd3dmWFNjaDdacUxYRWtITFNyMXN6MG9k?=
 =?utf-8?B?N0E4VUpXMFBCMFBIMWU1amdHaGxvYlAyV0RwdjF5eTlhWEdQUmNqdHdHeXRP?=
 =?utf-8?B?WTFCMUhLWXN1a0Q5eW40MUZMei9pdTdSdWhtbW12L1lUN2VmYUNWZmJXVmND?=
 =?utf-8?B?U2ZUcjBQQ0Rld2lzYXdhUThNalFQQlFsZ2xRMk5TajZZUFFicXp5OVpJTXNH?=
 =?utf-8?B?a2Zpa1JKUitnaE1weDd0T3d3WTE0eDU3Vk1TY2JFOXJRMU44L1ZoRVVmY01p?=
 =?utf-8?B?TDdjNkpNQ0RQc3ZNTDFiYndCa0lmSjU0ckpBUG9XT3ZWY1gycFNzN3F4RlRj?=
 =?utf-8?B?Z3BqcTBTYXNXWFFuL3BSa0hDUDVRUUNkNzhIMkJKRzB1c1BreXdxVzlZQTBx?=
 =?utf-8?B?UFNWZWk0ZjY0MWxYUWY5VmRzTzdKV0hoV1h0RkpmRTRpVGdtaXNwUGxnOENH?=
 =?utf-8?B?NnZpd1NRakpCRWZRT2t4VmNhZ1dQVmdJL1psdmhOcTZVOE1GSXhCZk1HOFNB?=
 =?utf-8?B?UjV2L0R0VzNNWDFZQkNjNzZPRHZ5aW5JaHduZ3JUNmE5d2FSRTFFL2JNNmJm?=
 =?utf-8?B?MkplUkhzcEZHZHBwS09ENTk1TVFYemJsUG44Yk4xbUEzOExuRTlhY2xsL2lm?=
 =?utf-8?B?WGlxeTY1Rmg0NmNVNVJ6K1dJZ3JZTlEvM2U3QlBZNU1Oa2U4cjJLbjRyUGp4?=
 =?utf-8?B?dnRZbmNHRHVyUEJTWkpGN3h2RWgxZms1eld4QnpZN3o3NCtYa3h3QkRJbGQ1?=
 =?utf-8?B?QkFieTJpeWIxVHlpYTF6Z2d0NkdYK09QN1VBWWdncFRUVlVuazZ6QklNR3ll?=
 =?utf-8?B?VVpKVEdmVjhxK2dRVVZPVG9heFNWY2N2cHE2cThwNGx0M3lyVE9wZnNocnNZ?=
 =?utf-8?B?azdpUnVvZ2FLOEFxcFhPNGFLOEtpUXVybTFxbWV6cDA3bFhUU2xPRkUzbXRy?=
 =?utf-8?B?bFRhQktqcE5URGhpa0dNN0ErZWhYTzBKMnBNTHExVjA1aXRab3A2dFNnaXJX?=
 =?utf-8?B?SkZQODc5RjFZb3ZDOFo1dGkrNzltMFZLdDRJNzlsSEhObDlKSlBOSzdBRGkw?=
 =?utf-8?B?VzIzZXgzVHhZUHdWMTdrOGtDY1o5dmhtT3hMTUJSMGJFZ3BFUnBBa1FoVEtp?=
 =?utf-8?B?UmpscUl0SkN6RlBGbmpNMjhXVnNFRDFOZW8wMEtWK3dNZ2pnSkVDSEIwUEVN?=
 =?utf-8?B?OGZSTDNIODV2MzAvSXB6cER3WlNMVEZUc1R0MjlZVEQwNEVNa2dIY0p2RkJx?=
 =?utf-8?B?OVc5M3hzU2RubXVmVjFrM3ZKWFgwZ1FwaG5lUWNjUzN6cWVjdkJzNXJGUDdF?=
 =?utf-8?B?Uld1OTA1V2xsSlk1WUlMUnNwRlA2Rm9tQVJSdWppQ3dFNjE5eDlGR3F0NHlx?=
 =?utf-8?B?RC9xaWQrZGFBdEZGUTVGMzNBVE52WG80TlpqUmNKN2hLTzNDVjRsaGk2ZWpS?=
 =?utf-8?B?TWd1Q3NoM056QlVreG8weXlkN2N5aUo1U2lEb3hHOGZSaUMxbERraHFVc3lH?=
 =?utf-8?B?a2VWMDZSaTdwRnhEOEdFaGpSWWgySnZmV2plZGJ6TGUyMk5RUGwzWmswaHBn?=
 =?utf-8?B?SGZ6YTlrTGRzNWZIbHhJOWlnMXlFQitOTUJLa2I3NjBML20rYlNLRVhvclI2?=
 =?utf-8?B?eTNyblI3aE04ZnI3ajR1bVVQNVR1eUFUUW9idTk1ZjQ4bWs5YzVTV3ZQdnZC?=
 =?utf-8?B?bUxwcmhMMUExcU4zMlFvQVFmcG42MCtsZmMyeWNMaGtCYUxkcFNnRjJRa0FG?=
 =?utf-8?B?MmVod2g3UUlZa0RWRVBJWFpaU0g3OS83S3lMTG0yR2NJNThsQUtIVEtPdWZt?=
 =?utf-8?B?OXpPVy9mdE1JVldvUjcxYVhKK2hjeHJXZVp0S0I4cFh1Z0NJYWRuMyt1UGcr?=
 =?utf-8?B?Yjd6NG1sdVhiUk5iWEVULzUwR3ZjeS9CMHZxZzlWRjFJWERYTTJyOUl3aTVR?=
 =?utf-8?B?R0lYdEZaNDVmSEdnMjFIY3lYbWVZVTNVWmFSVkpGYTRTWk5VTWdYZWhjbGZC?=
 =?utf-8?B?bUtUbWV4Nmx3MHFuTXY5aWU4RTBpcFk3ZlF0VEQxdXYya0Zld3FHWFZxKys2?=
 =?utf-8?B?blBNRGdtMWx6eGJENkpRSzBsaERodGY4SE9sWnVxc0d2U3AzZ2lGK3grT0ha?=
 =?utf-8?B?aFZSVGRDcXdVdnA0NUVjU3BZblQvWmI3TE5MYUF6YzdHUkFSWDRibW5ueElW?=
 =?utf-8?B?dVBPaisrSG94amdHZ25lb3VNN0F1OGNUYnlJRWo4UnBhQTVlckNReFIwQW9Z?=
 =?utf-8?B?RGEyYmNzR0cwT0M1eEZBeFRuQWdjeGZIeHpBR1pkRUNjeFFuNUxUMWMwQ0lu?=
 =?utf-8?B?MmUzRjVUUWJZWXFOOEZoVWZUMEV4MTlsckt6djJxR1BoU2M4YlJZWlU4Rjlv?=
 =?utf-8?Q?FVXRyR/FLp6WUiFs=3D?=
X-Exchange-RoutingPolicyChecked: X7aPxmuypaHiXV5qLo2aGZwQ8TL5pduURWnQpkbiLQWGhVSqMNfdG4MmfmjWRI2qKMxIWHQHg1NSWrXcpmRl7zHsdOQ4k2g034Z+Z4V6rwSOM7HmPNJSGYSRMGqn3MAT7Vx638iRxRaygYv95KFKLjz3+IoUN03eBbjyaMCokAuIaYndO2wzpRr1+/aB4V+E1L4MpiShAeTwSKn7BsjX/fNC94V+r2V6HEVl+uHqSslPKNVPrUXSs/cE5ETpLThsATqGGBCaB+EOwB7DOFK3TYBG4++9W33gkdtMF/CcXkNZsWf4zlhTBkQ+9jdWx4VLwMzK/xJCAV69yqDKbdXoSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 14586577-9ee6-413a-9200-08ded944ba9a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 20:50:34.6979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/erRJTSGCGwR9SBKYBKxm7vU+4+fBfL7DECAzr7fxOf/+wjKln2czgkXsBQeVvKF6fco02XxKVh/hOOvkDAzT/dDNYDJ+fTNdKI+RThJx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
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

On Tue, Jun 30, 2026 at 03:26:32PM +0200, Michal Wajdeczko wrote:
> As we plan to add more KLVs to the migration descriptor packet,
> to simplify such extensions and avoid coding errors, start using
> our KLV helpers for packet preparing and parsing.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_sriov_packet.c | 106 ++++++++++++++-------------
>  1 file changed, 56 insertions(+), 50 deletions(-)
