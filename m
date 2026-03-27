Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7119B10F2865
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 19:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302F310EE9A;
	Fri, 27 Mar 2026 19:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0V+nHiN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C9610EE9A
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 19:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774641076; x=1806177076;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zuRqqT04Pvgc9G0PIIcECpLHBL0gXSbulgD3GojesbI=;
 b=P0V+nHiN76Hjx0BbkvgdYRib/S2c4uL56cRK7vDxMl6R5dcx5qNTafcz
 e7Fvtk8OvS+GwsZMgmpMhxCVgysIcmuHqrvXxaGy9jvRYyiA2FAczsf4F
 qoJ1sQeSQE+kXwDGETD1xeQb7C9kLG7I2FBM+lDopAMsCJEiQ4y84e1WT
 1Rh/yDlGFLkC/i0B3XC8Xr7JqS8MD/nFeu+QrdAHMuScrS6H3keytDypG
 xAT2cPS8LUY+NRPicqsvgx3NfNldHQcBDHjcL7HtjuoWlJfUbK2yZ/APx
 TvMQdPY6yNcft1c0oAyYN4QNpBtuyIAKjOiNnENxR0EdateVDtfQJ3SML g==;
X-CSE-ConnectionGUID: r3Ot+7CLTZ6hqb0Mtr2TbQ==
X-CSE-MsgGUID: biBFY8UlQaewehKiYoVuUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74752558"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="74752558"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 12:51:15 -0700
X-CSE-ConnectionGUID: 7H6rFfpCTIiO8/oD068vfQ==
X-CSE-MsgGUID: Z4+OFVy0TyuxiO6DKwR+ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="224612722"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 12:51:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 12:51:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 12:51:14 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 12:51:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCrM6cBxfgYnODBAk/hL9cp52+fnF0DMQNoVrsiW2NduNoAIsJfIQ1GTqMuPNWJy5Ackq7qI1WBFIWXIMGofCMlVPW7h6X7OJZMv+2wTnmZyaQ9FZh00AP6RP6gK+c2+GDAw+4/DejxV9MJFHsezCfribdoDsxt7baCC54BBB5fbjkmqFO4rUqOnpUc7swRrY793xCKEEcsoUx1YbL/HhD/Mu8XAZM8esZh1TuY7vNUAEweJpfYZv4iMWC1/LLWMK7zAy73GTxwWmIby2sS0a4E4zzcWYDserv4n0nyUuSc7b51meIVbl7ySdt50vPdVRURQCm7ZFwx3Xl8/1IPg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHr5SxmftOX2qqRouD86Ov+s7zmNzi1g4MTJxiIGZO4=;
 b=Up1114XzBl5ck5JqaxsO4jtjM5c/ENu4KPXLGjrRImQrasQwgqvEUr8ZaWVOG0fmDpYf6FgmOg+SGiBE9jJ4IoTAuX1MtSSNcGOkcPuq5wHk8QVxJW7Y0S/EtFjdq6nSijfjemn2pNffL8WgROSZ297/Vnjr8CPugFWEas5bpNRl2D6HfftH8XSmvyFzDB90vsm2dmS07oe+g+zrKxa5UfCnQQt6QOBvjxwaASm0EV3vzVa7aYDHg7Jo7ObkT7PDnuEcaoN0NTUwQoz/PJb78l2x/afN4j18dwm4LYajLZ6XVfln1kHeNz/0RW3hk+UvACdJT7MGMeZHstPl4ndHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB7338.namprd11.prod.outlook.com (2603:10b6:930:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 19:51:11 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 19:51:07 +0000
Date: Fri, 27 Mar 2026 12:51:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe: Drop all mappings for wedged device
Message-ID: <acbfqMbJzIZ3d7l1@gsse-cloud1.jf.intel.com>
References: <20260326132816.739363-1-raag.jadav@intel.com>
 <acWi1gL2SI+KLWgP@gsse-cloud1.jf.intel.com>
 <9099f0ef-87a9-42f6-888f-57bb73f6d6ae@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9099f0ef-87a9-42f6-888f-57bb73f6d6ae@intel.com>
X-ClientProxiedBy: MW4PR04CA0283.namprd04.prod.outlook.com
 (2603:10b6:303:89::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c30a7a-de17-4143-cef8-08de8c3a2ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: NREjzi6Fh6jAUrIJcmjgNA+45hAp/cMCY3AAbqEaO55RuPRr6dp2s2pPnstatlT77yES4pLR87hNEqh4Iz+ACLym4hMUiP7SE9PeDoZMsZRlEcEUffy7uqbyeEGRSNrzu6K7G2pguTXpfWzsc3uHEuuCt5TQF4dlFIbOFEFYfKlgl69WYGenu0lykV+x8rJgNciCkSOo3a8vtVAQwkdtyGB2BqgV13g2jaS41IAECVrcWIeAGKcfQiFqhl5rqi6z7wfXW+RNUNGQ8wEKJrpYPOURj+s8hbgCEOgO2+VCEvWH5O5TaeD9qmcVNEUv93x/DvlcLDO2SnwAqyZ8EHSbS6Hqsj6cxEGYV6dxHuY7sjOZP4MwGJTcP77HM/FdWDZMB4extXcekHeZlnXAWKpVVebjBRmBPhPn547G5g6TQV9Sj7b6CCi4TfvudcdMEN6odckkIcejQZZ+ypEc0ScMc9Dj4rQBQV9INLK8mjdcD/V0qYr0GE5Tz0vucISOgtKswijpnSTxWEyP0EqtNfvdNMPFKR/n4OoUFQoaGBMcUijFiz63TuWkW311DR2x6QTJsRzHnFZu+bJaWo4LqGSQN0xzoR9Cz6QQFRNKubToMxCuO5BbNTfRDyARwnFzLDOwXBQasyO978b+xSHq+WX/IP29ZSt5Ulomnh26hLq+UjoKR/HNZ9Y/YLQ36VLgZSdte3VWvAthTazJHpDUFrpWu7581yM64beJHGYAbdWXJNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXRncGVBNzgxVlBSSjNjazZJMlQwYnErZ1loMnJwajgwT092eDN5MGxVd3I2?=
 =?utf-8?B?bmRQbzVIMHJBVHUzM3EzSW1uTnN5Ykp5dzJVZ3FnclhiSUh0TjdmcW9QNmla?=
 =?utf-8?B?RnF5Q0d3dGJWL21WUWlkTEx1b0FLeDk5S0ZDaWV4OEVRc3hIZVMra3FMbFpk?=
 =?utf-8?B?dFhLcUVYUjJjQ3BTRUpnZVNwaGI5MDlHeklGeXJ3ZEJwdlZJL25JT0lVSVdU?=
 =?utf-8?B?Tk1JOUdMNUJmeXN0ZnUyVlV6ajkrZFNBWVJXYVozNkhHUzJGVlkrVVp0OTBh?=
 =?utf-8?B?OWlkdGM4Vng4eFpVTXY5REk2c1FGVFBMbHg2dFRiZ3ozOENFTHJGUDFwVmsx?=
 =?utf-8?B?V3B5NHdpSEY3S1htNEpaNkxpaDVjM1NXNk0wSStUdlJCd2JqQ0N2NC9yQTBz?=
 =?utf-8?B?NDdXbUdPaFVxajhQKzdBeFhhejFSRDZzTGY5LzBKbXBDUVNZNmo4bWlFTUY2?=
 =?utf-8?B?Ri92aWRxZ1N0eEFWK205VVRPbjFzTGVyM2hIVktZS0JxZkMyMlNlUlNtak13?=
 =?utf-8?B?Q1AxbkRCb1lXY0FsWFM4Z1RFWGtwRUoxNTMyZ0g4c01nRTZrc2xEdG9OdG4y?=
 =?utf-8?B?QWFjNmlGNm1EdTVPUzhvTE5NbUpldzRqa2VIZnAyL244c2JUNG5ib2FiVk9H?=
 =?utf-8?B?ZDV2K0o4TDZQalh2eCtoRkNCUTlPQVR2cVU4eFpMOHVwa1pSNFk3WExwMGZO?=
 =?utf-8?B?eU84eGVTaDkwNDBtTnh2ZGo2eHM0a2VqdGI4WEEzWGJCcEZOSVhNbXdZQ3Fs?=
 =?utf-8?B?R3BnMFkzTWZMWVVhTmJiWWFXcmp4V0UwNklSeWp6b25DdWZGMUFpOUZNSSth?=
 =?utf-8?B?Rzh6S0FOcmFxb1J1bnZOQ0ZjcDFBN296MnUwL0NIeXEyYm11U3I3RmhqTmxB?=
 =?utf-8?B?cjUzMG81Zy9Ma1lFM0x4UElVTUZvWlM3UG5VeEhSV2VON2paWnpvNkNBaWFq?=
 =?utf-8?B?SVg2eXZjV05BT1JSaFNSZXhiL2ZTRkdUTnhtZlpZQXVkM3FjTnpQak5ERlBM?=
 =?utf-8?B?T3JIeVNkT3p1VDAyeVJQbXdGZ2RGaUNzVlEraFgxTHpNZUk0TGErV0I4dldC?=
 =?utf-8?B?S3l6UWpLYUpGN0krYkJLeDk1enpZdWFmV2U0MndiZ3JNbTNaSXg3d0pWVmls?=
 =?utf-8?B?WHdvUUNFNUdCaXBDYkdHR0N3RkZvL2ZrYWRTMm1PUlM5TGJuOVVuWkUxUlg4?=
 =?utf-8?B?T3NZMHVkclk3S01jWW1xRzlhcWtSbzNYZFpaZkJ0cTNNb2hUeld0S1FqNVo5?=
 =?utf-8?B?ejZBcXliclBpTkZkUTdXVDJ2ZVdNK3cxR05KMGYxVGp5WGV4SlNRSWlZdFA1?=
 =?utf-8?B?czRpaGNLMVJjOTE2bVo2WHBSYkFhazlSWU1ONHJlZDFjaTd5VW9QYWRGMVdN?=
 =?utf-8?B?akNndC9YdGpFZGovS1V2dUc2aUxNTitmaGZGZmgzMXkzOU9vT3BLTVNzZ1hE?=
 =?utf-8?B?M1lLUkZLYmRHZkNBMHRMM3NHSGtLVGRFSnJoalVDaXk5OHVuRHZtSWJmaTBN?=
 =?utf-8?B?UDhHTExod0ROYlpLSFY5NVBkYXV6L3NCbXd6MWNOUVBhS2VkSkJOMDg5RDVz?=
 =?utf-8?B?ejEzNUFUcW5teGNBekQ1RWRjZWdEZFZBTW9QYURZNEFPdjAwZ1FNL0hEWTRQ?=
 =?utf-8?B?UXo3ZlJvamZ3Y2VIV3I1bXlGWktCeDNubXNZYkVvUzhvYWVPYWZVZjc1Y210?=
 =?utf-8?B?bG82Tlk3K3dnKzc1UjRteEJyN1B1bVQ2WjVmcTNyU3FQVWlRZDFiL1k2a2Js?=
 =?utf-8?B?SWpMMGJNVkg5WXlTRGNOVVVMcHZSWGRIVUVUaTY3WFQ3c3kwRmdiU0ROc1c3?=
 =?utf-8?B?aUhWdnRiRmFTUlNaZlUrTUc4NWgrVWtkcDFSbkxhWVkwaUxmMFhnWnFtdkEx?=
 =?utf-8?B?dk5ZdWRYRmlGVFQrMWZ0Q2gveTRWNnY3V2pkVGQwVWRqdno0c0hMWkgxR2hj?=
 =?utf-8?B?UmVIbWp0c3hMWUZzQjNGQTROcDltVXZaS2RsakU3a0hRUjYxZDJkOWd4a1Qy?=
 =?utf-8?B?eHRaTU5VRURjanY3K3U4MUFMNlhIcEwyblJpby9kOE5jRWFCd3gyV1RNbHdY?=
 =?utf-8?B?QkhhcldlbUlRaFovVU1YdDZ0RytNblpTemorWEFmTHlJREh5ZmJxaEZ4VGpE?=
 =?utf-8?B?YlpEVVdBRUhYQlpmdngyUkdnTDI1WlZzdlljc1h5czZyMjc5R1M1QWpzMkJl?=
 =?utf-8?B?TmNzbDhnTjhsbkpYdkg2djh3Zmcza0VKNG9MM2FzcWpFaGNDSG1wMzRUbnhB?=
 =?utf-8?B?ckRmNzZUTHAybXpwcDRRc2FvTW1NUEYrRFlCMS8wZ2Q1QTVkOEhvWlk2bFlD?=
 =?utf-8?B?KzUxeVdKc2FJMHU3YVNLYnU2ZXFSRTJxb3EwbEtXOGtiSlU4cFY1NUVubmto?=
 =?utf-8?Q?8/1URnS2zZcD0ZZs=3D?=
X-Exchange-RoutingPolicyChecked: TdPYuy8zipS5CVS0U3klvbS3oglMdpQzyV6Kkl7uWlRuqsXKmuUfT8mCLu9Q4WIZpRmr13xKj7DNCkyiNeLWKhMNiyN7Higi22o6T+KymVHfoAndmdzyTzLQHePpS5oFWTREhTSMka8qqhDwBFdmV6jJy9c8aBKGNNoJrjVfb7ern5o0VLtJMzO2NGzVaUj5EHJ6RrrtM5fFiG3qX7OqMB9Hdd0YG+JM4W1FwxlLl+9hywLh9h4r6gxhxbFEfo9akZyXUCWass2ACUpdt6FlGUSrwS6Yp6ho7HVb0TmYcWcyGXgD86/DWc1z7V5iD9MwVZ5LjRmogZN1UfiuNP+BOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c30a7a-de17-4143-cef8-08de8c3a2ff3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 19:51:07.5394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKdbHTAQ4W8xjnJ/dxtLUZpE1qhLkTdY2jwz+gRwZgJfWSi6whnNztzALPzftsKkh0KBK06rMiZBRllUIGtFwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7338
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

On Fri, Mar 27, 2026 at 10:18:01AM +0000, Matthew Auld wrote:
> On 26/03/2026 21:19, Matthew Brost wrote:
> > On Thu, Mar 26, 2026 at 06:58:16PM +0530, Raag Jadav wrote:
> > > As per uapi documentation[1], the prerequisite for wedged device is to
> > > drop all memory mappings. Follow it.
> > > 
> > > [1] Documentation/gpu/drm-uapi.rst
> > > 
> > > v2: Also drop CPU mappings (Matthew Auld)
> > > 
> > > Fixes: 7bc00751f877 ("drm/xe: Use device wedged event")
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo_evict.c | 8 +++++++-
> > >   drivers/gpu/drm/xe/xe_bo_evict.h | 1 +
> > >   drivers/gpu/drm/xe/xe_device.c   | 5 +++++
> > >   3 files changed, 13 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > index 7661fca7f278..f741cda50b2d 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > @@ -270,7 +270,13 @@ int xe_bo_restore_late(struct xe_device *xe)
> > >   	return ret;
> > >   }
> > > -static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> > > +/**
> > > + * xe_bo_pci_dev_remove_pinned() - Unmap external bos
> > > + * @xe: xe device
> > > + *
> > > + * Drop dma mappings of all external pinned bos.
> > > + */
> > > +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> > >   {
> > >   	struct xe_tile *tile;
> > >   	unsigned int id;
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
> > > index e8385cb7f5e9..6ce27e272780 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_evict.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
> > > @@ -15,6 +15,7 @@ void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
> > >   int xe_bo_restore_early(struct xe_device *xe);
> > >   int xe_bo_restore_late(struct xe_device *xe);
> > > +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
> > >   void xe_bo_pci_dev_remove_all(struct xe_device *xe);
> > >   int xe_bo_pinned_init(struct xe_device *xe);
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index b17d4a878686..4c0097f3aefb 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -1347,6 +1347,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > >   	for_each_gt(gt, xe, id)
> > >   		xe_gt_declare_wedged(gt);
> > > +	/* Drop dma mappings of external bos */
> > > +	xe_bo_pci_dev_remove_pinned(xe);
> > 
> > Do we even need the part above? unmap_mapping_range() should drop all
> > DMA mappings for the device being wedged, right? In other words, the device
> > should no longer be able to access system memory or other devices’ memory
> > via PCIe P2P. I'm not 100% sure about this, though.
> 
> AFAIK unmap_mapping_range() is just for the CPU mmap side. It should ensure
> ~everything is refaulted on the next CPU access, so we can point to dummy
> page.
> 

Maybe I'm thinking about this incorrectly. I was assuming what we were
trying to accomplish is to ensure that the GPU cannot touch any system
memory or other devices' memory before we signal the fences. Since the
device is wedged, it isn't responding to something like an MMIO GDRST,
but it could still be misbehaving (for example, writing to system memory
or other devices). We want to ensure that it isn't doing that before we
signal the fences that allow memory to move.

The way to do this is to nuke the device's host IOMMU mappings. I
thought this is what unmap_mapping_range did, but it seems I was
mistaken.

> For dma mapping side, I'm still not completely sure what the best approach
> is. On the one hand, device is wedged so we should not really be doing new
> GPU access? Ioctls are all blocked, and with below, CPU access will be

See above for GPU access. The device shouldn’t be doing anything when
it’s wedged, but I think the point is that we’ve lost control of the
device and have no idea what it’s doing and cannot release memory
(signal fences) until we have ensured it cannot access outside of the
device itself.

> re-directed to dummy page. So perhaps doing nothing for dma mapping side is
> OK? If we want to actually remove all dma mappings for extra safety, I think
> closest thing is maybe purge all BOs? Similar to what we do for an unplug.
> 
> So perhaps xe_bo_pci_dev_remove_all() is better here? Also I guess would
> need:
> 
> @@ -349,7 +349,8 @@ static void xe_evict_flags(struct ttm_buffer_object
> *tbo,
>                 return;
>         }
> 
> -       if (device_unplugged && !tbo->base.dma_buf) {
> +       if ((device_unplugged || xe_device_wedged(xe)) &&

This will remove all dma mappings? I believe this is likely want.

Matt

> +           !tbo->base.dma_buf) {
>                 *placement = purge_placement;
>                 return;
>         }
> 
> > 
> > Matt
> > 
> > > +	/* Drop all CPU mappings pointing to this device */
> > > +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
> > > +
> > >   	if (xe_device_wedged(xe)) {
> > >   		/*
> > >   		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> > > -- 
> > > 2.43.0
> > > 
> 
