Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF9BCC6B1A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 19:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C314F10E5E5;
	Tue, 13 Oct 2026 19:14:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52DB10E8DD
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 19:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918841; x=1823454841;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h/e6yfCpWt+2OWUKvC28zsiC3/tqRH/hG+r2M8XeXKo=;
 b=hyjiYgcrUpWbpiQEieCYrGaL6D7RQ42UrvpNSKitHDURigH4c08TxzM9
 bKI6/GLQrBvu86NTn/HyFj74xtijJ/Z/DPWbM4RkJiCaIGigkzx4vK5Ka
 59s90JsJds6IXP51aIYk7fvbZq5uqrxn9BscK5r9suhBqveQemywNBCIr
 S+QHHnSEco8YCoI3o2qg/9aH4K1t+RBc0CnAwoe4mhGV1Rg2q6fiP1qhZ
 b2GTGrwYpyoZSVWnE3gTxfGZp0OzbZEzGzOUwnOylazNf+Aj2C1BEiD1v
 MT9MPL+Swi1Ohk8EJAT31ereLMxnUJthl8bgWCC01KXuWQk7sPdGOVLO5 Q==;
X-CSE-ConnectionGUID: HOfISW9OQ7OFvWQ9W+DDbQ==
X-CSE-MsgGUID: GDdOWKCaQLCcBq6UsVtB5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="751969"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="751969"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:14:01 -0700
X-CSE-ConnectionGUID: 2Mpq18ZhRX2nbsBmKTXstg==
X-CSE-MsgGUID: xB7EUbCRQPay+Zj8I+EZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1203018"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:14:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:14:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 12:14:00 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 12:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2EI7CdJy+5rRE7s9TePcHqf0J/ksgpZAxzSHgqQ6U+L9hmmk3cG1AFbShxW0dy5ANIJKjUf8y3NIlSAONXUPdrRBZsmGTDLd3COW7EUyTfi6fzz8tPicJZm7w5dwJrbT0wZPsJbbDfktHW49MwNQ6aLYKDsNXz6GyVTMMIiRK5CBV7eORqGBceHpE3tmqA7c+bMcMkoKfkYkAFtzJcP+dQ4zT4W8aIzj7d9zYOT3s1xWMv70Q8gi0JZYj93rm8Wv29T77xSIjv5BRhR56O08SOkENBqRBG16mLb0gWdUVJB2+rFZc7vk1dh44SlJScNH1uqli5W1j1gQnEbXuBLHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fs4aHJWnkrPGWS7wCB882mOu/UO2V2gbffTxQW7w3L8=;
 b=NhtXutwGSpwAXjCRbuVgOS5of/dF2ibmooqX2naFz5d7Hq/mcNYFikZbjCUa0VEgShhpYxZ/7OVywloRFDKd8a8hV1zCmrpxsD+0QJydq5iXhfnLLXvYcOwln7DNz3RsIi3cRxGXYGvN9G+Oj73xMJoc5i7s4DNJCaPopjf+ZcCepvmdsHnXQ91MGEKganJPwCaPz3uLG4yVkDZ2RqwvcLPXhl3H7HZwR+k5zk00jkZraXzFz+t4tP1w6vMjoJ+cF5L8OfaefwUdLzqEag5tLvLP0oPVj28y1vZ1pQMmP20O5t2BIrPtGxmuhu0mhH5YwUdeB46eg4zxqnc1vbXnig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22)
 by SA1PR11MB6872.namprd11.prod.outlook.com (2603:10b6:806:2b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Tue, 13 Oct
 2026 19:13:55 +0000
Received: from DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb]) by DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 19:13:55 +0000
Date: Tue, 13 Oct 2026 15:13:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <gustavo.sousa@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 04/15] drm/xe: Invert vram_page_offline configfs attribute
Message-ID: <as6C5UM-OZsBx2YE@intel.com>
References: <20261005220636.602826-17-stuart.summers@intel.com>
 <20261005220636.602826-21-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261005220636.602826-21-stuart.summers@intel.com>
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To DS0PR11MB7192.namprd11.prod.outlook.com
 (2603:10b6:8:13a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7192:EE_|SA1PR11MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd879e4-3d50-432d-0a60-08df295e1fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|261009223027099003|10067099003|22082099003|4143699003|11063799006|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: momV6jxN4yC5HzdfzObK9Zy1HewyPDvs1c3hKDNe2Ra+cFO8H2NlXKq+cYATWpg8Vl0eKmHf6PhcWWTcSnB1exxhPq3SjMngV5rs10bncQibZIwFNhwnLG4JhtVG3mfdFgXkBAYSt0Wi+ybONjMQY73o0/ghiqhB0YHOSdsg4WrnHG6Lcs5LdOaYz9PVxL/l/rmW1TDtLGPTTFoN9a4quRMZza3NEB3NiL9RuqZilffv5WNp3d9zIqcmS/HSCCyOdHnHyqMUxnf8IGs0wsU0R96sH6fpgZ9bY19F7FXJrAEuHlLnuonZVHEyjBBHgk6o8qhvkjfd2yQiBpOJT0V7uCnVX+e+A+bzCtPBerbnL50WMElWxDHostx/A1JLFP8p2EII96qCB1yriSEJeOBND/6WIdjuNI/7xOUrC1WyRRwHk/5ASeppSP99n5BBoGNMdjDZATdgTezbyTfd2U3VHPrKTpUqAa5bK/0TZQGUg+MZbsALDST82c88kzh+wQb4JeRi9eiePqvBRkPVlO3z0FSGT8FtE3e3OEfv+LqovyWeboeYGN5xwKlYdZDUahKUyX44QVf5i/7u4Afxu1NSNA4X0CUsIf2Ca0P4T/6xDlnkdw9ad/SbBGJK0YYkhqahAeKg8uxrKVaNAz6qmUZKKVohdGvxWmvB2grcZISWzb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7192.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(261009223027099003)(10067099003)(22082099003)(4143699003)(11063799006)(6133799003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnRYQzB0NkhYcVNFSUNLTjd0bHd4aSszNW5QZ2QyUGpTMUMzeGwvN0lMYzVs?=
 =?utf-8?B?OTR6ZEZyWTBYN0kzSFlIT3RnSVpPQ1Y2M29RM2lqRTlWQnVrSmMwVXM1d0w2?=
 =?utf-8?B?V0tVeHNsSy94Wkk5QlJ4dDJsU0lRb1lFc0lYbkpoNFdZS0VjZ0RaTjFXUGd0?=
 =?utf-8?B?NzZVNVlxUUdQeGpvU1lhUmVTWlErQk9ManlxVTFIYmJGVzNZLytiSnB5WHVv?=
 =?utf-8?B?U0QxZEFyYzBicU5BUEhNK25HbjFsTlpxUmxzMkRXY2U5L0NGK01MekluOWt1?=
 =?utf-8?B?RmVxYXY4L0tyL3J3ZEd5cS9kaHFyTXZuQVZNcXd2V0RLNzYyZ1pzR3Z5aTBB?=
 =?utf-8?B?bkdJTTRNMGRMNlFXb2JxYnBZblpJUEYrOFJrYTgwSitETGpOcjhnc1lUVS9k?=
 =?utf-8?B?cHo3MG13YXJwOEpaUFlPQ0M3TkZLbXF0Q045dGxSVHhSSVNvdVlyR2dXQm94?=
 =?utf-8?B?WmhoQnBsOFB4RUYrdmlxckgraTV6R0RxN2M5RTg0R3U0bnQvTXdvdmQyMWVT?=
 =?utf-8?B?bisrdFp0NGVYSGdpbzF2Yyt3aEhiNGZRRm83djVlaEFsTTc1VCt1RnI4K2Fs?=
 =?utf-8?B?VFZiMHVGYWp1OHVGbkVhbnNSVnNUOUVNS3lrTlNCdm9IOVdVRDVadTk0aVIx?=
 =?utf-8?B?RzdsZlEvaCtRbm1HWGRybGJTaTY4bTQ3bVZrcmhBQ21PYytvOG9qNG5rU0ZF?=
 =?utf-8?B?a0htZmViTU53SFVmZTdCbi92RktpKzFDbEhPTlNRODZBYkRUTC9Qb2JuQzA0?=
 =?utf-8?B?RWxXR21jWU5rN0FwM0FHcW9sMWxickZTcUJyT1RHa29SWmVQQW5CbGlKVE5p?=
 =?utf-8?B?cGx4dHhXTXJMbEQvWERaZ3BsNHBra1NLaXhQMHNvZmJCY1RRdHR3eHlTY1dU?=
 =?utf-8?B?bElyeFRwem9ldjdFdGlLR0NKSnd3Z0xNMmxZZm1TOFRLTmxldTR2ZlRpSTF0?=
 =?utf-8?B?Mnk2MFRyVkFaUWFUSFRobWIySVljZW9ubXovMGRsS0tYdXZaRkpSaFdYZHNT?=
 =?utf-8?B?V25SSGpYZTZVOXNrN3NiOWcyRnM0R2t4T3EzbEg2NFZhNEludG0vRkc0eEVt?=
 =?utf-8?B?ajZFSUF3eXcrL29qczY3QTA1ZGJQTE9GNUFxbVNLVko3ZmQzODFmZTY1MUQx?=
 =?utf-8?B?eGxZNGVVcDMxWjVvYnZVSUFkN3JhZDF0WVB2ZDhEM0RtZzRrN0lIOUg2cFhC?=
 =?utf-8?B?eFBIdUxQSkYrMHd6VzlHd3NRdDBacjNjdzZUQ2tXdDdLWUsrUGRDOVZMd2pU?=
 =?utf-8?B?S3N3Z0ordk9Yb3ZYY2ZJWk5rTWhJUVNMTXJ2aXEwaWhkcXY1ODRXNmJmN3By?=
 =?utf-8?B?V0czY1BZUjU0N0Y1WHE2K2VqdGlkeTJWTlNjRVlQZUJqWmlYRDQrSFI5SFhR?=
 =?utf-8?B?d2pLTVNDNkNNcThWc3ptV29jQU1jaDFCTS9LbGh1QnFHeVJRYkJFSFRtTk4x?=
 =?utf-8?B?YzNyb2phYkFxVGRiaENhelpJelVTb0dmMjNKVE5aNzdwaUlrUTJQZEFJelVP?=
 =?utf-8?B?NXdlSlVicjZCaEtxeEYwTkNFbkl3ZHJNUGJ2RFNnemhSZ2xyY0JCTWZJZVIz?=
 =?utf-8?B?azRUNWVrbTBRUTRWbHI4VlBKNVRGOGU1VVJUUlJVZjlXeGlJS1FlSHVsZCtI?=
 =?utf-8?B?alNCN2JBeUlqQVE1NFBiQXhJVWh5czRaaENxVzNWcGt0Q09PQ2dPdkpUMG8y?=
 =?utf-8?B?MXFwbU5hekFMbU95ZnZ2WTZET1JpM2VvYWlCV3M4Tmt2QWRna0tSQ21BakJC?=
 =?utf-8?B?azQzd3JaeEgrcWZIOHJwK2F1M2lTbU84UUlrSG1BUjMzOVJJeGJrVWNpamZr?=
 =?utf-8?B?T0d5UVBJWVlpY09TNFphNW05UkQrUG5TYmZSd0FLOFlTK29kemRFa2R3Mkdt?=
 =?utf-8?B?UVRJY3FJRXVUcXY0MjRLZWMxbEF6OVVkcG9rN3RJREpOai9BcmxBMStHNy9j?=
 =?utf-8?B?K0RHU01hcXR4MmtzVXd2TnkxbTgya3duMUhWTE9zMjAwQVRaNm9ZUUdrZzFy?=
 =?utf-8?B?M1h3Q1JaaFFkVGNZdjNHOXEvcHFubkx0ZGc3SVE0d1Nxbkp1cnozRWFRR0gr?=
 =?utf-8?B?cXFrcGlFQzVHdmphZ3lKVDF5OHhlcFl3V2hEdHBzWkp4bmlQelFFMlBhUXB0?=
 =?utf-8?B?Nyt3YzVGRXY2THdaZXEySG5iamNqa29obkxucTduYWNmUVR5bHRkMUVEQU1Q?=
 =?utf-8?B?UXBOcnlzN0hwY2pFQ1NRc1dSZ1VNNzhlcW9DUlp6Y21BU0FjelJrMTVacEtn?=
 =?utf-8?B?YUpMd3RodEd4SzE2WjFhbFZFc3dWQnR5Y2w3NWt2S2tqeldFUENxN3JyQW56?=
 =?utf-8?B?aUp4UC9YQVdHNVNIWUZJa3pDcEZCOU5rVnZEUHkvaUwxL2w2NEdXM00zZVR1?=
 =?utf-8?Q?zWXbgeKG4HS/xaCo=3D?=
X-Exchange-RoutingPolicyChecked: cx1sy9IJHSmcVmLjEWhLL1UIIxkeoWK0qIXajsELxrcMyvj7okWJtvR0CLY5KnPlDuG8TQdpoxvqDTzPQimgTEDGqH5RO4b+W6R6FEOKE+oJxsqfrEOKjGQy7w50TRQTR0xDjP/FbpW0Yfg8e8NwOYwdmGOfyrwqPVlg4Ne3CqJIgo/sV93zW+FtltNe/X5LyPicw7ytMjm0fnHzCY188NeWu8Zw7yp291a242OCm1bN5sbxo9XlpL3zB8ZpciL5UkEb8CAwuvC8Hsb7dm28o5vZVa3K1opIDShz1JDK7HQvqu98gJxksUSULfMscLu8FLImzUmyNLVFRWPN/RwnSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd879e4-3d50-432d-0a60-08df295e1fa9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 19:13:54.9725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4drf38RJH8yA8zva8EWf/+n/QKQ1RpH9eSNfup6eek20iMrtlE45e4WqgVV0m0avBKUnxliVfJj3nwWpQihy5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6872
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

On Mon, Oct 05, 2026 at 10:06:40PM +0000, Stuart Summers wrote:
> Rename disable_vram_page_offline to enable_vram_page_offline The default
> is now true, matching the previous default of offlining being active.
> 
> Negative-logic flags are error prone once they get combined with other
> conditions, so carry the positive sense all the way down to the RAS
> consumer rather than inverting at the configfs boundary. The internal
> xe->ras field is explicitly initialized for every platform since a
> zeroed struct no longer means "offlining enabled".

yes, please!

I never forget our disable_power_well_enable where power_well_enable
already means power disabling! :)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: LLM> ---
>  drivers/gpu/drm/xe/xe_configfs.c      | 44 +++++++++++++--------------
>  drivers/gpu/drm/xe/xe_configfs.h      |  2 +-
>  drivers/gpu/drm/xe/xe_drm_ras_types.h |  4 +--
>  drivers/gpu/drm/xe/xe_ras.c           |  8 +++--
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  2 +-
>  5 files changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 6e62fdccb4c4..0ccf163306fc 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -63,7 +63,7 @@
>   *	    ├── engines_allowed
>   *	    ├── migrate_ulls_period_ms
>   *	    ├── enable_psmi
> - *	    └── disable_vram_page_offline
> + *	    └── enable_vram_page_offline
>   *
>   * After configuring the attributes as per next section, the device can be
>   * probed with::
> @@ -161,15 +161,15 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> - * Disable VRAM page offline:
> - * ----------------------------
> + * Enable VRAM page offline:
> + * -------------------------
>   *
> - *  0, n, N, false - Do not disable (Offlining is active - default)
> - *  1, y, Y, true  - Disable vram page offline (Logging only)
> + *  0, n, N, false - Disable vram page offline (Logging only)
> + *  1, y, Y, true  - Enable vram page offline (Offlining is active - default)
>   *
>   *  Example to disable VRAM offline::
>   *
> - *      # echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_vram_page_offline
> + *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_vram_page_offline
>   *
>   * This attribute can only be set on CRI before binding to the device.
>   *
> @@ -304,7 +304,7 @@ struct xe_config_group_device {
>  		bool survivability_mode;
>  		bool enable_psmi;
>  		bool enable_multi_queue;
> -		bool disable_vram_page_offline;
> +		bool enable_vram_page_offline;
>  		struct {
>  			unsigned int max_vfs;
>  			bool admin_only_pf;
> @@ -326,7 +326,7 @@ static const struct xe_config_device device_defaults = {
>  	.survivability_mode = false,
>  	.enable_psmi = false,
>  	.enable_multi_queue = true,
> -	.disable_vram_page_offline = false,
> +	.enable_vram_page_offline = true,
>  	.sriov = {
>  		.max_vfs = XE_DEFAULT_MAX_VFS,
>  		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> @@ -675,15 +675,15 @@ static ssize_t migrate_ulls_period_ms_store(struct config_item *item,
>  	return len;
>  }
>  
> -static ssize_t disable_vram_page_offline_show(struct config_item *item, char *page)
> +static ssize_t enable_vram_page_offline_show(struct config_item *item, char *page)
>  {
>  	struct xe_config_device *dev = to_xe_config_device(item);
>  
> -	return sprintf(page, "%s\n", str_yes_no(dev->disable_vram_page_offline));
> +	return sprintf(page, "%s\n", str_yes_no(dev->enable_vram_page_offline));
>  }
>  
> -static ssize_t disable_vram_page_offline_store(struct config_item *item,
> -					       const char *page, size_t len)
> +static ssize_t enable_vram_page_offline_store(struct config_item *item,
> +					      const char *page, size_t len)
>  {
>  	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>  	bool val;
> @@ -697,7 +697,7 @@ static ssize_t disable_vram_page_offline_store(struct config_item *item,
>  	if (is_bound(dev))
>  		return -EBUSY;
>  
> -	dev->config.disable_vram_page_offline = val;
> +	dev->config.enable_vram_page_offline = val;
>  
>  	return len;
>  }
> @@ -946,7 +946,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_multi_queue);
>  CONFIGFS_ATTR(, migrate_ulls_period_ms);
>  CONFIGFS_ATTR(, enable_psmi);
> -CONFIGFS_ATTR(, disable_vram_page_offline);
> +CONFIGFS_ATTR(, enable_vram_page_offline);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
> @@ -957,7 +957,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_enable_multi_queue,
>  	&attr_migrate_ulls_period_ms,
>  	&attr_enable_psmi,
> -	&attr_disable_vram_page_offline,
> +	&attr_enable_vram_page_offline,
>  	&attr_engines_allowed,
>  	&attr_gt_types_allowed,
>  	&attr_survivability_mode,
> @@ -989,7 +989,7 @@ static bool xe_config_device_is_visible(struct config_item *item,
>  			return false;
>  	}
>  
> -	if (attr == &attr_disable_vram_page_offline) {
> +	if (attr == &attr_enable_vram_page_offline) {
>  		if (!dev->desc->is_dgfx || dev->desc->platform != XE_CRESCENTISLAND)
>  			return false;
>  	}
> @@ -1242,7 +1242,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  	PRI_CUSTOM_ATTR("%u", migrate_ulls_period_ms);
>  	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
> -	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
> +	PRI_CUSTOM_ATTR("%d", enable_vram_page_offline);
>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>  
> @@ -1417,21 +1417,21 @@ u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev)
>  }
>  
>  /**
> - * xe_configfs_get_disable_vram_page_offline - get configfs disable_vram_page_offline setting
> + * xe_configfs_get_enable_vram_page_offline - get configfs enable_vram_page_offline setting
>   * @pdev: pci device
>   *
> - * Return: disable_vram_page_offline setting in configfs
> + * Return: enable_vram_page_offline setting in configfs
>   */
> -bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
> +bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev)
>  {
>  	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>  	bool ret;
>  
>  	if (!dev)
> -		return device_defaults.disable_vram_page_offline;
> +		return device_defaults.enable_vram_page_offline;
>  
>  	scoped_guard(mutex, &dev->lock)
> -		ret = dev->config.disable_vram_page_offline;
> +		ret = dev->config.enable_vram_page_offline;
>  	config_group_put(&dev->group);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 14e49f23306f..1d538ce0ed2c 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -25,7 +25,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>  bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
>  u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
> -bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
> +bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev);
>  ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  					   enum xe_engine_class class,
>  					   u32 *cs, size_t max_len);
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> index 0be218ba2db7..60cbc35a6b35 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> @@ -44,8 +44,8 @@ struct xe_drm_ras {
>  	/** @info: info array for all types of errors */
>  	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
>  
> -	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
> -	bool disable_vram_page_offline;
> +	/** @enable_vram_page_offline: cached configfs policy, immutable after init */
> +	bool enable_vram_page_offline;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7a85735c57d5..ce9b57b3eede 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -916,13 +916,15 @@ void xe_ras_init(struct xe_device *xe)
>  {
>  	int ret;
>  
> +	xe->ras.enable_vram_page_offline = true;
> +
>  	/*
> -	 * TODO: Replace platform check with xe->info.has_disable_vram_page_offline
> +	 * TODO: Replace platform check with xe->info.has_vram_page_offline
>  	 * once the feature flag is plumbed through device info.
>  	 */
>  	if (xe->info.platform == XE_CRESCENTISLAND)
> -		xe->ras.disable_vram_page_offline =
> -			xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
> +		xe->ras.enable_vram_page_offline =
> +			xe_configfs_get_enable_vram_page_offline(to_pci_dev(xe->drm.dev));
>  
>  	xe_drm_ras_init(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9a514d983e90..1dad94a153b7 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -933,7 +933,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>  	vram_mgr = &vr->ttm;
>  	mm = &vram_mgr->mm;
>  
> -	if (xe->ras.disable_vram_page_offline) {
> +	if (!xe->ras.enable_vram_page_offline) {
>  		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
>  		       addr);
>  		return -EOPNOTSUPP;
> -- 
> 2.43.0
> 
