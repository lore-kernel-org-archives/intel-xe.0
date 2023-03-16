Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69267C6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 12:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DCE10E19D;
	Thu, 16 Mar 2023 12:17:26 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70D010E19D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678969043; x=1710505043;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Ez4MkV1NvCTq8ynNWHWGGAejlAGRUkjenviUS8Jjp3c=;
 b=UDVSEgS4xWhpkOhXroR5RFE1JcwaxFWLwBwVjSWm8rHv63JkL+PoH1tp
 1peowp99qdznYQzWz/jLUk+ogZYKBruBj7BZd15s06ldJtTWJrsG3/Ezm
 fDo4m6MVBlZjaisMAYeKLWDRl8JZ0VfQJhIFsBs9PHRtJrSBS9+It+JvA
 SVQKnuM9Qiq/x/uTe4QZdMdrx4dXQDbuYObRgEJXmqoL85rOnJX2XFqfC
 nospkO8ofqGjhPyj+1MusaeDwFMdLZEWZAbAJhbZk/oKVtmwEnK6mbo7P
 oPYGCI6OpHjvR5sj74LR04HtAb/F8fae76wjRxaZsg5i9nAbQOxak+7ea Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="424242475"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="424242475"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="673134895"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="673134895"
Received: from hlykke-mobl1.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:17:17 -0700
Message-ID: <e8280f43110b2482ede80eb1d68af74524af4201.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Thu, 16 Mar 2023 13:17:13 +0100
In-Reply-To: <20230316110752.129831-1-maarten.lankhorst@linux.intel.com>
References: <20230316110752.129831-1-maarten.lankhorst@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix Alderlake-P and DG2 display info
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

T24gVGh1LCAyMDIzLTAzLTE2IGF0IDEyOjA3ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPiBERzIgaGFzIGNkY2xrIHNxdWFzaCwgd2l0aG91dCB3aGljaCB3ZSBjYWxjdWxhdGUgdGhl
IENEQ0xLIHdyb25nbHkuCj4gQWxkZXJsYWtlLVAgaXMgTFBELCBub3QgZ2VuIDEyIGRpc3BsYXku
Cj4gCj4gV2l0aCB0aG9zZSBmaXhlZCwgZGlzcGxheSBzaG91bGQgd29yayBvbiBib3RoIGFuZCBh
bGwgcHJvYmxlbXMgdGhhdAo+IHdlcmUKPiB1bmNvdmVyZWQgYnkgdGVzdGluZyBkb25lIGZyb20g
cmViYXNpbmcgYXJlIGZpeGVkLgoKTklUOiBNYXliZSBSZW1vdmUgdGhlIGxhc3Qgc2VjdGlvbiBo
ZXJlIHNpbmNlIGl0IGRvZXNuJ3QgbWFrZSBtdWNoCnNlbnNlIHdoZW4gaXQgbWFrZXMgdXBzdHJl
YW0uCgpEaWRuJ3QgZGlnIGludG8gc3BlY3MsIGJ1dCBhdCBsZWFzdCBjb3VsZCB2ZXJpZnkgdGhh
dCB0aGlzIGRvZXMgdGhlCnNhbWUgYXMgdXBzdHJlYW0gaTkxNSwKClNvClJldmlld2VkLWJ5OiBU
aG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+CgoKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rpc3BsYXkuYyB8
IDEwICsrKysrKysrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rpc3BsYXku
Ywo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rpc3BsYXkuYwo+IGluZGV4IGYyODU1M2JlODU4
ZC4uNTRlYzhiYTVkM2YzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kaXNw
bGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGlzcGxheS5jCj4gQEAgLTQ4Miwx
OSArNDgyLDI3IEBAIHZvaWQgeGVfZGlzcGxheV9pbmZvX2luaXQoc3RydWN0IHhlX2RldmljZSAq
eGUpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5kaXNwbGF5ID0g
KHN0cnVjdCB4ZV9kZXZpY2VfZGlzcGxheV9pbmZvKSB7Cj4gR0VOMTJfRElTUExBWSB9Owo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoGNh
c2UgWEVfQUxERVJMQUtFX1M6Cj4gLcKgwqDCoMKgwqDCoMKgY2FzZSBYRV9BTERFUkxBS0VfUDoK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlLT5pbmZvLmRpc3BsYXkgPSAoc3Ry
dWN0IHhlX2RldmljZV9kaXNwbGF5X2luZm8pIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBHRU4xMl9ESVNQTEFZLAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5oYXNfaHRpID0gMSwKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuaGFzX3Bzcl9od190cmFja2lu
ZyA9IDAsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Owo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBYRV9BTERF
UkxBS0VfUDoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGUtPmluZm8uZGlzcGxh
eSA9IChzdHJ1Y3QgeGVfZGV2aWNlX2Rpc3BsYXlfaW5mbykgewo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgWEVfTFBELAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmhhc19jZGNsa19jcmF3bCA9IDEsCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuaGFzX21vZHVsYXJf
ZmlhID0gMSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oC5oYXNfcHNyX2h3X3RyYWNraW5nID0gMCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgfTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDC
oMKgwqDCoGNhc2UgWEVfREcyOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGUt
PmluZm8uZGlzcGxheSA9IChzdHJ1Y3QgeGVfZGV2aWNlX2Rpc3BsYXlfaW5mbykgewo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFhFX0xQRCwKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuY3B1X3RyYW5zY29k
ZXJfbWFzayA9Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoEJJVChUUkFOU0NPREVSX0EpIHwgQklUKFRSQU5TQ09ERVJfQikK
PiB8Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoEJJVChUUkFOU0NPREVSX0MpIHwKPiBCSVQoVFJBTlNDT0RFUl9EKSwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5oYXNfY2RjbGtf
c3F1YXNoID0gMSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiDCoMKgwqDCoMKgwqDCoMKgY2FzZSBY
RV9NRVRFT1JMQUtFOgoK

