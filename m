Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB369C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 16:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A51310E740;
	Wed,  1 Nov 2023 16:40:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F2410E740
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698856855; x=1730392855;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=OG/8UFVqNFHbR9R0njrdKoIsVTAJt8ACkDszr/S43oQ=;
 b=eLlhb8C8LGKMkuOK1gdrW0gfyDzU4OGtkhbF/gYsEIIbnhTZnNQCXssC
 /Q2vDZ21BxwR9xbWugIvNZTpRuAs38K0p0+bca4y3iBtjf4r1sooV14VD
 eLOvzbGqRJhJ+2hoOJhKv9jjD8uSomeMvT9MngBq1hiSN77okpTsvlNUO
 QGpS2QafmgRlMOPcU/q6cRGxSmzW483Se+iKuW8ph5l1o+V0LO2Vcpbwr
 J4Xd2gssd33KzBM0ZBd5nV4I+lLqkBVH0MeGTJyppbEdYzH0y13xmjCMM
 E6eYYrw7BxHhFIpaJ8ln7E+KyV6b5R+E7+ulPkYH33sxxNUooB0DZEazF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="378913370"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="378913370"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 09:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="760986529"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="760986529"
Received: from sbint17x-mobl.gar.corp.intel.com (HELO [10.249.254.166])
 ([10.249.254.166])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 09:40:53 -0700
Message-ID: <ddca518e22ac158cf6fb8a2f626376ef51ca3732.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 01 Nov 2023 17:40:51 +0100
In-Reply-To: <20231031185014.1605381-1-matthew.brost@intel.com>
References: <20231031185014.1605381-1-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH] drm/xe: Adjust tile_present mask when
 skipping rebinds
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

T24gVHVlLCAyMDIzLTEwLTMxIGF0IDExOjUwIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IElmIGEgcmViaW5kIGlzIHNraXBwZWQgdGhlIHRpbGVfcHJlc2VudCBtYXNrIG5lZWRzIHRvIGJl
IHVwZGF0ZWQgZm9yCj4gdGhlCj4gbmV3bHkgY3JlYXRlZCB2bWEgdG8gcHJvcGVybHkgcmVmbGVj
dCB0aGUgc3RhdGUgb2YgdGhlIHZtYS4KPiAKPiBSZXBvcnRlZC1ieTogPGNocmlzdG9waC5tYW5z
emV3c2tpQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMu
aGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uYyB8IDE1ICsrKysrKysrKysrKystLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiBpbmRleCA0OThjMGIz
ZTFkNzMuLmQyNmM5MGYwZDcwMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jCj4gQEAgLTIzNDAsNiArMjM0
MCwxMCBAQCBzdGF0aWMgaW50IHhlX3ZtYV9vcF9jb21taXQoc3RydWN0IHhlX3ZtICp2bSwKPiBz
dHJ1Y3QgeGVfdm1hX29wICpvcCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBvcC0+ZmxhZ3MgfD0gWEVfVk1BX09QX0NPTU1JVFRFRDsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKgwqDCoMKgwqDCoMKgwqBjYXNlIERS
TV9HUFVWQV9PUF9SRU1BUDoKPiArwqDCoMKgwqDCoMKgwqB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHU4IHRpbGVfcHJlc2VudCA9Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBncHV2YV90b192bWEob3AtPmJhc2UucmVtYXAudW5tYXAt
PnZhKS0KPiA+dGlsZV9wcmVzZW50Owo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHByZXBfdm1hX2Rlc3Ryb3kodm0sIGdwdXZhX3RvX3ZtYShvcC0KPiA+YmFzZS5yZW1hcC51
bm1hcC0+dmEpLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdHJ1ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBvcC0+ZmxhZ3MgfD0gWEVfVk1BX09QX0NPTU1JVFRFRDsKPiBAQCAtMjM0OCwxNSArMjM1
MiwyMSBAQCBzdGF0aWMgaW50IHhlX3ZtYV9vcF9jb21taXQoc3RydWN0IHhlX3ZtICp2bSwKPiBz
dHJ1Y3QgeGVfdm1hX29wICpvcCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBlcnIgfD0geGVfdm1faW5zZXJ0X3ZtYSh2bSwgb3AtPnJlbWFwLnByZXYp
Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICgh
ZXJyKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBvcC0+ZmxhZ3MgfD0KPiBYRV9WTUFfT1BfUFJFVl9DT01NSVRURUQ7Cj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWVyciAm
JiBvcC0+cmVtYXAuc2tpcF9wcmV2KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaWYgKCFlcnIgJiYgb3AtPnJlbWFwLnNraXBfcHJldikgewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oG9wLT5yZW1hcC5wcmV2LT50aWxlX3ByZXNlbnQgPQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0
aWxlX3ByZXNlbnQ7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoG9wLT5yZW1hcC5wcmV2ID0gTlVMTDsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChv
cC0+cmVtYXAubmV4dCkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGVyciB8PSB4ZV92bV9pbnNlcnRfdm1hKHZtLCBvcC0+cmVtYXAubmV4dCk7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFlcnIp
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoG9wLT5mbGFncyB8PQo+IFhFX1ZNQV9PUF9ORVhUX0NPTU1JVFRFRDsKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghZXJyICYmIG9w
LT5yZW1hcC5za2lwX25leHQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoIWVyciAmJiBvcC0+cmVtYXAuc2tpcF9uZXh0KSB7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgb3At
PnJlbWFwLm5leHQtPnRpbGVfcHJlc2VudCA9Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRpbGVf
cHJlc2VudDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgb3AtPnJlbWFwLm5leHQgPSBOVUxMOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBB
ZGp1c3QgZm9yIHBhcnRpYWwgdW5iaW5kIGFmdGVyIHJlbW92aW4gVk1BIGZyb20KPiBWTSAqLwo+
IEBAIC0yMzY1LDYgKzIzNzUsNyBAQCBzdGF0aWMgaW50IHhlX3ZtYV9vcF9jb21taXQoc3RydWN0
IHhlX3ZtICp2bSwKPiBzdHJ1Y3QgeGVfdm1hX29wICpvcCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvcC0+YmFzZS5yZW1hcC51bm1hcC0+dmEtPnZh
LnJhbmdlID0gb3AtCj4gPnJlbWFwLnJhbmdlOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDC
oMKgwqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9HUFVWQV9PUF9VTk1BUDoKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByZXBfdm1hX2Rlc3Ryb3kodm0sIGdwdXZh
X3RvX3ZtYShvcC0+YmFzZS51bm1hcC52YSksCj4gdHJ1ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBvcC0+ZmxhZ3MgfD0gWEVfVk1BX09QX0NPTU1JVFRFRDsKCg==

