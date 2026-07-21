Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0C4C44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 15:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28D610EA8A;
	Tue, 21 Jul 2026 15:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFDA8GQs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF01810E241
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784647814; x=1816183814;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=b4c/WUnhOnCnUyxus7wkCOMu8gkMdqWul5EKHlENDhg=;
 b=aFDA8GQs+nZxlnl0dcZa8QsXVvu6Ov1SY4+iEuFVU3ghCkLBz++1HGCT
 XbIBIKKYCazYvlvjpQ7uoGXovJmj6ASgSG/w4PhvhOqaVPf05brsUNovW
 i48I7u9Y1Emsn8kvom/e82vvLEjSzcz8+YOjiq+AcfEC2pJJPU0vXZjuJ
 NW7nh8o7C511Rb2JIVPtqAK43vwO5D9zsvdXOxVQ7d/R3/YqzflZO+g5X
 rMw6Zl92kSMjpREUVl5tzqIGSNEUze317Eqvr1LMLPmLJYXG1ZD/+c3NT
 HFQpzPAqYub3pU81H8jrnimrfMaF1V2I3tsOR7Vrn0LWnaMiaKig9jwcX A==;
X-CSE-ConnectionGUID: gkwuxuyVQYKhHutmwrbCsg==
X-CSE-MsgGUID: HRsAXZC9R6GsGCz/wvJKDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95615780"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208,217";a="95615780"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 08:30:13 -0700
X-CSE-ConnectionGUID: BK4Eyh5XSZmRZ5xTHV7J5A==
X-CSE-MsgGUID: NpsSgtD9RX2oSVU4BE6JqQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 08:30:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 08:30:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 08:30:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 08:30:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwLI5yieR3DwVN2rcgBWA3wehGaBC/qiREK8OLOZD4e8fUJikpkEHn+SNfnQki3UqaprwiX2aq/CTzRLjNazqF56w0XHkfzLWcE3vfWTHt1HZm+PaZzDjwyhjcbrYBQInhl2AA7YGA0D+O9uAoCIeLU0PTyeEJCCsUrJRW5h3LnE32WX2woAG//D7xzcwuI6db3wVImY50pQ/iSmevuIyijFlB62D0q8YtOiF3Qf5ZQKKQ4Uw0snuDBtp9Eq5FkyA4s7fsmCrpEQY+3GpCkStOfW75ND/H5Ahe1ZT23nCROm3sffBSn+qN0ZydpW7HRxXj2G2yiv9+3+iIXlw+UyMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYQl6swSaY7C7q9qJXod8nutOuBn1SOC3PirEHDXF04=;
 b=cSPqMIgOjmdZSH3JoJEJeXbDwBEehFqYWeU8wPOtetoZqgva16f1FCD01ivX2LdpLByIrsdDp3kk4gYlo6v0oqm4mPYFlkoOabl603GMID5gx1IJpzRNQgDzyVc8+RPifUP5/eNb8CzKDvPbpJ7c5ZDchwKyL/Q3MoQ+lY5GPQL+t288DkKDB487dVY/EZEkq52AGgHNKyUoxOHH2KKHFqH2eYfedSfbjWdAAugSkyKEneBd1/eFbn5h+VKPamXqlIOoMAl1G5gMW9r5n4lUINhpYs4wh1sgpgsqnSgYNSZQJuv9kgGS4DnR9KORypZmevL8qRkTY7t7hiieAHWpSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB7295.namprd11.prod.outlook.com (2603:10b6:208:428::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 15:30:10 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 15:30:09 +0000
Content-Type: multipart/alternative;
 boundary="------------nFbgjTUPrir2VOP67BZf1lBp"
Message-ID: <eb99300a-64b0-4c53-a62f-a91aba5cbece@intel.com>
Date: Tue, 21 Jul 2026 21:00:01 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvdmY6?=
 =?UTF-8?Q?_Add_drm=5Fdev_guards_when_detaching_CCS_read/write_buffers_=28re?=
 =?UTF-8?B?djIp?=
To: <intel-xe@lists.freedesktop.org>
References: <20260721052215.2267228-2-satyanarayana.k.v.p@intel.com>
 <178464704780.211381.5197724277465398301@6beec6c84f66>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <178464704780.211381.5197724277465398301@6beec6c84f66>
X-ClientProxiedBy: MA5P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::6) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|IA1PR11MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 592a2c0f-5810-48dd-5ec7-08dee73cf2fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|13003099007|22082099003|18002099003|8096899003|10067099003|4143699003|11063799006|56012099006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: 0m91z29TfE6xnlDiwcTAAqrWfJQMVqRXIEael+IM9jQ1VSo9RZuEPzv9GGjy+Qgluqo83IzeHaAHhjPQ1RMOFJEswlY0VI8JNmnTMkMIwTu9kpdlkWtYQKV9K64Ip6KQ2ZIPcTkXHzRRbnGPO/LPQwuvh6gHyhWeveSj+rQ9+6AtKXUCmViXNbyOBQT6yDlrYzZsNc/qE1JpU77sqcvqGsl/i4Ia+JBCAyqGBxFRMjdua+YyTWFcg96J6pE6l70ahSi/9fca3/yeSKIo2gl3Xl1Ayu9SJaIjt/5WiMfNhGu3MBry541ZCIADE0bzQqOssnApQb9AxxAvBdPXjq5/xRyzfY4Sd8zrFboRKOImd+8jHocF5z5hSy8BUXbnplekd5sxfzyUbpiyVohxdfBDc/yDk0Btoi4fuA6f5wr54gFeykWvbC0VGNm3cLwpWTFiSY/ERhNpoCq01qr27xhitZQGlWuMcfe0OF17JZc9qfdVLLHEN65I9r4/nWuVElhUxRsTNUkSd1dDbvDyF08eEXPlZS9pB3zx/TV4BlOlSzc0WaCZNNKPMQEp+vUz32SrnLcDMe3U736a3J3aHSvVT2pL5VZWIlYmE+Qo/Uq95VJAdMj02/BSz5gDjSUga7r2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(13003099007)(22082099003)(18002099003)(8096899003)(10067099003)(4143699003)(11063799006)(56012099006)(5023799004)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek0rRmhuTmRxOC8wVGtrZkt0TmdTTk02bmhQWlRHZGEwdmYzdHY5eDBTcnhl?=
 =?utf-8?B?VDlXTDVKb3ZZNWNwT3VBVElrVVJobk9LMnVqSVhMNXVqQnI5ZENRNVNmd0l0?=
 =?utf-8?B?WkNkS2ZuY2J1VU5OVnpTR3N4OEhmQjlCdlphSUdlRjRrNDFGbmtFQXkrM25C?=
 =?utf-8?B?RlNvM1R6TzBUMEtlaUJCZ2g0aEt0dW5jazJ2R3YyemRTcXpUNkZ0ZTJsVVJT?=
 =?utf-8?B?Z3J2SmFiQ3gwSVkxY21tbEdnd3h2eHE1Y090dDZiNzhZT2xyMEFYdzBUVWVw?=
 =?utf-8?B?SjZYU0IwTmd4bGx2QVBJbE5sM3haVEt5NE1TcHY2NVg1ZXNWQkROeGxwTmo5?=
 =?utf-8?B?Y0tWRm5MSkJ2YkNJTkxBY2d3Yi9sWHJYVzg3K2FSOGNQVXVsSldRMUdEYXl4?=
 =?utf-8?B?L1FKaXZITU5keGRCWTg0YldSTytrSnQvRHFDUmxtdEh4elZkTENyQ2dlRlE4?=
 =?utf-8?B?VENNOTRsa2F5WjJvdVJ2NHNCTVJzdmg2TUYzOVVQV0VQTkhHMTdnemhBeW9i?=
 =?utf-8?B?OStSNGtYK1VLNFBPV1pyZzFkMGU3RmZwa2JSODdkS3Z0LzR3ajZFT0FzcGNU?=
 =?utf-8?B?cThkYnZDNFNOK2FkYU9TQU1IR3FjNGRTaitDdXBoWVZySTlrSWVNRnQzVXZM?=
 =?utf-8?B?Y3V4RGZWcFRuU2MxYjh6Um1yN0NYQ0ZrTTVhb1RNZUh1WjlHUVRSZ1VyRFVD?=
 =?utf-8?B?cXVFTGhRSGNrNDdqd0s2M3JuUkNPQ1F5emkyZ09DSXoxOWdWLzB5djdoS09V?=
 =?utf-8?B?bkhOT1l3enkzd2VIVko4aDJUSEhQYXpOb21JUHRQR2V0bEo5VDh3VitnR2FW?=
 =?utf-8?B?UlZKY1pxb1QxNkdoa21hYTN2eE5uS1JUU3VkSFJSdDFUSzE3SGxGZFVsZ1k5?=
 =?utf-8?B?elRLQ0lZVnJvSTZqenJ4cjR0N1dZS2pSUCtMelBwamt1aUx2S1FJWlg4Vm1i?=
 =?utf-8?B?UmVJTFNlRlpMNXQ4OVZNY0x6NzFDbFY1STZFcU1YaGRxalRwaUxsSlBNTVpJ?=
 =?utf-8?B?a2FLaW9MZ2VJOVJrLzNIL2dsZ3Nwb1oxN1MyQnI5bEQxOCt0MTdaVDdPZzlY?=
 =?utf-8?B?SHA3a3lBMEsvYVJrdEVBQjdSaEl6alVMUEoyOGtydDRCSHdkOVU2RmVQNnUx?=
 =?utf-8?B?V1JhcGh6bEcrV3ZwaVJRUjA0a3VRQnQwaW5MNTV6aHR4d2F1aTUrblJlTXdM?=
 =?utf-8?B?a1R5M2xTalVuU0IyUk9ZYXN0citFM20zMHFIOC91OTZwRHpQK0FjWjVXUWpr?=
 =?utf-8?B?ZXZnVW9WdjhzdjF2RityMWpuSlNDdDRWVVIxUWtQMitKVEh4cmpuMmFsVU5B?=
 =?utf-8?B?RVNuNXdVZFBHZHlzQ084M2EzTDZlYWdCU0p6MUFGYnVMVDIycFNRcyttMVda?=
 =?utf-8?B?TjNqaTVGNXUrWWxIOVFiM3pTWEJvODdIY09NbFNoeWJyTFI4V2U5ZWFtSUZN?=
 =?utf-8?B?Y0tZNHdGRnFybWVwNHI5YzJkZHhOa0M1dktKMEh3bjhEWXRaN05hTmIvQlhZ?=
 =?utf-8?B?cEJwQ04zTEhjTFN1TVlBQ2t6Um9XL05QS0J1ZGRlYm9iUEpVQkJ2Qkt5bXJB?=
 =?utf-8?B?UWJyWUI5cG1YcW1yOEJWaWNwb3Y5RTgzd09jWkN6QWRyUytqeXl6eFdmRFlJ?=
 =?utf-8?B?K3VHSW1ldTFEUWRwQWdsekIyU3ZQUnBQYnE2Mkp5b0k1ZWIrQkJtaVZvSkVR?=
 =?utf-8?B?WlYzU1dWUmNJYm5SelJLRnBLMkJaaUl3ci9GZ2NGTHgzZGhqMG1FS1A0QzRE?=
 =?utf-8?B?MjVnbFBEQks3VkJOa0Y4TnIxejNpOEhJQkRaNFJWVXU5eFcvRkE3blJwUzQ2?=
 =?utf-8?B?OVA5b3pJbWdUeEFWRE1RYTU0QWd3TU80cFk0L3F6clh1bUZzbHhxWjA3cGds?=
 =?utf-8?B?S3J2WVpGUXVjOXFpYUgzajZmc3ZFNkh1ZW9OdmtaV0lyMDRYN0dqQTJkU2lP?=
 =?utf-8?B?cTRLZS81MWNGZnhGYkttb3BwdkZQVnk2RjVCNU1uOEpmamZhREdWRW1TUyth?=
 =?utf-8?B?VlVPVnVidVBoUmV6ZkVMbmlUL01CVnVuWktXSVhabXNkTzNYOFF3a24xVGl5?=
 =?utf-8?B?YjFHOHhqNEZ0L1FIQTBldUpBOHJQMVU0SGNqbDZraXlUVG1KWldTbzhIVVNp?=
 =?utf-8?B?NDdRVHB2NnRTMG9vd0FjTk1qRTk4c1NpcG1ZV2hmb2xLRS8vc0ZEdURncFY4?=
 =?utf-8?B?b0NhMlcyRHZmbk5KdjEzQjVnaWNFS054eVQxZ0RoSExNNmJNa3ZYZ0dLY3A1?=
 =?utf-8?B?ZHlSRXIzeTNZYVpKcmRHN2hDaHVsTUUvalgxQlNCMTRZaVpwM0NzUC9sbjJC?=
 =?utf-8?B?MTJxanlsZmlCcHpyUVJ1bFg2dWtHYU9kaHcvdTFmemUzQnVobmI3TkduL3RX?=
 =?utf-8?Q?fn3h+9abwniaVffU=3D?=
X-Exchange-RoutingPolicyChecked: n8DVGFGUzCyiMJ84JcRQJS6JIeoyK3i0rU+Xgh4iNhFgAlibPxBc1Jwz9GlgNh0ikbs4MmvGnJwr8AB9exm7HuvNSYH6xJHmxh3z/scrNB0oOyR+BJ+FWjIyU5fqj9lbCg6Fqm/rqiGwuBjO9gbiQSUloxuvKFX963ZtuWqHeatdTB864vi1n9SuE9eapp4Vga9PJR3Mm973LB/qwdUKnKPmeFRykbck8IsRx2+yicz/+vKVyplrZphrbIi9sxkDfcX6+pXbcFMHs7RBOsQ3zLbAmYIL2sdgkpEnxeUwxgqaHQRyRvSW78ZpxJyCxxE+6zTEorOmAZ7K5hdr/IvslA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 592a2c0f-5810-48dd-5ec7-08dee73cf2fa
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 15:30:09.7593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atKCuW9bzynDOIuugI89oM19buh8VdIbQQ8NFVY733yRW1ak7f8qeGJjmSmGPoLJ6vFf0YCDg/lmhyRDFJxPCx54waVhR9ZTL506Lk+HXlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
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

--------------nFbgjTUPrir2VOP67BZf1lBp
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 21-Jul-26 8:47 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/vf: Add drm_dev guards when detaching CCS read/write 
> buffers (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/170731/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/index.html
>
>
>   CI Bug Log - changes from
>   xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405_FULL ->
>   xe-pw-170731v2_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-170731v2_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-170731v2_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-170731v2_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-10/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-6/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0.html>
>         +3 other tests fail
>  *
>
>     igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-10/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-6/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1.html>
>         +1 other test abort
>
The patch is not applicable for BMG. So, we can ignore this.

Please help to merge this patch.

>
>     Known issues
>
> Here are the changes found in xe-pw-170731v2_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html>
>         (Intel XE#7084
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084> /
>         Intel XE#8150
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150>) +1
>         other test incomplete
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#7571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +1
>         other test skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888.html>
>         (Intel XE#8395
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888.html>
>         (Intel XE#8395
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html>
>         (Intel XE#8396
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396>) +1
>         other test skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html>
>         (Intel XE#8396
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396>) +1
>         other test skip
>  *
>
>     igt@kms_sharpness_filter@filter-toggle:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-8/igt@kms_sharpness_filter@filter-toggle.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321> /
>         Intel XE#8355
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sriov_scheduling@equal-throughput-low-priority:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@xe_sriov_scheduling@equal-throughput-low-priority.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-low-priority.html>
>         (Intel XE#7992
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992>) +1
>         other test fail
>  *
>
>     igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0.html>
>         (Intel XE#8526
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8526>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html>
>         (Intel XE#3718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718> /
>         Intel XE#6078
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html>
>         (Intel XE#6078
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html>
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html>
>         (Intel XE#5408
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408> /
>         Intel XE#6266
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@plain-flip-ts-check@c-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@c-edp1.html>
>         (Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149> /
>         Intel XE#6266
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#7308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html>
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#8361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321> /
>         Intel XE#8355
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (Intel XE#4760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760>)
>  *
>
>     igt@xe_sriov_flr@flr-each-isolation:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html>
>         (Intel XE#7992
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_9014 -> IGT_9015
>   * Linux: xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405 ->
>     xe-pw-170731v2
>
> IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_9015: c656c9ccd7e45834f4ca191dbf729e7ba4676f6b @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405: 
> b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405
> xe-pw-170731v2: 170731v2
>
--------------nFbgjTUPrir2VOP67BZf1lBp
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 21-Jul-26 8:47 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:178464704780.211381.5197724277465398301@6beec6c84f66">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/vf: Add drm_dev guards when detaching CCS
              read/write buffers (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/170731/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/170731/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405_FULL -&gt;
        xe-pw-170731v2_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-170731v2_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-170731v2_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-170731v2_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-10/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-6/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0.html" moz-do-not-send="true">FAIL</a> +3 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-10/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-6/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1.html" moz-do-not-send="true">ABORT</a> +1 other test abort</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>The patch is not applicable for BMG. So, we can ignore this.</p>
    <p>Please help to merge this patch.</p>
    <blockquote type="cite" cite="mid:178464704780.211381.5197724277465398301@6beec6c84f66">
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-170731v2_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084" moz-do-not-send="true">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150" moz-do-not-send="true">Intel XE#8150</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571" moz-do-not-send="true">Intel XE#7571</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-not-send="true">Intel XE#3321</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395" moz-do-not-send="true">Intel XE#8395</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation@pr-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395" moz-do-not-send="true">Intel XE#8395</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396" moz-do-not-send="true">Intel XE#8396</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396" moz-do-not-send="true">Intel XE#8396</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-toggle:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-8/igt@kms_sharpness_filter@filter-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send="true">Intel XE#6503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321" moz-do-not-send="true">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355" moz-do-not-send="true">Intel XE#8355</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_scheduling@equal-throughput-low-priority:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@xe_sriov_scheduling@equal-throughput-low-priority.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-low-priority.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992" moz-do-not-send="true">Intel XE#7992</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-low-priority@numvfs-random-gt1-vcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8526" moz-do-not-send="true">Intel XE#8526</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718" moz-do-not-send="true">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078" moz-do-not-send="true">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078" moz-do-not-send="true">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408" moz-do-not-send="true">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266" moz-do-not-send="true">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@c-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149" moz-do-not-send="true">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266" moz-do-not-send="true">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308" moz-do-not-send="true">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361" moz-do-not-send="true">Intel XE#8361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321" moz-do-not-send="true">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355" moz-do-not-send="true">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-lnl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760" moz-do-not-send="true">Intel XE#4760</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-each-isolation:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992" moz-do-not-send="true">Intel XE#7992</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170731v2/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569" moz-do-not-send="true">Intel XE#6569</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_9014 -&gt; IGT_9015</li>
        <li>Linux: xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405
          -&gt; xe-pw-170731v2</li>
      </ul>
      <p>IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_9015: c656c9ccd7e45834f4ca191dbf729e7ba4676f6b @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405:
        b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405<br>
        xe-pw-170731v2: 170731v2</p>
    </blockquote>
  </body>
</html>

--------------nFbgjTUPrir2VOP67BZf1lBp--
