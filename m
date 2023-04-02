Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16813C6FD1D
	for <intel-xe@archiver.kernel.org>; Sun,  2 Apr 2023 01:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7816B10E1D1;
	Sun,  2 Apr 2023 01:34:57 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC4D10E1D1
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Apr 2023 01:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680399294; x=1711935294;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YaiJ0JVPCS8OFY4hAkKSLC/M8HOfQmXl0DEGUkTJ25s=;
 b=NMci6zMmPuk+CuGN1YQkSaSPSFV+Y4GFXB8ruQNP8IQLpLCxLQT6//fS
 yncWiPgIgLM9gQbXNIpdrAF4cV2u9h9mDCFoOdBl/7fcsTOmcoGSA2hZ4
 5o6CWVnOyJ2HfIrxQUe2tZRWUAptu8VfaLOOmm2KozWqUrYbB7lVkX/jr
 FC8890jvRx7ob/Vhslpokwi18zrIMBBz97FbaAlQ5qLES+T6kkz5f4Zc7
 3x0483CcfZ57lh/a4H7pR7WrSvcOqb4CqmKH3IyZVpsmk9Pn5olsqyJgT
 rxrXug5RUiELSOJKDdlziuhXCY74X3skHedpUzDfH9jwi3zoQtw7UI0Ac g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340420855"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="340420855"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 18:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="931622611"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="931622611"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 01 Apr 2023 18:34:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 1 Apr 2023 18:34:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 1 Apr 2023 18:34:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sat, 1 Apr 2023 18:34:53 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sat, 1 Apr 2023 18:34:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmmLEj/WnLYXdnKTwpkxtQ6XBVit5VSyalJFu0wZ7H9cpAIg95Yr/J7dE6Fd3q6wOPG2GkqabAu1XNcXROFZb0e4RkvA2SheQ6T04NFFAF7k3Mmq5FwThwwryH+5PoZIT3fyTDSVXC49x9yz8h36nAQduWcav445+k0fGRmljKmXbGZwqW5+s9oy6/eKrz/H0JhbesxS6XCo5zfmZL/3QpA8KdZgPwC6VdBlnS6iTPWLTmv+CnZhmB4LVxbRIYG43Ex3UwE14jZ/lUJqd3QivIBiU39nk6wEwCA28OOc8MDUaoYJ1SkoNjSm7c2//doCxGxfGdmTV3X8XWWb2wYsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MY7jFHedspyppyD44zIz2b/LaiZFKsFbsRorT06ffs=;
 b=dXL/YO6PmzBzkd8ClweoJNvwN6sZPVgwOzS3xZyi3TcW7MbfAjpQCezHluPwnwnvBn1oI8q5KFjWuOhjf5zytcSlmI0XTgib59cqQadBQWWbNVjbovH/JvwMxr1J44hxTZhC8ngrtweTNTkSMRnepTQELnsXpLKJblE2ve3+ZGROlBk5NAgG5ZG+DxudZTYhs0qx2iVKXb4kVKZ2U/U8zbS5ZKE90xUMDJaqJNJp2dfexVwLpCJhmJLHjbNq0h38H4aTtZVcIri0Wo7V6Gsd/BslrnuxmdP16QWUaprvSvb0nXeyePkJC0ip98tZxDahHMzHBCZEgA2WfUa6XxXxfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO6PR11MB5667.namprd11.prod.outlook.com (2603:10b6:5:35b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.26; Sun, 2 Apr
 2023 01:34:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6254.029; Sun, 2 Apr 2023
 01:34:51 +0000
Date: Sat, 1 Apr 2023 18:34:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
Message-ID: <20230402013449.orx5njgiy4uyjcbj@ldmartin-desk2.lan>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
 <20230331143337.vtlyhttwwqfv2tad@ldmartin-desk2>
 <20230401085459.ub2rgeiqbi225n42@ldmartin-desk2.lan>
 <epatz7qx73i3kzxa4fzn7xcizmdiesgqei62ixvjvhi64i5z36@qz6l54vqdsp7>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <epatz7qx73i3kzxa4fzn7xcizmdiesgqei62ixvjvhi64i5z36@qz6l54vqdsp7>
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO6PR11MB5667:EE_
X-MS-Office365-Filtering-Correlation-Id: 33711137-5519-47bd-225d-08db331a73c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4bDuBUDwUzv5mcaYUYaGgbKLPAD9AyII+SvxQa6XcWMoXVeSi8TvtwvHpSGKJirStYOKjPaC0oaICoTbtG5CLM4c9PDMDim9b9pdRyEwvaeTqYvkQ/tnKYqExiaT9e4CeTz257kCPtiRqU2Yg1+pZbCZxsLQxevsRXQmYs6pT9ebGittiPEdpQbJmr0q1fdWaDvE0Di+ePpbRhtFo8xnc1UMaP8acyRRr8VyBJVq+qN0+XK50diyW7rA5VPsCQ0iYZrrePzXPNMcqgZE+alZFdoBC2IYkruJQbRY/vtiFwLwGXkNOVCewQ24YXpMsHYN+ST2qpowLTOxEpkA5OhYHuca6TI/iYOF3XdKVYA2FE7C/XoNlRyUVHA/X6agj4kI3DSurDMgBGBPcvE+FzDaXm6t5RY9CWT8o9UfnJzINRikDEXoJHAjLxO/8R+Bz+J0GuhjQbu1LVaaiRKkrBmXsm22bHQ0yZK9z1luUd7HlWUlGgFV86KqgTSsml930Gcy/jQeaBxn34ANcLCihAz0JiugqzO+5qwfJAc2ph/dLTmhQR2xYf6mtyESj5Y3999X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199021)(478600001)(5660300002)(107886003)(8936002)(38100700002)(41300700001)(83380400001)(2906002)(82960400001)(66476007)(8676002)(6916009)(66556008)(4326008)(66946007)(186003)(9686003)(1076003)(26005)(6512007)(6506007)(86362001)(316002)(36756003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEtyU1k3WjRuQ0k4dVhnTERJYjZaZjBvSjB5MTFvQkg5TXkzRXRldFQ2OUlD?=
 =?utf-8?B?bncvdU9WTk4wWmRjNituUTNYdEV5MzFPSGkrZUpaSVhGWGRiNmtNSDNrNG0r?=
 =?utf-8?B?eDVIR2lmeFFqczdLWUxEMlNnamFkc1dWaTNlRUFOSm0xTDJQT2o4VnhtWWdQ?=
 =?utf-8?B?TDh6aFZ1STRCYktsZnFRK1FJdkVncnNrcEtCSG9YRTZ5M3hVUkRYcWx1M2RL?=
 =?utf-8?B?Q0JWdXNyTDB6WlZTd0xDZlQ5dDFLYjBUczZQYUVRdUxEdzdqZUJ0UEIxQVhI?=
 =?utf-8?B?bDcxck93VjZtV1VpL3NTSjlYRG80dTRmTlBhT1g5aDVGTE13N01NSHVxQ2Mz?=
 =?utf-8?B?YTZSNmZPaGN0cFViZHN0T25jSjZmc2xPOXhwdDh4MXFJRVVRTGZDanFQRjF6?=
 =?utf-8?B?cEQ1STU0WVNncExjOUFWaXR2V0tGa0pScDgzYmVlaTlrdGR0TjJhSGhJUjJx?=
 =?utf-8?B?bXVVRXJ1cjRpN2tKbTJzazRuK2xOb1BiYnZTaHA2K2hQWXVmb3FJMFgyOVJj?=
 =?utf-8?B?VjR4UURmeTRnVWJSVjRDblk1cllHeVhKQzdLTVlOazVDNS9IWEI0ZFlaMmNw?=
 =?utf-8?B?ZXZQbUd4dEhnRGtOaFFIVzBob1NPVk0wYjBGOTNpVVozL0lTV04yTVRqZWRY?=
 =?utf-8?B?SzZQR25YWW9YOS9TdVpuNU5DUmttcUFTeUFYdzhicndvY1hMNFIraEVmMUUy?=
 =?utf-8?B?cFFWbHp5enlGanZTVlYxeUc0MWVrSzJVeHFrbHFhWGxiMVZaNVBlbEVlM09u?=
 =?utf-8?B?RWdHVFFIMm9tZVg2cUducUp1N1AxUE51M2ZFRklZSXZidjh6eUdqWG52cjVY?=
 =?utf-8?B?bkFwV3BMM0tZQThuSFl1cWc1SU11NG1VSGVYRnJDMGNTb01yZDZNVWJsalYw?=
 =?utf-8?B?cUJ1cHhaOVdvU2lMK21vK09nSVpDTHVYOU40U3dudFJ6bUMzRjZhMHN5TnpZ?=
 =?utf-8?B?N0JsNTd5THBrQmh3QmlSV25NN3NHV0c3NjNSaTg3cExTRnVvejU3SGRQaFEw?=
 =?utf-8?B?U3dvUzBXK3dmM1hXUXpQd2FDWlFqMWozbEZySWIxMklHZEw5MzZMOHdLSlUz?=
 =?utf-8?B?Nm9sMUEzLzNHOGFDZjVkS2QyV1lCRks1eWlPTVhkdDdTbHZrTUZIYmkyT0pi?=
 =?utf-8?B?YTlsN0lOSUdBYlJ4aWZHdVpobGhZcmhtN1RhRVJ2TGk2VmExajlETjgwUm11?=
 =?utf-8?B?SmtOVFRlMWRkUjVHKzdueW9FakppbTRZdW9PRTFUcnBpNGJWVnc5QWhDai9o?=
 =?utf-8?B?VXBqcHBSdUtIRGt6QjBmUHBoV0tIVWMvODRpZkZNd2xmcGx1QURhaXptS2Zn?=
 =?utf-8?B?d2NoS2RvY0ZocGpMSm9tQ21WQjJzcDBHMWZxWkZZS3QvNnRmYk12K2p5eXI0?=
 =?utf-8?B?cExnbERPdEk4SHE3NFN6TEdIalJyM1h0US9sZEZLdzVXemZQY01kcERaazBH?=
 =?utf-8?B?S0VPb1lFWFJkNDRqRm5NK3lGMTJTZ2FFWkhiM05IOGkzME5TRXJwekdiaXVy?=
 =?utf-8?B?SXBaODNJNitXMDdCTExxZUVRVG5aVzN2emVwUURkb29uY1FZMkNocHM1ZVFM?=
 =?utf-8?B?ckF4SFJPczRnZ2JlT2NsaGNNSUFoVzVQZ0xFbXZndFY3RTFWK3F5bDNIWk0w?=
 =?utf-8?B?Z2RyS0loL29YNHBvU25Gdk51UkZRbW80RVk5WFB0bFY0cGx4MVdRRDZqUEVa?=
 =?utf-8?B?Qlh1aTRESnNoRlp5REl2ek5PN3lJTFc5WjBTWXBJQm1CSEdYdml6Y0ExV2Q3?=
 =?utf-8?B?dW93TkdkcTkxUWxveUU2RmswZnQ0R3VVT05jOXpGZGJFRUU3L0RLMEhaNzg5?=
 =?utf-8?B?YjAvc3VrQ2hWT1ZNbm9GeW5qSHU1R1RZbDFiSFM0UDltaDZiR0ZQR1RlY2lh?=
 =?utf-8?B?RUVadE5WZTB4aVNaSzU2Q3lMMnNTbzVRQW1aRWd3QWQzNFcrVWNtdUhZMzVE?=
 =?utf-8?B?NlRSYWJhSlpJWGNWd3FoN3ZUOTlVOXpvYnNJSWFXZWZoUTVGRWI3Z3JrazFs?=
 =?utf-8?B?TTRqam9ad1JXU1pMUzRUWDJqcWxLeVNhNXZmMjFBWUJmS2JuYXA2UFZLcTMv?=
 =?utf-8?B?YTFXeFZiSlhzZ3BhTjBBS2l1N0VTNEtvck1EVkhiYTk0eEpyTm5POEZzbWhu?=
 =?utf-8?B?ZUNGWXEwRFdBOWdPQ3hMRnYyNG16NkJoeXJRcGtoUmUrT0x0OFlnU1dQNjdw?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33711137-5519-47bd-225d-08db331a73c3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 01:34:51.0449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1yA9DKXJSsaQ68pnw4ctuKFLpR0dyPVYK11v97XJaCkxfj1CER4nRKHdxNuBtrnTwIOUJbJ3+q4gCzfni6x5sPSTK4+t6drxC3tiHnInVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5667
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Apr 01, 2023 at 08:26:24PM +0200, Michał Winiarski wrote:
>On Sat, Apr 01, 2023 at 01:54:59AM -0700, Lucas De Marchi wrote:
>> On Fri, Mar 31, 2023 at 08:34:21AM -0600, Lucas De Marchi wrote:
>> > On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
>> > > On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
>> > > > +EXPORT_SYMBOL(xe_rtp_process_incompat_types);
>> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> > > > new file mode 100644
>> > > > index 000000000000..4a12aad3f759
>> > > > --- /dev/null
>> > > > +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> > >
>> > > There's no need to have this as a separate file.
>> > > We can move the contents of tests/xe_rtp.c into tests/xe_rtp_test.c and
>> > > include tests/xe_rtp_test.c directly in xe_rtp.c
>> >
>> > this is not how the tests are currently structured.
>> >
>> > xe_rtp.c includes tests/xe_rtp.c. The latter can be seen as "an
>> > extension of the that file, exporting whatever entrypoint is needed
>> > for the real test". They are then part of the xe.ko module.
>> >
>> > tests/xe_rtp_test.c is the one in the separate test module, and contains
>> > the integration with kunit.
>>
>> but it's possible to keep everythin in the separate module and not need
>> the include of tests/xe_rtp.c. I did that on v2.
>>
>> Lucas De Marchi
>
>From my perspective - the way that the test is implemented carries an
>additional information.
>1) Test is a separate module:
>Means that we're testing the API exported by the module (that's used by
>other modules).
>2) Test is a file that's a part of a module:
>Means that we're testing non-static API used internally by the module.
>3) Test is a file that's included at the end of a file:
>Means that we're testing static functions.
>
>Forcing everything to be a module doesn't really serve any purpose.
>It just makes things harder to follow, as it removes this useful
>additional bit of information.

I strongly disagree here.  Basing the test location on how much a
function is exposed is a recipe for having to move the tests from one
place to another. There are always refactors that make function change
from non-static -> static, static -> non-static, and to a smaller degree
exporting it.

In the end the code will just be inconsistent with the rules you
outlined.

Separating everything to a separate module means the test code doesn't
bloat the xe.ko module. I do think we should group all the tests into a
single xe_test.ko, but that is a different topic.

See v2 of this patch series where I move *all* of the rtp tests to the
separate module and simply use EXPORT_SYMBOL_IF_KUNIT() to export the 2
functions I need (In this v1 I was using
EXPORT_SYMBOL_NS_GPL(..., XE_KUNIT) to make sure the tests were in a
separate namespace, but then I noticed kunit itself has a recommended
way by using its macro).

This makes the rule very simple to be followed:

1) Place everything you can in the separate test module
2) Place it in end of the file with the #include otherwise

Lucas De Marchi
